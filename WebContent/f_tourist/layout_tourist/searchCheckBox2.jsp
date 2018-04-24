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
    var top = $(window).scrollTop(); // ���� ��ũ�ѹ��� ��ġ���� ��ȯ�մϴ�.
 
    /*����� ���� �� ����*/
    var speed          = 1000;     // ����ٴ� �ӵ� : "slow", "normal", or "fast" or numeric(����:msec)
    var easing         = 'linear'; // ����ٴϴ� ��� �⺻ �ΰ��� linear, swing
    var $layer         = $('#menu'); // ���̾� ������
    var layerTopOffset = 0;   // ���̾� ���� ���Ѽ�, ����:px
    $layer.css('position', 'absolute');
    /*����� ���� �� ��*/
 
    // ��ũ�� �ٸ� ���� ���¿��� �������� ���� ��츦 ����
    if (top > 0 )
        $win.scrollTop(layerTopOffset+top);
    else
        $win.scrollTop(0);
 
    //��ũ���̺�Ʈ�� �߻��ϸ�
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
		//�迭üũ�ڽ����� ���� data�� ����
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
	  <option>��ü</option>
	  <option>�ֽż�</option>
	  <option>�α��</option>
	</select>
</div>

		<div class="btn-group" id="status" data-toggle="buttons" style="margin-top: 10px; margin-left:-30px; margin-right:-15px;">         
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="1" name="box" id="area6">����</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="6" name="box" id="area8">�λ�</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="3" name="box" id="area11">����</label>
              <label class="btn btn-default btn-off " id="checkboxbutton">
              <input type="checkbox" value="2" name="box" id="area7">��õ</label>             
         </div>
	
	
	<div class="btn-group" id="status" data-toggle="buttons" style="margin-top: 10px; margin-left:-30px; margin-right:-15px;">
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="5" name="box" id="area10">����</label>              
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="4" name="box" id="area9">�뱸</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="7" name="box" id="area12">���</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="39" name="box" id="area17">����</label>             
      </div>
		
	<div class="btn-group" id="status" data-toggle="buttons" style="margin-top: 10px; margin-left:-30px; margin-right:-15px;">
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="31" name="box" id="area13">���</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="32" name="box" id="area14">����</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="34" name="box" id="area16">�泲</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="33" name="box" id="area15">���</label>              
      </div>
		
	<div class="btn-group" id="status" data-toggle="buttons" style="margin-top: 10px; margin-left:-30px; margin-right:-15px;">
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="38" name="box" id="area19">����</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="37" name="box" id="area18">����</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="36" name="box" id="area5">�泲</label>
              <label class="btn btn-default btn-off" id="checkboxbutton">
              <input type="checkbox" value="35" name="box" id="area20">���</label>
      </div>
	
		<br />
		<br />
	
		<div class="btn-group" style="margin-top: -40px;" id="result">
			<button type="button" class="btn btn-warning" id="resultbutton">�����ϱ�</button></a>
		</div>
	</div>
	</div>
</body>
</html>