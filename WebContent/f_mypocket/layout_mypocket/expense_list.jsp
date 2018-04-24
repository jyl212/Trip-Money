<%@page import="mypocket.service.MyPocketServiceImpl"%>
<%@page import="mypocket.service.MyPocketService"%>
<%@page import="member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="/webProject/f_mypocket/css_mypocket/style.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="/webProject/f_mypocket/js_mypocket/Filechose.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95769d6fd03edf67b1d3830c9e665c5a"></script>

<style type="text/css">
.customoverlay {
	position: relative;
	bottom: 50px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
    float: left; 
}

.customoverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.customoverlay .title {
	display: block;
	text-align: center;
	background: #fff;
 	margin-right: 0px; 
 	padding: 10px 15px; 
	font-size: 14px;
	font-weight: bold;
}

.customoverlay:after {
	content: '';
	position: absolute; 
	margin-left: -12px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

img {
	width: 100px;
	height: 100px;
}
/* .bagimg{
background-image: url(/webProject/f_mypocket/img_mypocket/sky.jpg);  
no-repeat center center fixed;
-webkit-background-size: cover;
-moz-background-size: cover;
-o-background-size: cover;
background-size: cover;
} */
</style>
</head>

<body class="bagimg">
	<%
		String scheduleNo = (String) session.getAttribute("scheduleNo");
		String start_date = (String) session.getAttribute("start_date");
		String end_date = (String) session.getAttribute("end_date");

		long days = (long) session.getAttribute("days");

		MemberDTO user = (MemberDTO) session.getAttribute("loginUser");
		String mem_id = "";
		if (user != null) {
			mem_id = user.getMem_id();
		} else {
			mem_id = "guest";
		}
	%>

	<div class="col-sm-3" style="margin-top :50px;">
		<ul id="myTab" class="nav nav-tabs nav-justified" role="tablist">

			<li role="presentation" class="active"><a data-target="#list"
				id="b_together_tab" role="tab" data-toggle="tab"
				aria-controls="b_together" aria-expanded="true">공금</a></li>

			<li role="presentation" class=""><a data-target="#list"
				role="tab" id="b_private_tab" data-toggle="tab"
				aria-controls="b_private" aria-expanded="false">개인</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div role="tabpanel" class="tab-pane fade active in" id="list"
				aria-labelledby="list_tab">
				<input type="text" id="expenseFlag" name="expenseFlag" />
				<div id="result"></div>
				<button class="btn btn-default" type="button" id="anothersch" style="margin-top: 20px;margin-left: -5px; background-color:#27a1db; color:white;">다른 일정 선택</button>
			</div>
		</div>
	</div>

	<form id="postform" action="/webProject/mypocket/pop.do" method="Post">
		<input type="hidden" id="img" name="img" /> <input type="hidden"
			id="title" name="title" /> <input type="hidden" id="price"
			name="price" /> <input type="hidden" id="note" name="note" />
	</form>

	<div class="col-sm-9" style="margin-top: 50px;">
		<div id="map" style="width: 100%; height: 400px;"></div>
	</div>
	<div>
		<div class="input-group-btn">
			<select class="form-control" name="days" id="days"
				style="width: 100px; font-size:12px; border-radius: 15px;margin-top: 20px;" onclick="selectdays()">
				<option>전체</option>
				<%for (int i = 1; i <= days; i++) {%>
				<option><%=i%>일차</option>
				<%}%>
			</select>
		</div>
		<div id="dayresult" style="margin-top: 20px;"></div>
	</div>

	<script>
	function selectdays(){
		$.ajax({
			url : "/webProject/mypocket/expense/list.do",
			type : "post",
			data : {"scheduleNo":<%=scheduleNo%>,
					"budget_flag":$("#expenseFlag").val(),
					"days":$("#days option:selected").val()
					},
			dataType : "json",
			success : success_run
		});
	}
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	
	mapOption = {
		center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption);
	
	// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
	markers = new Array();	
	points = new Array();
	
	// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다	
    var content = "";
	
	function addMarker(position) {	
		//마커생성
	    var marker = new daum.maps.Marker({
	        position: position
	    });
		//지도에 마커 표시
	    marker.setMap(map);
	    markers.push(marker);
	    
	    var customOverlay = new daum.maps.CustomOverlay({
		    map: map,
		    position: position,
		    content: content,
		    yAnchor: 1 
		});
	}
	
	var bounds = new daum.maps.LatLngBounds();    

	function setBounds() {
	    map.setBounds(bounds);
	}
	
	function removeMarker() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}
	
	$(document).ready(function(){	
		$("#expenseFlag").hide();
		$("#expenseFlag").val(0);		
		
		$.ajax({
			url : "/webProject/mypocket/expense/list.do",
			type : "post",
			data : {"scheduleNo":<%=scheduleNo%>,
					"budget_flag":$("#expenseFlag").val()
					},
			dataType : "json",
			success : success_run
		});
		
		$("#b_together_tab").on("click",function(){
	 		$("#expenseFlag").val(0);
			$("#days").val("전체");
			
	 		$.ajax({
				url : "/webProject/mypocket/expense/list.do",
				type : "post",
				data : {"scheduleNo":<%=scheduleNo%>,
						"budget_flag":$("#expenseFlag").val()
						},
				dataType : "json",
				success : success_run
			});
	 	});
		$("#b_private_tab").on("click",function(){
	 		$("#expenseFlag").val(1);		
			$("#days").val("전체");
			
	 		$.ajax({
				url : "/webProject/mypocket/expense/list.do",
				type : "post",
				data : {"scheduleNo":<%=scheduleNo%>,
						"budget_flag":$("#expenseFlag").val()
						},
				dataType : "json",
				success : success_run
			});
	 	});
	});
	
	function success_run(expense){
		//infowindow지우기
		$(".customoverlay").remove();
		
		//마커를 지도에서 지우고, 마커 배열에서도 삭제
		if(markers.length>0){
			var size = markers.length;
			for (var i = 0; i < size; i++) {
				markers[i].setMap(null);				
			}
			removeMarker();
		}
		//포인트 배열에서 삭제.
		if(points.length>0){
			var psize = points.length;
			for (var i = 0; i < psize; i++) {
				points.pop();
			}
			points=[];
		}
		
		
		/* size = expense.expenselist.length;
		$("#result").empty(); */
		$("#dayresult").empty();
		
		/* var str='<table class="table" style="text-align: center;"><tr><th style="text-align: center;">항목</th><th style="text-align: center;">예산</th><th style="text-align: center;">지출</th>';		 */
		var str2='<table class="table" style="text-align: center;"><tr><th style="text-align: center;">날짜</th><th style="text-align: center;">위치</th><th style="text-align: center;">항목</th><th style="text-align: center;">지출금액</th><th style="text-align: center;">보기</th><th style="text-align: center;">삭제</th>';
		/* for (var i = 0; i < size; i++) {
			str += '<tr><td class="kindname">'+expense.expenselist[i].kind+'</td>';
			str += '<td>'+expense.expenselist[i].bprice+'</td>';
			str += '<td>'+expense.expenselist[i].eprice+'</td>';
			str += '</div>'
		}
		str += '</table>'
		$("#result").html(str); */
		
		size = expense.expensealllist.length;
		flag = expense.expensealllist[0].expense_flag;
		
		for (i = 0; i < size; i++) {
			var strdetail = "'"+expense.expensealllist[i].img+"','"+expense.expensealllist[i].title+"','"+expense.expensealllist[i].price+"','"+expense.expensealllist[i].note+"'";
			str2 += '<tr><td>'+expense.expensealllist[i].day+'</td>';
			str2 += '<td>'+expense.expensealllist[i].title+'</td>';
			str2 += '<td  class="allkindname">'+expense.expensealllist[i].kind+'</td>';
			str2 += '<td>'+expense.expensealllist[i].price+'</td>';
			str2 += '<td><a href="javascript:opendetail('+strdetail+')">상세보기</a></td>';
			str2 += '<td><a href="/webProject/mypocket/expense/delete.do?expense_no='+expense.expensealllist[i].expense_no+'">삭제</a></td>';
			str2 += '</div>'
		}
		str2 += '</table>'
		$("#dayresult").html(str2);
		
		for (i = 0; i < size; i++) {			
			if(expense.expensealllist[i].title!=null&&expense.expensealllist[i].img!=null){
				content = '<div class="customoverlay">' +
			    '    <span class="title">'+expense.expensealllist[i].title+'<img src="/webProject/f_mypocket/upload/'+expense.expensealllist[i].img+'">'+'</span>' +
			    '</a></div>';					
			}else if(expense.expensealllist[i].title!=null){
				content = '<div class="customoverlay">' +
			    '    <span class="title">'+expense.expensealllist[i].title+'</span></div>';
			}else if(expense.expensealllist[i].img!=null){
				content = '<div class="customoverlay">' +'<img src="/webProject/f_mypocket/upload/'+expense.expensealllist[i].img+'">'+'</div>';
			}
			
			if(expense.expensealllist[i].ynode!=null&&expense.expensealllist[i].xnode!=null){
				addMarker(new daum.maps.LatLng(expense.expensealllist[i].ynode, expense.expensealllist[i].xnode));				
				points.push(new daum.maps.LatLng(expense.expensealllist[i].ynode, expense.expensealllist[i].xnode));			

				for (j = 0; j < points.length; j++) {
				    bounds.extend(points[j]);
				}	
		 		setBounds();					
			}	
		}
	}
	
	function opendetail(img,title,price,note){
	      $("#img").val(img);
	      $("#title").val(title);
	      $("#price").val(price);
	      $("#note").val(note);
	      
	      var myform=document.getElementById("postform");
	      var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=500, height=700, top=0,left=20"; 
	    
	      window.open("", title,status); 
	      myform.target = title;
	      myform.submit();      
	   }
	
	$("#anothersch").on("click",function(){
		location.href = "/webProject/loginfilter/schedule/listSchedule.do?STATE=mypocket&mem_id=<%=mem_id%>";
	});
	
	</script>
</body>
</html>