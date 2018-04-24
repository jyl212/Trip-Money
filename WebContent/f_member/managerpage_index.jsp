<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <title>Trip=Money</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="/webProject/f_mypocket/css_mypocket/style.css"> 
</head>
<!-- <style>
.bagimg{
background-image: url(/webProject/f_member/img_member/sky.jpg);  
no-repeat center center fixed;
-webkit-background-size: cover;
-moz-background-size: cover;
-o-background-size: cover;
background-size: cover;
}
</style> --> 
<body class="bagimg">
	<jsp:include page="/f_total/layout_total/top_layout.jsp"/>
	<div class="container-fluid text-center">
		<div class="row content" style="margin-top: 100px;">
			<div class="col-sm-3 col-lg-3 col-md-3 col-xs-3">
				<jsp:include page="${menupath}"></jsp:include>
			</div>
			<div class="col-sm-9 col-lg-9 col-md-9 col-xs-9">
			     <jsp:include page="${viewpath}"></jsp:include>
			</div>
		</div>
     <footer style="margin-top: 1000px;">
	  <jsp:include page="/f_total/layout_total/bottom_layout.jsp"></jsp:include>
	</footer>
	</div>
</body>
</html>
