<%@page import="schedule.dto.ScheduleDetailDTO"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.util.ArrayList"%>
<%@page import="schedule.service.ScheduleDetailServiceImpl"%>
<%@page import="schedule.service.ScheduleDetailService"%>
<%@page import="member.dto.MemberDTO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");  %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<style type="text/css">
	    .box {
			width: 300px;
			height: AUTO;
			border: 1px solid #009d55;
			border-radius: 5px;
			padding: 5px;
			margin: 5px;
			overflow-y: scroll;
		}
		#myTabContent{
			height:350px;
		}
		.trafficparent{
			width: 350px;
			height: AUTO;
			border: 1px solid #27a1db;
			border-radius: 5px;
			padding: 5px;
			margin-bottom: 5px;
			margin-top:5px;
			margin-left: 40px;
			cursor:pointer;
		}
		
		 .jbFixed {
        position: fixed;
        top: 0px;
      }
      #jbMenu{
         width:220px;
         height: 60px;
         margin-left: 1220px;
         background-color: #3b3b3b;
         margin-top:40px;
         position:fixed; right:20px; bottom:0px;

      }
      .mytours{
      width:650px;
      height:90px;
      border: solid 1px #eee;
      background-color: white;
      border-color: black;
      box-shadow: 5px 5px 15px gray;
      margin-top: 8px;
      }
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
	    $('[data-toggle="tooltip"]').tooltip();   
	});
	<%String schedule_no = (String)request.getParameter("scheduleNo"); %>
	<%int detaildays = Integer.parseInt(request.getParameter("days"));
	%>
	
		markers=new Array();
		polyline=null;
		<% for(int i=1;i<=detaildays;i++){%>
			placePosition<%=i%> = new Array();
			placeTitle<%=i%>=new Array();
			placeId<%=i%>=new Array();
			markers<%=i%>=new Array();
			placeImg<%=i%>=new Array();
		<%}%>
		function readyData(){
			<%ScheduleDetailService service = new ScheduleDetailServiceImpl();
				ArrayList<Vector<ScheduleDetailDTO>> data=service.select(schedule_no,(int)detaildays);
				if(data!=null){
					for(int i=0;i<data.size();i++){
						Vector<ScheduleDetailDTO> daydata=data.get(i);
						int day=i+1;
						for(int j=0;j<daydata.size();j++){
							ScheduleDetailDTO dayinfo=daydata.get(j);%>
							placePosition<%=day%>.push(new daum.maps.LatLng(<%=dayinfo.getMapy()%>,<%=dayinfo.getMapx()%>));
							placeTitle<%=day%>.push("<%=dayinfo.getTitle()%>");
							placeImg<%=day%>.push("<%=dayinfo.getImage()%>");
							placeId<%=day%>.push("<%=dayinfo.getContentid()%>");
						<%}
					}
				}
			%>
			<% for(int i=1;i<=detaildays;i++){%>
				var str="";
				for(var a=0;a<placeTitle<%=i%>.length;a++){
					str+="<div class='mytours'><div class='detailtours' style='float:left;width:90%;cursor:pointer;'>";
					str+="<img src='"+placeImg<%=i%>[a]+"'style='width:100px;height:88px;float:left;'/>";
					str+='<h4 style="float:left;" class="contentid">'+placeTitle<%=i%>[a]+'</h3>';
					str+='<p style="display:none;" class="mycontent">'+placeId<%=i%>[a]+'</p>';
					str+='<p style="display:none;" class="myposition">'+placePosition<%=i%>[a]+'</p></div>';
					str+='<div class="deleteNode" style="float:left;margin:5px;">'
					str+='<h4 class="dbdata" style="margin-left:-2px;margin-top:23px;"><a data-toggle="tooltip" title="삭제"><img src="/webProject/f_schedule/img_schedule/cancle.png" style="cursor:pointer; width:30px; height:30px"/></a></h4></div>';
					str+='<p style="clear:both;"></p>';
					str+="</div>";
				}
				$("#"+<%=i%>+"daytab").children().children(".myschedule").append(str);
				if(<%=i%>==1){
					for (var i = 0; i < placePosition<%=i%>.length; i ++) {
					    var marker = new daum.maps.Marker({
					    	position: placePosition<%=i%>[i]
					    });
					    markers.push(marker);
					    marker.setMap(map);
					    map.setCenter(placePosition<%=i%>[i]);
					}
					if(polyline){
						polyline.setMap(null);
						polyline=null;
					}
					polyline = new daum.maps.Polyline({
					    path: placePosition<%=i%>,
					    strokeWeight: 5,
					    strokeColor: '#FFAE00',
					    strokeOpacity: 1,
					    strokeStyle: 'solid'
					});
					polyline.setMap(map); 
				}
				if(placePosition<%=i%>.length>1){
					size=placePosition<%=i%>.length;
					$("#"+<%=i%>+"daytab").children().children(".traffic").empty();
					for(var j=0;j<size-1;j++){
						var sposition=placePosition<%=i%>[j];
						var eposition=placePosition<%=i%>[j+1];
						var stitle=placeTitle<%=i%>[j];
						var etitle=placeTitle<%=i%>[j+1];
						runAjax(sposition,eposition,stitle,etitle,<%=i%>);
					}
				}
			<%}%>
		}
		function change_url(menuurl, url){
			menupath = encodeURIComponent(menuurl);
			viewpath = encodeURIComponent(url);
			location.href="/webProject/schedule/view.html?menuurl="+menupath+"&url="+viewpath;
		}
		function infodetail(no) {
			window.open("/webProject/tourist/tourlist.do?contentid="+no,"detail");  
	 	 }
		$(document).ready(function(){
			readyData();
			$("#ajaxbtn").on("click",function(){
				$.ajax({
					url:"/webProject/schedule/searchtour.do",
					type:"get",
					data:{"search":$("#search").val()},
					dataType:"json",
					success:success_run
				});	
			});
			$("#scheduletab").children("li").on("click",function(){
				<%for(int i=1;i<=detaildays;i++){%>
					if($(this).children("a").attr("id")=="<%=i%>day"){
						if(markers.length>0){
							size=markers.length;
							for(var i=0;i<size;i++){
								markers[i].setMap(null);
							}
							for(var a=0;a<size;a++){
								markers.pop();
							}
							if(polyline){
								polyline.setMap(null);
								polyline=null;
							}
						}
						if(placePosition<%=i%>.length>0){
							for(var x=0;x<placePosition<%=i%>.length;x++){
								var marker = new daum.maps.Marker({
							    	position: placePosition<%=i%>[x]
							    });
							    markers.push(marker);
								marker.setMap(map);
							    map.setCenter(placePosition<%=i%>[x]);
							}
							polyline = new daum.maps.Polyline({
							    path: placePosition<%=i%>,
							    strokeWeight: 5,
							    strokeColor: '#FFAE00',
							    strokeOpacity: 1,
							    strokeStyle: 'solid'
							});
							polyline.setMap(map);
						}
					}
				<%}%>
			});
			$(document).on("click",".stateimg",function(){
				var img=$(this).attr("src");
				if(img=="/webProject/f_schedule/img_schedule/down.jpg"){
					$(this).parent().parent().children(".box").css({"display":"block"});
					$(this).attr("src","/webProject/f_schedule/img_schedule/up.jpg");
				}else{
					$(this).parent().parent().children(".box").css({"display":"none"});
					$(this).attr("src","/webProject/f_schedule/img_schedule/down.jpg");
				}
			});
			$(document).on("click",".detailtours",function(){
				infodetail($(this).children('.mycontent').text());
			});
		});
		function runAjax(sposition,eposition,stitle,etitle,tabindex) {
			var xhr=new XMLHttpRequest();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					var odsay=JSON.parse(xhr.responseText);
					if(odsay.odsay1!=null){
						var passtype="";
						var str="";
						str += "<div class='trafficparent'>";
						str += "<p  style='font-size: 13px; font-weight: bold;'>"+stitle+"->"+etitle+"<img class='stateimg' src='/webProject/f_schedule/img_schedule/down.jpg' style='float:right;width:20px;height:20px;'></p>";
						str += "<div class='box' style='display: none;'>";
						if(odsay.odsay1.trainType==null){
							str += "<p><img src='/webProject/f_schedule/img_schedule/bus.png' style='width:20px; height:20px;'/> : 시외버스</p>";
							str += "<p style='font-weight: bold;'>출발터미널 : " + odsay.odsay1.startSTN + "</p>";
							str += "<p style='font-weight: bold;'>도착터미널 : " + odsay.odsay1.endSTN + "</p>";
							str += "<p style='font-weight: bold;'>소요시간 : " + odsay.odsay1.totalTime + "분</p>";
							str += "<p style='font-weight: bold;'>금액 : " + odsay.odsay1.payment + "원</p><br/>";
						}else{
							str += "<p><img src='/webProject/f_schedule/img_schedule/train.png' style='width:20px; height:20px;'/> : "+ odsay.odsay1.trainType + "</p>";
							str += "<p style='font-weight: bold;'>출발역 : " + odsay.odsay1.startSTN + "</p>";
							str += "<p style='font-weight: bold;'>도착역 : " + odsay.odsay1.endSTN + "</p>";
							str += "<p style='font-weight: bold;'>소요시간 : " + odsay.odsay1.totalTime + "분</p>";
							str += "<p style='font-weight: bold;'>금액 : " + odsay.odsay1.payment + "원</p><br/>";
						}
						if(odsay.odsay2.type!=null){
							if(odsay.odsay2.type==1){
								str += "<p style='font-weight: bold;'><img src='/webProject/f_schedule/img_schedule/subway.png' style='width:20px; height:20px;'/> : ";
								var size=odsay.odsay2.subwaylist.length;
								for(var index=0;index<size;index++){
									if(odsay.odsay2.subwaylist[index].index==index){
										str += odsay.odsay2.subwaylist[index].subwayCode + "</p>";
										str += "<p style='font-weight: bold;'>경로정보</p>";
										var passsize=odsay.odsay2.subwaylist[index].passlist.length;
										for(var y=0;y<passsize;y++){
											str += "<p>" + odsay.odsay2.subwaylist[index].passlist[y] + "</p>";
										}
									}
								}
								str += "<p style='font-weight: bold;'>소요시간 : " + odsay.odsay2.totalTime + "분</p>";
								str += "<p style='font-weight: bold;'>금액 : " + odsay.odsay2.payment + "원</p>";
							}else if(odsay.odsay2.type==2){
								str += "<p style='font-weight: bold;'><img src='/webProject/f_schedule/img_schedule/bus.png' style='width:20px; height:20px;'/> : ";
								var bussize=odsay.odsay2.buslist.length;
								for(var index=0;index<bussize;index++){
									if(odsay.odsay2.buslist[index].index==index){
										str += odsay.odsay2.buslist[index].busNo + "번</p>";
										str += "<p style='font-weight: bold;'>경로정보</p>";
										buspasssize=odsay.odsay2.buslist[index].passlist.length;
										for(var y=0;y<buspasssize;y++){
											str += "<p>" + odsay.odsay2.buslist[index].passlist[y] + "</p>";
										}
									}
								}
								str += "<p style='font-weight: bold;'>소요시간 : " + odsay.odsay2.totalTime + "분</p>";
								str += "<p style='font-weight: bold;'>금액 : " + odsay.odsay2.payment + "원</p>";
								
							}else if(odsay.odsay2.type==3){
								var subsize=odsay.odsay2.subwaylist.length;
								var bussize=odsay.odsay2.buslist.length;
								var size=subsize+bussize;
								str += "<p><img src='/webProject/f_schedule/img_schedule/subway.png' style='width:20px; height:20px;'/>+<img src='/webProject/f_schedule/img_schedule/bus.png' style='width:20px; height:20px;'/> : </p>";
								for(var index=0;index<size;index++){
									for(var i=0;i<subsize;i++){
										if(odsay.odsay2.subwaylist[i].index==index){
											str += "<p style='font-weight: bold;'><img src='/webProject/f_schedule/img_schedule/subway.png' style='width:20px; height:20px;'/> : ";
											str += odsay.odsay2.subwaylist[i].subwayCode + "</p>";
											str += "<p style='font-weight: bold;'>경로정보</p>";
											passsize=odsay.odsay2.subwaylist[i].passlist.length;
											for(x=0;x<passsize;x++){
												str += "<p>" + odsay.odsay2.subwaylist[i].passlist[x] + "</p>";
											}
										}
									}
									for(var j=0;j<bussize;j++){
										if(odsay.odsay2.buslist[j].index==index){
											str += "<p style='font-weight: bold;'><img src='/webProject/f_schedule/img_schedule/bus.png' style='width:20px; height:20px;'/>";
											str += odsay.odsay2.buslist[j].busNo + "번</p>";
											str += "<p style='font-weight: bold;'>경로정보</p>";
											buspasssize=odsay.odsay2.buslist[j].passlist.length;
											for(y=0;y<buspasssize;y++){
												str += "<p>" + odsay.odsay2.buslist[j].passlist[y] + "</p>";
											}
										}
									}
								}
								str += "<p style='font-weight: bold;'>소요시간 : " + odsay.odsay2.totalTime + "분</p>";
								str += "<p style='font-weight: bold;'>금액 : " + odsay.odsay2.payment + "원</p>";
								str += "<p style='font-weight: bold;'>총 소요시간 : " + (parseInt(odsay.odsay1.totalTime)+parseInt(odsay.odsay2.totalTime)) + "분</p>";
								str += "<p style='font-weight: bold;'>총 금액 : " + (parseInt(odsay.odsay1.payment)+parseInt(odsay.odsay2.payment)) + "원</p><br/>";
								str += "</div>";
							}
								
						}
						str += "</div>";
						print(str,tabindex);
					}else{
						var passtype="";
						var str="";
						var type=odsay.type;
						str += "<div class='trafficparent'>";
						str += "<p  style='font-size: 13px; font-weight: bold;'>"+stitle+"->"+etitle+"<img class='stateimg' src='/webProject/f_schedule/img_schedule/down.jpg' style='float:right;width:20px;height:20px;'></p>";
						str += "<div class='box' style='display: none;'>";
						if(type==1){
							str += "<p style='font-weight: bold;'><img src='/webProject/f_schedule/img_schedule/subway.png' style='width:20px; height:20px;'/> : ";
							var size=odsay.subwaylist.length;
							for(var index=0;index<size;index++){
								if(odsay.subwaylist[index].index==index){
									str += odsay.subwaylist[index].subwayCode + "</p>";
									str += "<p style='font-weight: bold;'>경로정보</p>";
									var passsize=odsay.subwaylist[index].passlist.length;
									for(var y=0;y<passsize;y++){
										str += "<p>" + odsay.subwaylist[index].passlist[y] + "</p>";
									}
								}
							}
							str += "<p style='font-weight: bold;'>소요시간 : " + odsay.totalTime + "분</p>";
							str += "<p style='font-weight: bold;'>총금액 : " + odsay.payment + "원</p>";
							str += "</div>";
						}else if(type==2){
							str += "<p style='font-weight: bold;'><img src='/webProject/f_schedule/img_schedule/bus.png' style='width:20px; height:20px;'/> : ";
							var bussize=odsay.buslist.length;
							for(var index=0;index<bussize;index++){
								if(odsay.buslist[index].index==index){
									str += odsay.buslist[index].busNo + "번</p>";
									str += "<p style='font-weight: bold;'>경로정보</p>";
									buspasssize=odsay.buslist[index].passlist.length;
									for(var y=0;y<buspasssize;y++){
										str += "<p>" + odsay.buslist[index].passlist[y] + "</p>";
									}
								}
							}
							str += "<p style='font-weight: bold;'>소요시간 : " + odsay.totalTime + "분</p>";
							str += "<p style='font-weight: bold;'>총금액 : " + odsay.payment + "원</p>";
							str += "</div>";
						}else if(type==3){
							str += "<p><img src='/webProject/f_schedule/img_schedule/subway.png' style='width:20px; height:20px;'/>+<img src='/webProject/f_schedule/img_schedule/bus.png' style='width:20px; height:20px;'/> : </p>";
							var subsize=odsay.subwaylist.length;
							var bussize=odsay.buslist.length;
							var size=subsize+bussize;
							for(var index=0;index<size;index++){
								for(var i=0;i<subsize;i++){
									if(odsay.subwaylist[i].index==index){
										str += "<p style='font-weight: bold;'><img src='/webProject/f_schedule/img_schedule/subway.png' style='width:20px; height:20px;'/> : ";
										str += odsay.subwaylist[i].subwayCode + "</p>";
										str += "<p style='font-weight: bold;'>경로정보</p>";
										passsize=odsay.subwaylist[i].passlist.length;
										for(x=0;x<passsize;x++){
											str += "<p>" + odsay.subwaylist[i].passlist[x] + "</p>";
										}
									}
								}
								for(var j=0;j<bussize;j++){
									if(odsay.buslist[j].index==index){
										str += "<p style='font-weight: bold;'><img src='/webProject/f_schedule/img_schedule/bus.png' style='width:20px; height:20px;'/> : ";
										str += odsay.buslist[j].busNo + "번</p>";
										str += "<p style='font-weight: bold;'>경로정보</p>";
										buspasssize=odsay.buslist[j].passlist.length;
										for(y=0;y<buspasssize;y++){
											str += "<p>" + odsay.buslist[j].passlist[y] + "</p>";
										}
									}
								}
							}
							str += "<p style='font-weight: bold;'>소요시간 : " + odsay.totalTime + "분</p>";
							str += "<p style='font-weight: bold;'>총금액 : " + odsay.payment + "원</p>";
							str += "</div>";
							str += "</div>";
						}
						print(str,tabindex);
					}
				}
				
			}
			xhr.open("GET","/webProject/schedule/getodsay.do?sposition="+sposition+"&eposition="+eposition,true);
			xhr.send();
		}
		function print(str,tabindex){
			$("#"+tabindex+"daytab").children().children(".traffic").append(str);
		}
		
		
	
  	</script>
