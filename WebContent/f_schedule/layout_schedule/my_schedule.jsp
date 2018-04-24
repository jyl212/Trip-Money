<%@page import="java.util.ArrayList"%>
<%@page import="schedule.dto.ScheduleDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");  %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<script type="text/javascript">
		function change_url2(scheduleNo, url){
			scheduleNo = encodeURIComponent(scheduleNo);
			viewpath = encodeURIComponent(url);
			location.href="/webProject/schedule/detailview.html?scheduleNo="+scheduleNo+"&url="+viewpath;
		}
		
		function share_N(){
			window.document.share2.submit();
		}
		
		function share_Y(){
			
			window.document.share_form.submit();
		}
		
		$(document).ready(function(){
			
			$(".detail").on("click",function(){			
				var days = $(this).attr("id");
				location.href="/webProject/schedule/detailview.do?days="+days;
			});
			
			$(".delete").on("click",function(){			
				var del_no = $(this).attr("id");
				location.href="/webProject/schedule/delete.do?del_no="+del_no;
			});
			
			$(".share1").on("click",function(){
				var data = $(this).find(".share_btn").val();
				
				schedule_no = data.split("-")[0];
				schedule_share = data.split("-")[1];
				title = data.split("-")[2];
				$("#schedule_title").val(title);
				$("#schedule_data").val(data);
				
				
			});
			
		});
		
  	</script>
</head>

	

<body>
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

	<h3 style="margin-top:45px; margin-left: 5px;"><img src="/webProject/f_schedule/img_schedule/scheduledetail.png" style="width:45px; height:auto; margin-left:40px; margin-top:-6px">일정 조회</h3>
	<hr style="width:700px; margin-left: -430px;"/>
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
		<tr>

			<td style="border:black 2px solid;background-color:#f9f9f9;">
				<div>
					<input type="image" src="/webProject/f_schedule/img_schedule/delete.png" 
					class="delete"
					id="del-<%=schedule_no%>"
					style="width:40px; height:40px;margin-left:20px;"/>
				</div>
			</td>
		</tr>
		</table>
		<hr style="width:700px; margin-left: -430px;"/>
		
	<% }%>
	
		<div class="modal fade" id="update_schedule" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<form action="/webProject/schedule/updateshare.do"
				name="share_form" method="post" accept-charset="UTF-8" onsubmit="document.charset='UTF-8'">
				<div class="modal-content" style="width: 500px; height: 270px;">
					<div class="modal-header" style="width: 500px; height: 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h2 style="text-align: center; margin-top: -10px">공유 하기</h2>
					</div>
					<br />
					<div style="margin-left:90px;">
						<label><input type="text" id="schedule_title"
							name="schedule_title" placeholder="공유 타이틀" class="form-control"
							required style="width: 330px; text-align: center; margin: auto;"
							disabled></label>
							<input type="hidden" id=schedule_data name="share"/>
					</div>
					<div style="margin-left:90px;">
						<label><textarea id="note" name="note" placeholder="내용"
							class="form-control" required
							style="width: 330px; height:100px; margin: auto;"></textarea></label>
					</div>

					<div class="modal-footer">
						<input style="margin-top: -10px;" type="button"
							class="btn btn-default" data-dismiss="modal"
							onclick="share_Y()" value="일정 공유"/>
						<button style="margin-top: -10px;" type="button"
							class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
</body>
</html>