<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=EUC-KR">
<title>Insert title here</title>
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
//alert(mainValue)
$(function(){
    var $win = $(window);
    var top = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
 
    /*사용자 설정 값 시작*/
    var speed          = 1000;     // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)
    var easing         = 'linear'; // 따라다니는 방법 기본 두가지 linear, swing
    var $layer         = $('#menu'); // 레이어 셀렉팅
    var layerTopOffset = 0;   // 레이어 높이 상한선, 단위:px
    $layer.css('position', 'absolute');
    /*사용자 설정 값 끝*/
 
    // 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해
    if (top > 0 )
        $win.scrollTop(layerTopOffset+top);
    else
        $win.scrollTop(0);
 
    //스크롤이벤트가 발생하면
    $(window).scroll(function(){
        yPosition = $win.scrollTop() - 123;
        if (yPosition < 0)
        {
            yPosition = 0;
        }
        $layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false});
    });
});

function change_url3(menuurl, url){
	menupath = encodeURIComponent(menuurl);
	viewpath = encodeURIComponent(url);
	location.href="/webProject/tourist/view.html?menuurl="+menupath+"&url="+viewpath;
}




$(document).ready(function(){
	 $("#resultbutton").on("click",function(){
		//배열체크박스값을 빼서 data에 전달
	$("input[name=box]:checked").each(function() {
		
        var checkval = $(this).val(); 
        valueArr.push(checkval);
        /* alert(valueArr); */
           });
	  
	}); 
});




</script>
</head>
<body>
<div class="container-fluid text-center" id="menu">
	<div class="well" id="selectbox">
<div>
	<select class="form-control" id="dorplist">
	  <option>전체</option>
	  <option>최신순</option>
	  <option>인기순</option>
	</select>
</div>

		<div class="btn-group" id="status" data-toggle="buttons" style="margin-top: 10px; margin-left:-30px; margin-right:-15px;">         
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="1" name="box" id="area6">서울</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="6" name="box" id="area8">부산</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="3" name="box" id="area11">대전</label>
              <label class="btn btn-default btn-off " id="checkboxbutton">
              <input type="checkbox" value="2" name="box" id="area7">인천</label>             
         </div>
	
	
	<div class="btn-group" id="status" data-toggle="buttons" style="margin-top: 10px; margin-left:-30px; margin-right:-15px;">
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="5" name="box" id="area10">광주</label>              
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="4" name="box" id="area9">대구</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="7" name="box" id="area12">울산</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="39" name="box" id="area17">제주</label>             
      </div>
		
	<div class="btn-group" id="status" data-toggle="buttons" style="margin-top: 10px; margin-left:-30px; margin-right:-15px;">
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="31" name="box" id="area13">경기</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="32" name="box" id="area14">강원</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="34" name="box" id="area16">충남</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="33" name="box" id="area15">충북</label>              
      </div>
		
	<div class="btn-group" id="status" data-toggle="buttons" style="margin-top: 10px; margin-left:-30px; margin-right:-15px;">
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="38" name="box" id="area19">전남</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="37" name="box" id="area18">전북</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="36" name="box" id="area5">경남</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="35" name="box" id="area20">경북</label>
      </div>
	
		<br />
		<br />
	
		<div class="btn-group" style="margin-top: -40px;" id="result">
			<button type="button" class="btn btn-warning" id="resultbutton">적용하기</button></a>
		</div>
	</div>
	</div>
</body>
</html>