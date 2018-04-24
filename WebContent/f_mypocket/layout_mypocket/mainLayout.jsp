<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://dapi.kakao.com/v2/maps/sdk.js?appkey=95769d6fd03edf67b1d3830c9e665c5a&libraries=services"></script>
</head>
<!-- <style>
.bagimg{
background-image: url(/webProject/f_mypocket/img_mypocket/sky.jpg);  
no-repeat center center fixed;
-webkit-background-size: cover;
-moz-background-size: cover;
-o-background-size: cover;
background-size: cover;
}
</style>  -->
<body class="bagimg">
	<jsp:include page="/f_total/layout_total/top_layout.jsp"/>
	<div class="container-fluid text-center" >
		<div class="row content" style="margin-top: 100px;">
			<div class="col-sm-2 col-lg-2 col-md-2 col-xs-2">
				<jsp:include page="/${menupath}" />
			</div>
			<div class="col-sm-10 col-lg-10 col-md-10 col-xs-10">
				<jsp:include page="${viewpath}" />
			</div>
		</div>		
	</div>
	<div style="margin-top:500px;">
		<jsp:include page="/f_total/layout_total/bottom_layout.jsp"></jsp:include>
	</div>
</body>
</html>