</head>
<body>
      
	<div class="col-sm-12">
		<h3 style="margin-top:50px"><img src="/webProject/f_schedule/img_schedule/scheduledetail.png" style="width:30px; height:auto; margin-left:120px; margin-top:-6px"> 지도/일정표</h3>
		<hr style="margin-top:-1px; width:1080px;  margin-left:-130px;">
		<div>
		<div id="map" style="position: relative; z-index: 1;width:75%;height:350px; margin-left:120px;margin-bottom:50px;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95769d6fd03edf67b1d3830c9e665c5a"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 9 // 지도의 확대 레벨 
		    }; 
		
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		</script>	
		
		</div>
	</div>
	<ul id="scheduletab" class="nav nav-tabs nav-justified" role="tablist"  style="width:1100px; margin-left:120px;">
	<% for(int i=1;i<=detaildays;i++){
		if(i==1){%>
			<li role="presentation" class="active"><a data-target="#<%=i%>daytab" id="<%=i%>day" role="tab" data-toggle="tab" aria-controls="<%=i%>day" aria-expanded="true"><%= i %>day</a></li>
		<% }else{%>
		<li role="presentation" class=""><a data-target="#<%=i%>daytab" id="<%=i%>day" role="tab" data-toggle="tab" aria-controls="<%=i%>day" aria-expanded="true"><%= i %>day</a></li>
	<% 
		}		
	} %>
	</ul>
	
	<div id="scheduleTabContent" class="tab-content" style="margin-bottom: 1000px;">
	<% for(int j=1;j<=detaildays;j++){ 
		if(j==1){
	%>	
	<div role="tabpanel" class="tab-pane fade active in" id="<%=j%>daytab" aria-labelledby="<%=j%>day" style="margin:20px;width:100%;">   
	  	<div class="col-sm-4" style="float:left;">
			<h3 style="margin-left:10px; margin-top:-10px;"><img src="/webProject/f_schedule/img_schedule/info.png" style="width:25px; height:auto; margin-left:80px; margin-top:-7px">교통정보</h3>
			<div class="traffic" style="margin-left:45px;">
			</div>
		</div>
		<div class="col-sm-8" style="float:left;">
			<div class="myschedule">
				<h3 style="margin-left:-30px; margin-top:-10px;"><img src="/webProject/f_schedule/img_schedule/schedule.png" style="width:25px; height:auto; margin-left:37px; margin-top:-7px">일정</h3>
			</div>
	  	</div>
	 </div>
	 <%}else{ %>
	  <div role="tabpanel" class="tab-pane fade" id="<%=j%>daytab" aria-labelledby="<%=j%>day" style="margin:20px;width:100%;">   
	  	<div class="col-sm-4" style="float:left;">
			<h3 style="margin-left:10px; margin-top:-10px;"><img src="/webProject/f_schedule/img_schedule/info.png" style="width:25px; height:auto; margin-left:37px; margin-top:-7px">교통정보</h3>
			<div class="traffic">
			</div>
		</div>
		<div class="col-sm-8" style="float:left;">
			<div class="myschedule">
				<h3 style="margin-left:-10px; margin-top:-10px;"><img src="/webProject/f_schedule/img_schedule/schedule.png" style="width:25px; height:auto; margin-left:37px; margin-top:-7px">일정</h3>
			</div>
	  	</div>
	 </div>
	<% }
	}%>
	</div>
</body>
</html>