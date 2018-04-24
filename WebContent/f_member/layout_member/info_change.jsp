<%@page import="member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="/webProject/f_member/css_member/member.css" media="screen" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
    $('[data-toggle="nochange"]').tooltip();
    $("#out").on("click",function(){
    	 var Del = confirm("���� Ż�� �Ͻðڽ��ϱ�?")
         if (Del == true)
         {
         alert("     Ż�� �Ǿ����ϴ�. \n �ٽ� �˱⸦ ����մϴ�.")
             location.href="/webProject/f_main/main_index.jsp"
         }
    });
});
</script>
</head>
<body>
	<% MemberDTO user = (MemberDTO)session.getAttribute("loginUser");%>
	<%String mem_id = user.getMem_id(); %>
	<%String name = user.getName(); %>
	<%String nickname = user.getNickname(); %>
	<div style="margin: auto">
		<img src="/webProject/f_member/img_member/logo_top.png" id="login_img"
			style="margin-left:690px; margin-bottom:20px;">

		<form action="/webProject/member/update.do" method="POST">
			<div class="form-group" id="loginbox2" style="margin: auto; margin-bottom:10px;">
				<a href="#" data-toggle="nochange" title="������ �Ұ��� �մϴ�."> 
				<input
					type="text" class="form-control" name="update_mem_id"
					placeholder="<%=mem_id%>" style="text-align: center;" disabled>
				</a>
			</div>
			<div class="form-group" id="namebox" style="margin: auto; margin-bottom:10px;">
				<a href="#" data-toggle="nochange" title="������ �Ұ��� �մϴ�."> 
				<input
					type="text" class="form-control" name="name" 
					placeholder="<%=name%>" style="text-align: center;" disabled>
				</a>
			</div>
			<div class="form-group" id="passbox2" style="margin: auto; margin-bottom:10px;">
				<input type="password" class="form-control" name="pass" id="pwd1"
					placeholder="��й�ȣ" style="text-align: center;">
			</div>
			<div class="form-group" id="passcheckbox2" style="margin: auto; margin-bottom:10px;">
				<input type="password" class="form-control" id="pwd2"
					placeholder="��й�ȣ Ȯ��" style="text-align: center; margin: auto;; margin-bottom:10px;">
			</div>
			<div class="form-group" id="nicknamebox" style="margin: auto; margin-bottom:10px;">
				<input type="text" class="form-control" name="nickname"
					value="<%=nickname%>"
					placeholder="�г��� "
					style="text-align: center; margin: auto;">
			</div>
			<input type="submit" class="btn btn-info" id="change" style="margin-left:589px; margin-bottom:20px; width:97px;" value="����"> 
			<input type="button" class="btn btn-info" id="cancle" style="margin: auto; margin-bottom:10px; width:97px;" value="���" onclick="local.href='/webProject/f_main/main_index.jsp'"> 
			<input type="button" class="btn btn-info" id="out" style="margin: auto; margin-bottom:10px; width:97px;" value="Ż��" onclick="">
		</form>
	</div>
	

</body>
</html>