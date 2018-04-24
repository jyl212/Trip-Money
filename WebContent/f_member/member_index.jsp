<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta content="charset=EUC-KR">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="/webProject/f_member/css_member/member.css" media="screen" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>
<body>
	<jsp:include page="/f_total/layout_total/top_layout.jsp"></jsp:include>
	<div  style="margin-top:80px;">
		<div class="row content">
			<div class="col-sm-12 col-lg-12 col-md-12 col-xs-12">
			<jsp:include page="/f_member/layout_member/login_success.jsp"></jsp:include>
			</div>
		</div>	
	</div>	
	<div style="margin-top:280px;">
	<jsp:include page="/f_total/layout_total/bottom_layout.jsp"></jsp:include>
	</div>
</body>
</html>