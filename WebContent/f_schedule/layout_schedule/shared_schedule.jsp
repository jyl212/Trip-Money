<%@page import="schedule.dto.ScheduleDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");  %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	
	<h3 style="margin-top:45px; margin-left: 5px;"><img src="/webProject/f_schedule/img_schedule/share_b.png" style="width:45px; height:auto; margin-left:40px; margin-top:-6px">공유 일정 </h3>
	<hr style="width:700px; margin-left: -430px;"/>

	<%ArrayList<ScheduleDTO> schedulelist = (ArrayList<ScheduleDTO>)request.getAttribute("list");
		int size = schedulelist.size();
	%>
	<%String schedule_no ="";
	  String title="";
	  String start_date = "";
	  String end_date = "";
	  int person = 0;
	  String update_date = "";
	  String schedule_share ="";
	%>
	<%for(int i =0 ; i< size; i++) {%>
	<% 	
		ScheduleDTO scheduledata = schedulelist.get(i);
		schedule_no = scheduledata.getSchedule_no()+"";
		start_date = scheduledata.getStart_date();
		start_date = start_date.substring(0,10);
		end_date = scheduledata.getEnd_date();
		end_date = end_date.substring(0,10);
		person = scheduledata.getPerson();
		title = scheduledata.getSchedule_title();
		schedule_share = scheduledata.getSchedule_share();
		update_date = scheduledata.getUpdate_date();
		update_date = update_date.substring(0,10);
		%>
		<%if(schedule_share.equals("Y")){ %>
			<table  style="border:black 2px solid; background-color:#f9f9f9;  width:700px;height: 150px; margin-left: 50px;">
		<tr>
			<td rowspan="2" style="background-repeat:no-repeat;  background-size:660px 240px; background-image:url('/webProject/f_schedule/img_schedule/back1.PNG');">
			<form class="detail" id="<%=schedule_no%>_<%=start_date%>_<%=end_date%>">
				<div style="text-align: center;">
					<span style="font-size:27px;display: inline;margin-top: -4px;">【여행 제목】</span><span style="font-size:27px; margin-top: 8px;color:#f9f9f9; display: inline;"> <%=title%></span>
					<p style="font-size:22px;margin-top: 3px;"><%=start_date%> ~ <%=end_date%></p>
					<p style="font-size:20px;margin-top: -5px;">인원 : <%=person%></p>				
					<p style="font-size:16px;margin-top: 3px;margin-left: 440px;">작성일 : <%=update_date%></p>
				</div>
			</form>
			</td>
			<td style="border:black 2px solid;background-color:#f9f9f9;width:80px;">
			
			<%if(schedule_share.equals("N")) {%>
				<div class=share1>
					<a href="#" data-toggle="modal" data-target="#update_schedule">
					<img src="/webProject/f_schedule/img_schedule/share.png"
					style="width:40px; height:40px; margin-left:20px; margin-left:20px;" /></a>		
					<input type="hidden" class=share_btn value="<%=schedule_no%>-<%=schedule_share%>-<%=title%>">
				</div>
				
			<%} else{%>
				<form name="share2" action="/webProject/schedule/updateshare.do" method="post">
					<input type="image" src="/webProject/f_schedule/img_schedule/no_share.png"
					id="<%=schedule_no%>-<%=schedule_share%>"
					style="width:40px; height:40px; margin-left:20px; " onclick="share_N()" />				
					<input type="hidden" name="share" value="<%=schedule_no%>-<%=schedule_share%>-<%=title%>">
				</form>
			<%} %>
			</td>
		</tr>
		</table>
		<hr style="width:700px; margin-left: -430px;"/>
		<%} %>
	<% }%>

</body>
</html>