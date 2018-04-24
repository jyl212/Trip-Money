<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta content="charset=EUC-KR">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/webProject/f_total/css_total/top_layout.css">
<link rel="stylesheet" href="/webProject/f_total/css_total/wow-alert.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <link type="text/css" rel="stylesheet" href="/webProject/f_tourist/css_tourist/tourist.css" media="screen" />  
<script src="http://code.jquery.com/jquery-latest.min.js"></script>   
<link rel="stylesheet" href="/webProject/f_main/css_main/main_layout.css">
 <script type="text/javascript">

 var valueArr = new Array(); 

 
 </script>
<style type="text/css">
.bagimg{

background-image: url(/webProject/f_tourist/img_tourist/sky.jpg);  
no-repeat center center fixed;
-webkit-background-size: cover;
-moz-background-size: cover;
-o-background-size: cover;
background-size: cover;
}

</style>

</head>
<body class="bagimg">

	<jsp:include page="/f_total/layout_total/top_layout.jsp"></jsp:include>
	<div style="margin-top:90px;">
		<div class="row content">
			<div class="col-sm-12 col-lg-12 col-md-12 col-xs-12">
			<jsp:include page="/f_tourist/layout_tourist/tourist_search_main.jsp"></jsp:include>
			</div>
		</div>	
	</div>
	<div style="margin-top:400px;">
	<jsp:include page="/f_total/layout_total/bottom_layout.jsp"></jsp:include>
	</div>

</body>
</html>