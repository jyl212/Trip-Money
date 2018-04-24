<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=EUC-KR">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="/webProject/f_tourist/css_tourist/tourist.css" media="screen" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>  --> 

<style type="text/css"> 

</style>

<body>
	<jsp:include page="/f_tourist/layout_tourist/searchbox.jsp"></jsp:include>
	<br/>
		<div class="row content">
			<div class="col-sm-3 col-lg-3 col-md-3 col-xs-3 sidenav">
		 <jsp:include page="/f_tourist/layout_tourist/searchCheckBox2.jsp"></jsp:include>
			</div>
		<div class="col-sm-7 col-lg-7 col-md-7 col-xs-7 text-left">
	       <jsp:include page="/f_tourist/layout_tourist/searchResultList2.jsp"></jsp:include>
		</div>
			<div class="col-sm-2 col-lg-2 col-md-2 col-xs-2 sidenav">		
           <jsp:include page="/f_tourist/layout_tourist/festival_info.jsp"></jsp:include>
		</div>
</body>
</html>