<%@page import="member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>

<body>
	<%
		String scheduleNo = (String) session.getAttribute("scheduleNo");
		String start_date = (String)session.getAttribute("start_date");
	 	String end_date = (String)session.getAttribute("end_date");
		MemberDTO user = (MemberDTO)session.getAttribute("loginUser");
		String mem_id ="";
		if(user!=null){ mem_id = user.getMem_id();} else{mem_id = "guest"; }
	%>
	
	<h3 style="margin-top:10px;"><img src="/webProject/f_mypocket/img_mypocket/accountbook.png" style="width:30px; height:auto; margin-left:60px; margin-right:10px; margin-top:-5px">가계부</h3>
	<div class="list-group" style="text-align: center;">
		<a href="/webProject/loginfilter/schedule/listSchedule.do?STATE=mypocket&mem_id=<%=mem_id%>" class="list-group-item" style="margin-left: 13px;">일정선택</a>
		<!--  <a href="javascript:setUrl('/f_mypocket/layout_mypocket/mypocket_menu1.jsp','/f_mypocket/layout_mypocket/expense_list.jsp')" class="list-group-item" style="margin-left: 13px;">여행별지출내역</a>-->
	</div>
	
	
	<script type="text/javascript">
		function setUrl(menuurl,url){
			menupath = encodeURIComponent(menuurl);
			viewpath = encodeURIComponent(url);			
			location.href="/webProject/mypocket/view.html?url="+viewpath+"&menuurl="+menupath;
		}
	</script>
	
</body>
</html>
