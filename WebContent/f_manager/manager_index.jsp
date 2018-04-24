<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
<div id="container">
	<div id="content">	
		<div>
		<jsp:include page="/f_total/layout_total/top_layout.jsp"></jsp:include>
		</div>
		<div class="container-fluid text-center" style="margin-top:100px;">
			<div class="row content">
				<div class="col-sm-3 col-lg-3 col-md-3 col-xs-3 sidenav">
					<jsp:include page="/f_manager/layout_manager/manager_menu.jsp"></jsp:include>
				</div>
				<div class="col-sm-9 col-lg-9 col-md-9 col-xs-9">
					
				</div>
			</div>	
		</div>
		<footer class="container-fluid text-center" id="footer" style="margin-top:50px;">
		  		<div class="row content">
					<jsp:include page="/f_total/layout_total/bottom_layout.jsp"/>
				</div>
		</footer>
	</div>
</div>
</body>
</html>