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
	<style type="text/css">
	    .box {
			width: 350px;
			height: AUTO;
			border: 1px solid green;
			border-radius: 5px;
			padding: 5px;
			margin: 5px;
			overflow-y: scroll;
		}
		#myTabContent{
			height:350px;
		}
		.trafficparent{
			width: 400px;
			height: AUTO;
			border: 2px solid blue;
			border-radius: 5px;
			padding: 5px;
			margin: 5px;
		}
	</style>
	<script type="text/javascript">
	<%String schedule_no = (String)request.getAttribute("schedule_no"); %>
	<%long detaildays = (long)request.getAttribute("detaildays")+1;
	MemberDTO member=(MemberDTO)session.getAttribute("loginUser");
	String mem_id=member.getMem_id();
	%>
	
		markers=new Array();
		polyline=null;
		<% for(int i=1;i<=detaildays;i++){%>
			day<%=i%>mapx="";
			day<%=i%>mapy="";
			day<%=i%>title="";
			day<%=i%>image="";
			day<%=i%>contentid="";
			placePosition<%=i%> = new Array();
			placeTitle<%=i%>=new Array();
			placeId<%=i%>=new Array();
			markers<%=i%>=new Array();
			placeImg<%=i%>=new Array();
		<%}%>
		function insert(){
			var dayString="";
			<%for(int i=1;i<=detaildays;i++){%>
				var mapx=day<%=i%>mapx;
				var mapy=day<%=i%>mapy;
				var title=day<%=i%>title;
				var image=day<%=i%>image;
				var contentId=day<%=i%>contentid;
				dayString+="day<%=i%>::"+mapx+"::"+mapy+"::"+title+"::"+image+"::"+contentId;
			<%}%>
			$("#daydata").val(dayString);
		}	
		function readyData(){
			<%ScheduleDetailService service = new ScheduleDetailServiceImpl();
				ArrayList<Vector<ScheduleDetailDTO>> data=service.select(schedule_no,(int)detaildays);
				if(data!=null){
					for(int i=0;i<data.size();i++){
						Vector<ScheduleDetailDTO> daydata=data.get(i);
						int day=i+1;
						System.out.println(day);
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
					str+="<div class='mytours'>";
					str+="<img src='"+placeImg<%=i%>[a]+"'style='width:80px;height:80px;float:left;'/>";
					str+='<h3 style="float:left;">'+placeTitle<%=i%>[a]+'</h3>';
					str+='<p style="display:none;" class="mycontent">'+$(this).children('.contentid').text()+'</p>';
					str+='<p style="clear:both;"></p>';
					str+="</div>";
				}
				$("#"+<%=i%>+"daytab").children().children(".myschedule").append(str);
				for (var i = 0; i < placePosition<%=i%>.length; i ++) {
				    var marker = new daum.maps.Marker({
				    	position: placePosition<%=i%>[i]
				    });
				    markers.push(marker);
				    marker.setMap(map);
				    map.setCenter(placePosition<%=i%>[i]);
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
			$(document).on("click",".mytours",function(){
				infodetail($(this).children('.mycontent').text());
			});
			$(document).on("click","#mytrip",function() {
				var str="<div class='mytours'>";
				str+="<img src='"+$(this).children().children('.img').attr("src")+"' style='width:80px;height:80px;float:left;'/>";
				str+='<h3 style="float:left;">'+$(this).children('.title').text()+'</h3>';
				str+='<p style="clear:both;"></p>';
				str+='<p style="display:none;" class="mycontent">'+$(this).children('.contentid').text()+'</p>';
				str+="</div>";
				insert();
				<% for(int i=1;i<=detaildays;i++){%>
					if($("#"+<%=i%>+"daytab").attr("class")=="tab-pane fade active in"){
						$("#"+<%=i%>+"daytab").children().children(".myschedule").append(str);
						placeTitle<%=i%>.push($(this).children('.title').text());
						placePosition<%=i%>.push(new daum.maps.LatLng($(this).children('.mapy').text(),$(this).children('.mapx').text()));
						placeImg<%=i%>.push($(this).children().children('.img').attr("src"));
						day<%=i%>mapx+=$(this).children('.mapx').text()+",";
						day<%=i%>mapy+=$(this).children('.mapy').text()+",";
						day<%=i%>title+=$(this).children('.title').text()+",";
						day<%=i%>image+=$(this).children().children('.img').attr("src")+",";
						day<%=i%>contentid+=$(this).children('.contentid').text()+",";
						for (var i = 0; i < placePosition<%=i%>.length; i ++) {
						    var marker = new daum.maps.Marker({
						    	position: placePosition<%=i%>[i]
						    });
						    markers.push(marker);
						    marker.setMap(map);
						    map.setCenter(placePosition<%=i%>[i]);
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
					}
				<%}%>
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
						str += "<p  style='font-size: 15px; font-weight: bold;'>"+stitle+"->"+etitle+"<img class='stateimg' src='/webProject/f_schedule/img_schedule/down.jpg' style='float:right;width:30px;height:30px;'></p>";
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
								str += "<p><img src='/webProject/f_schedule/img_schedule/subway.png' style='width:20px; height:20px;'/>+<img src='/webProject/f_schedule/img_schedule/bus.png' style='width:20px; height:20px;'/></p>";
								for(var index=0;index<size;index++){
									for(var i=0;i<subsize;i++){
										if(odsay.odsay2.subwaylist[i].index==index){
											str += "<p style='font-weight: bold;'><img src='/webProject/f_schedule/img_schedule/subway.png' style='width:20px; height:20px;'/>";
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
						str += "<p  style='font-size: 15px; font-weight: bold;'>"+stitle+"->"+etitle+"<img class='stateimg' src='/webProject/f_schedule/img_schedule/down.jpg' style='float:right;width:30px;height:30px;'></p>";
						str += "<div class='box' style='display: none;'>";
						if(type==1){
							str += "<p style='font-weight: bold;'><img src='/webProject/f_schedule/img_schedule/subway.png' style='width:20px; height:20px;'/>";
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
							str += "<p style='font-weight: bold;'><img src='/webProject/f_schedule/img_schedule/bus.png' style='width:20px; height:20px;'/>";
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
							str += "<p><img src='/webProject/f_schedule/img_schedule/subway.png' style='width:20px; height:20px;'/>+<img src='/webProject/f_schedule/img_schedule/bus.png' style='width:20px; height:20px;'/></p>";
							var subsize=odsay.subwaylist.length;
							var bussize=odsay.buslist.length;
							var size=subsize+bussize;
							for(var index=0;index<size;index++){
								for(var i=0;i<subsize;i++){
									if(odsay.subwaylist[i].index==index){
										str += "<p style='font-weight: bold;'><img src='/webProject/f_schedule/img_schedule/subway.png' style='width:20px; height:20px;'/>";
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
										str += "<p style='font-weight: bold;'><img src='/webProject/f_schedule/img_schedule/bus.png' style='width:20px; height:20px;'/>";
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
		function addmarker(){
			var marker = new daum.maps.Marker({
			    position: markerPosition
			});
			
			return marker;
		}
		function success_run(tourlist){
			size=tourlist.tourarr.length;
			$("#tourlist").empty();
			var str='<table>';
			for(i=0;i<size;i++){
				str+='<tr style="cursor:pointer;" id="mytrip">';
				str+='<td><img src='+tourlist.tourarr[i].firstimage+' style="width:50px; height:50px;" class="img"/></td>';
				str+='<td class="title">'+tourlist.tourarr[i].title+'</td>';
				str+='<td style="display:none;" class="mapx">'+tourlist.tourarr[i].mapx+'</td>';
				str+='<td style="display:none;" class="mapy">'+tourlist.tourarr[i].mapy+'</td>';
				str+='<td style="display:none;" class="cat3">'+tourlist.tourarr[i].cat3+'</td>';
				str+='<td style="display:none;" class="areacode">'+tourlist.tourarr[i].areacode+'</td>';
				str+='<td style="display:none;" class="contentid">'+tourlist.tourarr[i].contentid+'</td>';
				str+='</tr>';
			}
			str+='</table>';
			$("#tourlist").append(str);
		}
		function print(str,tabindex){
			$("#"+tabindex+"daytab").children().children(".traffic").append(str);
		}
		
  	</script>
</head>
<body>
	<div class="col-sm-3">
	<h3>일정 만들기</h3>
	<ul id="myTab" class="nav nav-tabs nav-justified" role="tablist">
	  <li role="presentation" class="active"><a data-target="#search_tour" id="search_tour-tab" role="tab" data-toggle="tab" aria-controls="picked_tour" aria-expanded="true">관광지 검색</a></li>
	  <li role="presentation" class=""><a data-target="#picked_tour" role="tab" id="picked_tour-tab" data-toggle="tab" aria-controls="search_tour" aria-expanded="false">찜한 관광지</a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
	  <div role="tabpanel" class="tab-pane fade active in" id="search_tour" aria-labelledby="search_tour-tab" style="margin:20px">
	  	<!-- Search Form -->
        <form role="form">
        
        <!-- Search Field -->
            <div class="row"  style="overflow:auto; width:300px; height:350px;">
                <div class="form-group">
                    <div class="input-group">
                        <input class="form-control" type="text" name="search" id="search" placeholder="관광지명 or 축제명" required/>
                        <span class="input-group-btn">
                           <input type="button" class="btn btn-success" id="ajaxbtn"/><span class="glyphicon glyphicon-search" aria-hidden="true"></span><span style="margin-left:10px;"></span>
                        </span>
                    </div>
                    <div class="input-group" id="tourlist">
							
                    </div>
                </div>
            </div>    
        </form>
	  </div>
	  <div role="tabpanel" class="tab-pane fade" id="picked_tour" aria-labelledby="picked_tour-tab" style="margin:20px">
		        
	  </div>
	</div>
	</div>
	<div class="col-sm-9">
		<h1>일정 상세</h1>
		<hr/>
		<div>
		<div id="map" style="position: relative; z-index: 1;width:90%;height:350px; margin:auto;"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95769d6fd03edf67b1d3830c9e665c5a"></script>
		<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 12 // 지도의 확대 레벨 
		    }; 
		
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		</script>
		<form method="post" name="mydataform" action="/webProject/schedule/detail/insert.do?detaildays=<%=detaildays %>&scheduleid=<%=schedule_no%>&mem_id=<%=mem_id%>">
			<a href="/webProject/f_schedule/schedule_index.jsp"><input type="button" value="수정"/></a>
			<input type="submit" value="확인" id="insertbtn"/>
			<input type="hidden" id="daydata"   name="daydata" value=""/>
		</form>
		</div>
	</div>
	<ul id="scheduletab" class="nav nav-tabs nav-justified" role="tablist">
	<% for(int i=1;i<=detaildays;i++){
		if(i==1){%>
			<li role="presentation" class="active"><a data-target="#<%=i%>daytab" id="<%=i%>day" role="tab" data-toggle="tab" aria-controls="<%=i%>day" aria-expanded="true"><%= i %>day</a></li>
		<% }else{%>
		<li role="presentation" class=""><a data-target="#<%=i%>daytab" id="<%=i%>day" role="tab" data-toggle="tab" aria-controls="<%=i%>day" aria-expanded="true"><%= i %>day</a></li>
	<% 
		}		
	} %>
	</ul>
	<div id="scheduleTabContent" class="tab-content">
	<% for(int j=1;j<=detaildays;j++){ 
		if(j==1){
	%>
	<div role="tabpanel" class="tab-pane fade active in" id="<%=j%>daytab" aria-labelledby="<%=j%>day" style="margin:20px;width:100%;">   
	  	<div class="col-sm-4" style="float:left;">
			<h2>교통정보</h2>
			<div class="traffic">
			</div>
		</div>
		<div class="col-sm-8" style="float:left;">
			<div class="myschedule">
				<h2>일정</h2>
			</div>
	  	</div>
	 </div>
	 <%}else{ %>
	  <div role="tabpanel" class="tab-pane fade" id="<%=j%>daytab" aria-labelledby="<%=j%>day" style="margin:20px;width:100%;">   
	  	<div class="col-sm-4" style="float:left;">
			<h2>교통정보</h2>
			<div class="traffic">
			</div>
		</div>
		<div class="col-sm-8" style="float:left;">
			<div class="myschedule">
				<h2>일정</h2>
			</div>
	  	</div>
	 </div>
	<% }
	}%>
	</div>

</body>
</html>