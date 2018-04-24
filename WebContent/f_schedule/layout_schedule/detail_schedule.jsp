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
         position:fixed; 
         right:20px; bottom:0px;

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
	<%String schedule_no = (String)request.getAttribute("schedule_no"); %>
	<%long detaildays = (long)request.getAttribute("detaildays")+1;
	MemberDTO member=(MemberDTO)session.getAttribute("loginUser");
	String mem_id=member.getMem_id();
	%>
	
		markers=new Array();
		polyline=null;
		<% for(int i=1;i<=detaildays;i++){%>
			placePosition<%=i%> = new Array();
			placeTitle<%=i%>=new Array();
			placeId<%=i%>=new Array();
			markers<%=i%>=new Array();
			placeImg<%=i%>=new Array();
			newplacePosition<%=i%> = new Array();
			newplaceTitle<%=i%>=new Array();
			newplaceId<%=i%>=new Array();
			newplaceImg<%=i%>=new Array();
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
					str+='<h4 style="float:left;margin-top:34px;" class="contentid">'+placeTitle<%=i%>[a]+'</h3>';
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
		function insert(){
			var dayString="";
			if(<%=data.size()%>>0){
				<%for(int i=1;i<=detaildays;i++){%>
				var mapx="";
				var mapy="";
				var title="";
				var image="";
				var contentId="";
				for(var a=0;a<newplacePosition<%=i%>.length;a++){
					var str=newplacePosition<%=i%>[a];
					var size=str.toString().length-2;
					var str2=str.toString().substr(1,size);
					mapy+=str2.split(", ")[0]+",";
					mapx+=str2.split(", ")[1]+",";
					title+=newplaceTitle<%=i%>[a]+",";
					image+=newplaceImg<%=i%>[a]+",";
					contentId+=newplaceId<%=i%>[a]+",";
				}
				dayString+="day<%=i%>::"+mapx+"::"+mapy+"::"+title+"::"+image+"::"+contentId;
			<%}%>
			}else{
				<%for(int i=1;i<=detaildays;i++){%>
					var mapx="";
					var mapy="";
					var title="";
					var image="";
					var contentId="";
					for(var j=0;j<placePosition<%=i%>.length;j++){
						var str=placePosition<%=i%>[j];
						var size=str.toString().length-2;
						var str2=str.toString().substr(1,size);
						mapy+=str2.split(", ")[0]+",";
						mapx+=str2.split(", ")[1]+",";
						title+=placeTitle<%=i%>[j]+",";
						image+=placeImg<%=i%>[j]+",";
						contentId+=placeId<%=i%>[j]+",";
					}
					dayString+="day<%=i%>::"+mapx+"::"+mapy+"::"+title+"::"+image+"::"+contentId;
				<%}%>
			}
			$("#daydata").val(dayString);
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
			$(document).on("click","h4",function(){
				var str=$(this).parent().parent().parent().parent().parent().attr("id").substring(0,1);
				if($(this).attr("class")=="nodedata"){
					$(this).parent().parent().remove();
					<%for(int i=1;i<=detaildays;i++){ %>
						if(str==<%=i%>){
							placePosition<%=i%>.splice(placePosition<%=i%>.indexOf($(this).parent().parent().children('.detailtours').children('.mycontentposition').text()),1);
							placeTitle<%=i%>.splice(placeTitle<%=i%>.indexOf($(this).parent().parent().children('.detailtours').children('.contentid').text()),1);
							newplacePosition<%=i%>.splice(newplacePosition<%=i%>.indexOf($(this).parent().parent().children('.detailtours').children('.mycontentposition').text()),1);
							newplaceTitle<%=i%>.splice(newplaceTitle<%=i%>.indexOf($(this).parent().parent().children('.detailtours').children('.contentid').text()),1);
							newplaceId<%=i%>.splice(newplaceId<%=i%>.indexOf($(this).parent().parent().children('.detailtours').children('.mycontent').text()),1);
							newplaceImg<%=i%>.splice(newplaceImg<%=i%>.indexOf($(this).parent().parent().children('.detailtours').children('img').attr('src')),1);
							insert();
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
							}else if(placePosition<%=i%>.length<=1){
								$("#"+<%=i%>+"daytab").children().children(".traffic").empty();
							}
						}
					<%}%>
				}else if($(this).attr("class")=="dbdata"){
					$(this).parent().parent().remove();
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
					<%for(int i=1;i<=detaildays;i++){ %>
						if(str==<%=i%>){
							var contentid=$(this).parent().parent().children().children('.mycontent').text();
							runDeleteAjax(<%=i%>,contentid);	
						}
					<%}%>
				}
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
			$(document).on("click","#mytrip",function() {
				var str="<div class='mytours'><div class='detailtours' style='float:left;width:90%;cursor:pointer;'>";
				str+="<img src='"+$(this).children().children('.img').attr("src")+"' style='width:100px;height:88px;float:left;'/>";
				str+='<h4 style="float:left; margin-top:34px; margin-left:10px;" class="contentid"><p data-toggle="tooltip" title="관광정보 조회">'+$(this).children('.title').text()+'</p></h4>';
				str+='<p style="display:none;" class="mycontent">'+$(this).children('.contentid').text()+'</p>';
				str+='<p style="display:none;" class="myposition">'+new daum.maps.LatLng($(this).children('.mapy').text(),$(this).children('.mapx').text())+'</p></div>';
				str+='<div class="deleteNode" style="float:left;margin:5px;">';
				str+='<h4 class="nodedata" style="margin-left:-2px;margin-top:23px;"><a data-toggle="tooltip" title="삭제"><img src="/webProject/f_schedule/img_schedule/cancle.png" style="cursor:pointer; width:30px; height:30px"/></a></h4></div>';
				str+='</div><p style="clear:both;"></p>';
				str+="</div>";
				<% for(int i=1;i<=detaildays;i++){%>
					if($("#"+<%=i%>+"daytab").attr("class")=="tab-pane fade active in"){
						$("#"+<%=i%>+"daytab").children().children(".myschedule").append(str);
						if(<%=data.size()%>>0){
							newplaceTitle<%=i%>.push($(this).children('.title').text());
							newplacePosition<%=i%>.push(new daum.maps.LatLng($(this).children('.mapy').text(),$(this).children('.mapx').text()));
							newplaceImg<%=i%>.push($(this).children().children('.img').attr("src"));
							newplaceId<%=i%>.push($(this).children('.contentid').text());
						}
						placeTitle<%=i%>.push($(this).children('.title').text());
						placePosition<%=i%>.push(new daum.maps.LatLng($(this).children('.mapy').text(),$(this).children('.mapx').text()));
						placeImg<%=i%>.push($(this).children().children('.img').attr("src"));
						placeId<%=i%>.push($(this).children('.contentid').text());
						insert();
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
		function runDeleteAjax(scheduleday,contentid){
			var xhr=new XMLHttpRequest();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					<%for(int i=1;i<=detaildays;i++){ %>
					if(scheduleday==<%=i%>){
						placePosition<%=i%>.splice(placePosition<%=i%>.indexOf($(this).parent().parent().children('.myposition').text()),1);
						placeTitle<%=i%>.splice(placePosition<%=i%>.indexOf($(this).parent().parent().children('h3').text()),1);
						for (var i = 0; i < placePosition<%=i%>.length; i ++) {
							var marker = new daum.maps.Marker({
						    	position: placePosition<%=i%>[i]
						    });
						    markers.push(marker);
						    marker.setMap(map);
						    map.setCenter(placePosition<%=i%>[i]);
						}
						polyline = new daum.maps.Polyline({
						    path: placePosition<%=i%>,
						    strokeWeight: 5,
						    strokeColor: '#FFAE00',
						    strokeOpacity: 1,
						    strokeStyle: 'solid'
						});
						polyline.setMap(map); 
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
						}else if(placePosition<%=i%>.length<=1){
							$("#"+<%=i%>+"daytab").children().children(".traffic").empty();
						}
					}
				<%}%>
				}
			}
			no = <%=schedule_no%>;
			xhr.open("GET","/webProject/schedule/deletedetail.do?scheduleno="+no+"&scheduleday="+scheduleday+"&contentid="+contentid,true);
			xhr.send();
		}
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
				str+='<td><img src='+tourlist.tourarr[i].firstimage+' style="margin-right:10px; margin-top:4px; width:50px; height:50px;" class="img"/></td>';
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
      
  <jsp:include page="/f_total/layout_total/top_layout.jsp"></jsp:include>

	<div class="col-sm-3">
	<h3 style="margin-top:95px"><img src="/webProject/f_schedule/img_schedule/scheduletitle.png" style="width:30px; height:auto; margin-left:50px; margin-top:-5px"> 일정 만들기</h3>
	<ul id="myTab" class="nav nav-tabs nav-justified" role="tablist" style="margin-top:20px;margin-left:50px;">
	  <li role="presentation" class="active"><a data-target="#search_tour" id="search_tour-tab" role="tab" data-toggle="tab" aria-controls="picked_tour" aria-expanded="true">관광지 검색</a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
	  <div role="tabpanel" class="tab-pane fade active in" id="search_tour" aria-labelledby="search_tour-tab" style="margin:20px">
	  	<!-- Search Form -->
        <form role="form" onsubmit="return false;">
        
        <!-- Search Field -->
            <div class="row"  style="overflow:auto; width:300px; height:350px; padding-left:25px; margin-left:30px;">
                <div class="form-group" >
                    <div class="input-group">
                        <div class="input-group-addon" style="width:30px; background-color:#ffffff; border-right-style:none;"><img src="/webProject/f_schedule/img_schedule/earth.png" style="width:20px; height:20px;"></div>
                        <input class="form-control" type="text" name="search" id="search"  style="margin-left:-1px; border-left-style:none;" placeholder="관광지명 or 축제명" required/>
                        <span class="input-group-btn">
                           <button type="button" class="btn btn-primary" id="ajaxbtn" style="width:50px;padding-left:5px;padding-right: 5px;margin-left:-1px;"><i class="glyphicon glyphicon-search" aria-hidden="true" style="margin-left:10px;"></i><span style="margin-left:10px;"></span></button>
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
		<h3 style="margin-top:148px"><img src="/webProject/f_schedule/img_schedule/scheduledetail.png" style="width:30px; height:auto; margin-left:40px; margin-top:-6px"> 지도/일정표</h3>
		<hr style="margin-top:-1px; width:750px;  margin-left:-260px;">
		<div>
		<div id="map" style="position: relative; z-index: 1;width:70%;height:350px; margin-left:30px;margin-bottom:50px;"></div>
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
	<ul id="scheduletab" class="nav nav-tabs nav-justified" role="tablist"  style="width:1100px; margin-left:70px;">
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
			<h3 style="margin-left:10px; margin-top:-10px;"><img src="/webProject/f_schedule/img_schedule/info.png" style="width:25px; height:auto; margin-left:37px; margin-top:-7px">교통정보</h3>
			<div class="traffic">
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

   <form method="post" name="mydataform" action="/webProject/schedule/detail/insert.do?detaildays=<%=detaildays %>&scheduleid=<%=schedule_no%>&mem_id=<%=mem_id%>">
	         <div class="well" id="jbMenu">
	         <p style="margin-top:-5px; font-size:12px; color:white;margin-bottom:20px;">일정을 저장해 주세요.
	         <input type="submit" value="저장" class="btn btn-default" id="insertbtn" style="width:50px; height:30px; font-size:12px;color:black; margin-top:-10px; margin-left:140px;"/></p>		
			 <input type="hidden" id="daydata"  name="daydata" value=""/>
			</div>	 
		</form>
   
<div style="margin-top:1000px;">

</div>
</body>
</html>