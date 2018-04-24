<%@page import="member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");  %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<link rel="stylesheet" href="/css/jquery-ui.min.css">
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
    <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

    <script type='text/javascript'>
    $(function(){

        $('#start_date').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy/mm/dd",
            language: "kr"
        });
    });
    
    $(function(){

        $('#end_date').datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy/mm/dd",
            language: "kr"
        });
    });

    </script>
	

  	<script type="text/javascript">
		function change_url(menuurl, url){
			menupath = encodeURIComponent(menuurl);
			viewpath = encodeURIComponent(url);
			location.href="/webProject/schedule/view.html?menuurl="+menupath+"&url="+viewpath;
		}
  	</script>
</head>
<body>
<% MemberDTO user = (MemberDTO)session.getAttribute("loginUser");%>
<% String mem_id = user.getMem_id(); %>

    <h3 style="margin-top:10px;"><img src="/webProject/f_schedule/img_schedule/scheduletitle.png" style="width:30px; height:auto; margin-left:40px; margin-right:10px; margin-top:-5px">나의 일정</h3>
	<div class="list-group" style="text-align: center;">
		<a href="/webProject/loginfilter/schedule/listSchedule.do?STATE=list&mem_id=<%=mem_id%>" class="list-group-item" style="margin-left: 13px;">나의 일정 조회</a>
		<a href="#make_schedule" data-toggle="modal" data-target="#make_schedule" class="list-group-item" style="margin-left: 13px;">일정 만들기</a>
		<!--  <a href="javascript:change_url('schedule_menu_layout.jsp','/f_schedule/layout_schedule/like_schedule.jsp')" class="list-group-item" style="margin-left: 13px;">좋아요 일정</a>-->
		<a href="/webProject/loginfilter/schedule/listSchedule.do?STATE=share&mem_id=<%=mem_id%>" class="list-group-item" style="margin-left: 13px;">공유 일정</a>
	</div>
	
	<div class="modal fade" id="make_schedule" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<form action="/webProject/makeSchedule.html"
				name="make_schedule_form" method="post">
				<div class="modal-content" style="width: 500px; height: 250px;">
					<div class="modal-header" style="width: 500px; height: 50px;">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h2 style="text-align: center; margin-top: -10px">일정 만들기</h2>
					</div>
					<br />
					<div style="margin-left:90px;">
						<label><input type="text" id="title2"
							name="schedule_title" placeholder="일정명" class="form-control"
							required style="width: 330px; text-align: center; margin: auto;"></label>
					</div>
					<div style="margin-left:90.5px;">
						<label><input type="text" id="start_date"
							name="start_date" placeholder="출발일" class="form-control" required
							style="width: 150px; text-align: center; margin: auto;"></label>
						<img src="/webProject/f_schedule/img_schedule/dash.png"
							style="width: 20px; height: 10px; margin-top: -35px;" /> <label><input
							type="text" id="end_date" name="end_date" placeholder="도착일"
							class="form-control" required="required"
							style="width: 150px; text-align: center; margin: auto;"></label>
					</div>
					<div style="margin-left:90px;">
						<label><input type="text" id="person" name="person"
							placeholder="인원 수" class="form-control" required="required"
							style="width: 100px; text-align: center; margin-left: 230px;"></label>
						<input type="hidden" id="user" name="user"
							value="<%=user.getMem_id()%>">
					</div>
					<div class="modal-footer">
						<button style="margin-top: -10px;" type="button"
							class="btn btn-default" data-dismiss="modal" id=""
							onclick="make_schedule()">일정 생성</button>
						<button style="margin-top: -10px;" type="button"
							class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		function make_schedule(){
			if($("#title2").val()!=""&$("#start_date").val()!=""&$("#end_date").val()!=""&$("#person").val()!=""){
				window.document.make_schedule_form.submit();
			}
			else{
				alert("빈 칸이 있습니다.");
				
			}
			
		}
  	</script>
	
	
	
	
</body>


</html>





