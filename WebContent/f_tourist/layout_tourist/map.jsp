<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">  
</head>
<body>
	<!-- ������ ǥ���� div �Դϴ� -->
	<div id="map" style="width:700px;height:450px;margin-left:20px;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=646646da60a73a05e9aaca8c8181bb7c"></script>
	<script>
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
		    mapOption = { 
		        center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
		        level: 3 // ������ Ȯ�� ����
		    };
		
		// ������ ǥ���� div��  ���� �ɼ�����  ������ �����մϴ�
		var map = new daum.maps.Map(mapContainer, mapOption); 


		// ��Ŀ�� ǥ�õ� ��ġ�Դϴ� 
		var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); 

		// ��Ŀ�� �����մϴ�
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});

		// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
		marker.setMap(map);
		
	</script>
</body>
</html>