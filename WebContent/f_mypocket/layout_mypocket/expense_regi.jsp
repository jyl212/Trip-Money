<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="/webProject/f_mypocket/css_mypocket/style.css">
<link rel="stylesheet"
	href="/webProject/f_mypocket/css_mypocket/listmap.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/webProject/f_mypocket/js_mypocket/Filechose.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=95769d6fd03edf67b1d3830c9e665c5a&libraries=services"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <style type="text/css">
.bagimg{
background-image: url(/webProject/f_mypocket/img_mypocket/sky.jpg);  
no-repeat center center fixed;
-webkit-background-size: cover;
-moz-background-size: cover;
-o-background-size: cover;
background-size: cover;
}
</style> -->
</head>
<body class="bagimg">
	<%
		String scheduleNo = (String) session.getAttribute("scheduleNo");
		String start_date = (String) session.getAttribute("start_date");
		String end_date = (String) session.getAttribute("end_date");
		long days = (long) session.getAttribute("days");
	%>

	<div class="col-sm-4" style="margin-top :50px;margin-left:2px; width: 280px;">
		<ul id="myTab" class="nav nav-tabs nav-justified" role="tablist" >

			<li role="presentation" class="active" ><a href="##regi"
				id="together_tab" role="tab" data-toggle="tab"
				aria-controls="together" aria-expanded="true">공금</a></li>

			<li role="presentation" class=""><a href="#regi" role="tab"
				id="private_tab" data-toggle="tab" aria-controls="private"
				aria-expanded="false">개인</a></li>
		</ul>

		<div id="myTabContent" class="tab-content">
			<div role="tabpanel" class="tab-pane fade active in" id="regi"
				style="margin-top: 10px">

				<form id="expesneform"
					action="/webProject/mypocket/expenseregi.do?start_date=<%=start_date%>&end_date=<%=end_date%>"
					method="POST" enctype="multipart/form-data">
					<div class="input-group" style="margin-bottom: 10px;">
						<div class="input-group-btn">
							<select class="form-control" name="days" id="days"
								style="width: 80px; font-size: 10px; border-radius: 4px;" required>
								<% for (int i = 1; i <= days; i++) {%>
								<option><%=i%>일차</option>
								<%}%>
							</select>
						</div>

						<div class="input-group-btn">
							<select class="form-control" name="kind" id="kind"
								style="width: 80px; font-size: 10px; border-radius: 4px;" required>
								<option>숙박비</option>
								<option>식비</option>
								<option>교통비</option>
								<option>입장료</option>
								<option>쇼핑</option>
								<option>기타</option>
							</select>
						</div>
						<!-- /btn-group -->
						<input type="text" class="form-control" aria-label="price"
							name="price" id="price" required="required" style="width: 60px; font-size: 10px;background-color:#f9f9f9" onkeypress="isNum()"> <span
							class="input-group-addon" >원</span>
					</div>
					<hr />
					<!-- /input-group -->

					<div class="form-group">
						<div class="col-sm-12" style="float: left;">
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="지도에서 위치를 선택해 주세요" aria-describedby="basic-addon2"
									style="width: 250px;margin-left: -10px; font-size:11px; border-radius: 4px;" readonly="readonly" id="loc" name="loc"> 
									<input type="text" id="latitude" name="latitude" /> 
									<input type="text" id="longitude" name="longitude" /> 
									<input type="text" id="expenseFlag" name="expenseFlag" />
							</div>
							<div>
								<!-- <input type="file" name="uploadFile1" /><br /> -->
								<input type="file" multiple id="orgFile" name="userfile" style="margin-top: 20px;height:25px;width: 250px; margin-left: -10px;">
								<!-- <input type="button" id="t_input_file" onclick="check()" value="찾기"/> -->
							</div>
							<!-- <label for="note" style="margin-top: 20px;">내용</label> -->
							<textarea class="form-control" rows="15"  id="note"
							name="note" placeholder="내용을 입력해 주세요." style="margin-top: 15px;height: 234px"></textarea>
						</div>		
						<input type="text" id="scheduleNo" name="scheduleNo"
							value="<%=scheduleNo%>" />
						<div >
							<input type="submit" value="확인 " style="margin-top: 15px;" onclick="alert('등록!')" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div class="col-sm-9" style="margin-top: 50px;margin-left: 15px;">
		<div class="map_wrap">

			<div id="map"
				style="width: 840px; height: 500px; position: relative; overflow: hidden;"></div>

			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<div>
						<form onsubmit="searchPlaces(); return false;">
							장소 : <input type="text" value="이태원 맛집" id="keyword" size="15">
							<button type="submit">검색</button>
						</form>
					</div>
				</div>
				<hr>

				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
		</div>
	</div>


	<script>
		function isNum() {
			var key = event.keyCode;
			if (!(key == 8 || key == 9 || key == 13 || key == 46 || key == 144
					|| (key >= 48 && key <= 57) || key == 110 || key == 190)) {
				alert('숫자를 입력해주세요');
				event.returnValue = false;
			}
		}
		$(document).ready(function() {
			$("#latitude").hide();
			$("#longitude").hide();
			$("#expenseFlag").val(state);
			$("#expenseFlag").hide();
			$("#scheduleNo").hide();
		})
		
		$('.nav-tabs a').click(function() {
			var idx = $('.nav-tabs a').index(this);

			if (idx == 0) {//공금		
				//alert($(this).text());
				state = false;
			} else if (idx == 1) {//개인
				state = true;
			}

			$("#expenseFlag").val(state);
			//alert(state);
			//위치내용 삭제							
			$("#loc").val("지도에서 위치를 선택해 주세요");

			for (var i = 0; i < clickmarker.length; i++) {
				clickmarker.splice(i, 1);
			}
			removeMarker();
			infowindow.close();

		});
		//지도
		// 마커를 담을 배열입니다
		var markers = [];
		var clickmarker = [];//선택한 마커만 담는배열
		state = false;//공금 or 개인 판단할 flag

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new daum.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('keyword').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('장소를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === daum.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === daum.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === daum.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new daum.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			// removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new daum.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 목록에서 장소 클릭시 위치에 마커생성
				(function(marker, title) {

					//마커위에 장소이름 띄우기
					daum.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					itemEl.onclick = function() {
						//위도경도값 받아서 -> 저장하긔..	  							
						if (clickmarker.length == 1) {
							marker.setMap(null);
							infowindow.close();
							clickmarker.splice(1, 1);
							alert("장소는 하나만 선택 가능합니다.");

						} else if (clickmarker.length == 0) {
							realMarker(marker);
							displayInfowindow(marker, title);
							$("#loc").val(title);

						}

						console.log(clickmarker);
						$("#latitude").val(clickmarker[0].getPosition().ib);
						$("#longitude").val(clickmarker[0].getPosition().jb);
						//지도에 표시된 마커의 위도 경도정보
						//alert(clickmarker[0].getPosition().ib);//위도
						//alert(clickmarker[0].getPosition().jb);//경도						
					};

				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);

			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		/* 	function removeClickmarker(){		
		 for (var i = 0; i < clickmarker.length; i++) {
		 if(marker==clickmarker[i]){
		 remove(marker);
		 clickmarker.splice(i,1);			            		
		 }
		 }	
		 } */
		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
		}
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new daum.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, marker = new daum.maps.Marker({
				position : position,
				clickable : true
			})

			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		function realMarker(marker) {
			//지도에 마커 표시하기
			marker.setMap(map);
			//마커클릭시 지도에서 마커지우기
			daum.maps.event.addListener(marker, 'click', function() {
				marker.setMap(null);
				$("#loc").val("지도에서 위치를 선택해 주세요");
				//clickmarker에 저장된것 지우기
				removeduple(marker);

				/*  for (var i = 0; i < clickmarker.length; i++) {
					 alert(clickmarker[i].getPosition().ib);
					} */
			});

			//중복값 입력시 clickmarker에 저장되지 않도록..
			removeduple(marker);
			//위도경도값 받아서 clickmarker에 저장 
			clickmarker.push(marker);
		}

		//지도위의 모든 마커 삭제
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		//동일한 목록을 눌렀을 경우.
		function removeduple(marker) {
			for (var i = 0; i < clickmarker.length; i++) {
				if (marker == clickmarker[i]) {
					clickmarker.splice(i, 1);
					infowindow.close();
				}
			}
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';
			marker.setMap(map);
			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
	</script>

</body>
</html>
