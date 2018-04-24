<%@page import="java.util.ArrayList"%>
<%@page import="tourist.dto.TourInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=EUC-KR">
<title>Trip and Money</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="/webProject/f_tourist/css_tourist/tourist.css" media="screen" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
</script>


</head>
 <% ArrayList<TourInfoDTO> TourInfoList = (ArrayList<TourInfoDTO>)request.getAttribute("tourinfolist");
           int size = TourInfoList.size();%>  
<body data-spy="scroll" data-target=".navbar" data-offset="50">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
	
 <% for(int i=0;i<size;i++){%>
 <%TourInfoDTO dto = TourInfoList.get(i);%>
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox" style="width:1500px; height:600px;">
		
			<!-- <div class="item active"> -->
			      <%if(dto.getFirstimage()!=""){ %>
				<img src="<%=dto.getFirstimage()%>" alt="img1" style="widte:1500px; height:100%; max-height:600px;">
				  <%}else{ %>
				<img src="/webProject/f_tourist/img_tourist/logo_top.png" alt="img1" style="widte:1500px; height:100%; max-height:600px;">  
				  <%} %>
			<!-- </div> -->
		</div>
	
	<div class="section">
		<div class="col-md-12">
			<h1 class="Overview"><%=dto.getTitle()%></h1>
			<hr />
		</div>
		<div class="row content">
			<div class="col-sm-6">
				<div class="Overview"><%=dto.getOverview()%></div>
				<div class="Overview"><%=dto.getHomepage()%></div>
			</div>
			<div class="col-sm-6">
				<div id="map" class="mapcss"></div>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95769d6fd03edf67b1d3830c9e665c5a"></script>
				
				<script>			
					var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
					mapOption = {
						center : new daum.maps.LatLng(<%=dto.getMapy()%>,<%=dto.getMapx()%>), // ������ �߽���ǥ
						level : 3
					// ������ Ȯ�� ����
					};

					// ������ ǥ���� div��  ���� �ɼ�����  ������ �����մϴ�
					var map = new daum.maps.Map(mapContainer, mapOption);

					// ��Ŀ�� ǥ�õ� ��ġ�Դϴ� 
					var markerPosition = new daum.maps.LatLng( <%=dto.getMapy()%>,<%=dto.getMapx()%>);

					// ��Ŀ�� �����մϴ�
					var marker = new daum.maps.Marker({
						position : markerPosition
					});

					// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
					marker.setMap(map);
					
				</script>
				<%} %> 
			</div> 
		</div>
		 
	</div>


</body>
</html>