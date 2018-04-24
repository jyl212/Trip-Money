<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="/webProject/f_member/css_member/member.css" media="screen" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

	<img src="/webProject/f_member/img_member/logo_top.png" id="login_img"
		style="margin-left:684px; margin-bottom: 20px;">
	<form action="/webProject/member/login.do" name="login_form2" method="post"
		style="margin: auto; margin-bottom: 10px;">
		<div class="form-group" id="loginbox" style="margin: auto">
			<input type="text" class="form-control" id="id" name="id"
				placeholder="아이디"
				style="text-align: center; margin: auto; margin-bottom: 10px;">
		</div>
		<div class="form-group" id="passbox" style="margin: auto">
			<input type="password" class="form-control" id="pass" name="pass"
				placeholder="비밀번호"
				style="text-align: center; margin: auto; margin-bottom: 10px;">
		</div>
		<button type="button" class="btn btn-info" id="log" onclick="login2()"
			style="margin-left:590px; margin-bottom: 10px; width: 147px;">로그인</button>
		<button type="button" class="btn btn-info" id="join"
			style="margin: auto; margin-bottom: 10px; width: 147px;" onclick="memberinsert()">회원가입</button>
		<br/>
		<button type="button" class="btn btn-info" id="search" style="margin-left:590px; width: 300px;">아이디/비밀번호 찾기</button>
		<div>
			<a href="#"><img src="/webProject/f_member/img_member/naverlogin.png" id="naverlog" style="margin-left:590px;"></a>
		</div>
	</form>
	
	<script type="text/javascript">
		function login2(){
		    window.document.login_form2.submit();	   
		}
		function memberinsert(){
			 location.href="/webProject/member/view.html?url=singup_web.jsp";
		}
  	</script>
</body>
</html>