<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta content="charset=EUC-KR">
 <!--  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link type="text/css" rel="stylesheet" href="/webProject/f_tourist/css_tourist/tourist.css" media="screen" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>  -->
 
</head>
<body>
	<jsp:include page="/f_total/layout_total/top_layout.jsp"></jsp:include>
	<div style="margin-top:100px;">
	<jsp:include page="/f_tourist/layout_tourist/searchbox.jsp"></jsp:include>
	     <br/>
	  </div>   
	<div>
        
		<div class="row content">			
			<div class="col-sm-3 col-lg-3 col-md-3 col-xs-3 sidenav">
				<jsp:include page="${menupath}"></jsp:include>
			</div>
			<div class="col-sm-9 col-lg-9 col-md-9 col-xs-9">
				<jsp:include page="${viewpath}"></jsp:include>
			</div>
		</div>	
	</div>
	<footer class="container-fluid text-center">
	  <jsp:include page="/f_total/layout_total/bottom_layout.jsp"></jsp:include>
	</footer>

</body>
</html>