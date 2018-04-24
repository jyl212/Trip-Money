<%@page import="java.util.ArrayList"%>
<%@page import="tourist.dto.TourInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="/webProject/f_tourist/css_tourist/tourist.css" media="screen" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
</style> -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script> 
  <script type="text/javascript">
	mycode = "";
	function change_url(menuurl,url) {
		menupath = encodeURIComponent(menuurl);
		viewpath = encodeURIComponent(url);
		location.href = "/webProject/tourist/view2.html?menuurl=" + menupath
				+ "&url=" + viewpath;
	}

	function change_url2(menuurl, url) {
		menupath = encodeURIComponent(menuurl);
		viewpath = encodeURIComponent(url);
		location.href = "/webProject/tourist/view.html?menuurl=" + menupath
				+ "&url=" + viewpath;
	}
	

 	 function infodetail(no) {
 		//location.href="/webProject/tourist/tourlist.do?contentid="+no
		window.open("/webProject/tourist/tourlist.do?contentid="+no,"detail");  
 		/*  window.open("/webProject/f_tourist/layout_tourist/trip_detail_layout.jsp?contentid="+no,"detail");  */
 	 }
 	
 	/* String Checkname = ""; */
	$(document).ready(function(){	
		checkVal="";	
		$("#ajaxbtn").on("click",function(){//키워드 검색했을때 파싱된 결과를 뿌려주는 function
			//배열체크박스값을 빼서 data에 전달
			if(valueArr==""){
				valueArr = "";
				 /* alert("없네")  */
			}else{
				for (i = 0; i < valueArr.length; i++) {
					   //checkVal = valueArr[i].checked;
			    	 checkVal = checkVal+valueArr[i]+",";
					} 
				
			}
			
			/* alert(checkVal) */
			$.ajax({
				url:"/webProject/tourist/searchtour.do",
				type:"get",
				data:{"search":$("#search").val(),"city":checkVal},
				dataType:"json",
				success: success_run
			});	
		});
	
		
	});

	function success_run(tourlist){	
		size=tourlist.tourarr.length;
		$("#box").empty();
	if(size==0){
		$("#box2").html("해당자료가 없습니다.");
		$("#box3").html("검색어를 다시 입력바랍니다.");
	}else{
		$("#box2").empty();
		$("#box3").empty();
		//var str='<div>';	
		var str='';
		flag = "false";
		for(i=1;i<size;i++){
				
			str+='<div class="tourinfolistbox">';
			if(tourlist.tourarr[i].firstimage!=null){	
			str+='<img src='+tourlist.tourarr[i].firstimage+' class="touristimg"/><p class="tourtitle">'+tourlist.tourarr[i].title+'</p>';
			}else{
			str+='<img src="/webProject/f_tourist/img_tourist/logo_top.png" class="touristimg"/><p class="tourtitle">'+tourlist.tourarr[i].title+'</p>';
			}
			str+='<hr class="hrline">'
			str+='<p class="textin">자세히 보시려면 여기를 클릭해주세요. <img src="/webProject/f_tourist/img_tourist/find2.png" class="findimg"/></p>';
			str+='<input type="hidden" value='+tourlist.tourarr[i].contentid+' id="contentid"'+i+' class="no">';
			str+='</div>';
				
			}
			
		
		//str+='</div>';
	//	$("#box").empty();
		appendStr = $(str);
		$("#box").html(appendStr);
	
		$(".tourinfolistbox").on("click", function() { //tour검색 했을때 box에 걸리는 function
			if (flag == "false") {
				var no = $(this).closest("div").find(".no").val();
				infodetail(no);

			} else {
				flag = "true";
			}
		});
		
	}
	}
	var count=0;
	function change1(check){
		count += 1;
	    if(count%2==0){
	    	check.style.background = '#d9534f';
	    }else{
	    	 check.style.background = '#27a1db'; //좋아요 했을때
	    }
	}
	

</script>
</head>
<body>



	<div id="box"></div>
    <div id="box2" style="color:#27a1db;font-size: 18px;margin-left:250px;margin-top: 200px; "></div>
    <div id="box3" style="color:#27a1db;font-size: 18px;margin-left:220px;margin-top: 6px; "></div>
		
	
		
		

</body>
</html>