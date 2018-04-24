
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");  %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<style>
.bagimg{
background-image: url(/webProject/f_schedule/img_schedule/sky.jpg);  
no-repeat center center fixed;
-webkit-background-size: cover;
-moz-background-size: cover;
-o-background-size: cover;
background-size: cover;
}
</style> 
<body class="bgimg">

	<div>
	<jsp:include page="/f_total/layout_total/top_layout.jsp"></jsp:include>
	</div>
	<div class="container-fluid text-center" style="margin-top:100px;">
		<div class="row content">
			<div class="col-sm-12 col-lg-12 col-md-12 col-xs-12">
				<jsp:include page="${viewpath}"></jsp:include>
			</div>
		</div>	
	</div>
	<footer class="container-fluid text-center" style="margin-top:100px;">
	  		<div class="row content">
				<jsp:include page="/f_total/layout_total/bottom_layout.jsp"/>
			</div>
	</footer>

</body>
</html>