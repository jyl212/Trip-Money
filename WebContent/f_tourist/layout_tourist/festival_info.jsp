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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>   -->

<script type="text/javascript">
function pop4(){  
	  window.open("http://localhost:8088/webProject/tourist/tourlist.do?contentid=126080","detail");
}

function pop5(){  
	  window.open("http://localhost:8088/webProject/tourist/tourlist.do?contentid=126535","detail");
}

function pop6(){  
	  window.open("http://localhost:8088/webProject/tourist/tourlist.do?contentid=128792","detail");
}

function pop7(){  
	  window.open("http://localhost:8088/webProject/tourist/tourlist.do?contentid=264512","detail");
}

function pop8(){  
	  window.open("http://localhost:8088/webProject/tourist/tourlist.do?contentid=128757","detail");
}
</script>

<body>
<P style="font-size: 15px; margin-left: -18px; color:#fd6e4e;">��   ��õ ������ BEST 5 ��</P>

<a onclick="pop4()">
<div class="tourinfolistbox2">
<img src='http://tong.visitkorea.or.kr/cms/resource/50/1994250_image2_1.jpg' style="border-radius: 3px; width: 198px; height:120px;"/>
<p class="textin2">����õ ���� 1����</p>
<p Style="margin-left:8px;color: #747474;">�λ� �����ؼ�����</p>
<img src="/webProject/f_main/img_main/marker.png" style="margin-left:120px; margin-top:8px;width:25px; height:25px; float: left; "><p Style=" font-size: 10px; margin-left:2px; margin-top:15px;color: #747474;float: left; ">�λ� ���</p> 
</div>
</a>


<a onclick="pop5()">
<div class="tourinfolistbox3">
<img src='http://tong.visitkorea.or.kr/cms/resource/30/2477030_image2_1.jpg' style="border-radius: 3px; width: 198px; height:120px;"/>
<p class="textin2">����õ ���� 2����</p>
<p Style="margin-left:8px;color: #747474;">���� ����Ÿ��</p>
<img src="/webProject/f_main/img_main/marker.png" style="margin-left:120px; margin-top:8px;width:25px; height:25px; float: left; "><p Style=" font-size: 10px; margin-left:2px; margin-top:15px;color: #747474;float: left; ">���� ���</p> 
</div> 
</a>

<a onclick="pop6()">
<div class="tourinfolistbox3">
<img src='http://tong.visitkorea.or.kr/cms/resource/86/1274186_image2_1.jpg' style="border-radius: 3px; width: 198px; height:120px;"/>
<p class="textin2">����õ ���� 3����</p>
<p Style="margin-left:8px;color: #747474;">���� ����õ</p>
<img src="/webProject/f_main/img_main/marker.png" style="margin-left:120px; margin-top:8px;width:25px; height:25px; float: left; "><p Style=" font-size: 10px; margin-left:2px; margin-top:15px;color: #747474;float: left; ">�泲 ���</p> 
</div> 
</a> 

<a onclick="pop7()">
<div class="tourinfolistbox3">
<img src='http://tong.visitkorea.or.kr/cms/resource/67/636867_image2_1.jpg' style="border-radius: 3px; width: 198px; height:120px;"/>
<p class="textin2">����õ ���� 4����</p>
<p Style="margin-left:8px;color: #747474;">��õ ���̳�Ÿ��</p>
<img src="/webProject/f_main/img_main/marker.png" style="margin-left:120px; margin-top:8px;width:25px; height:25px; float: left; "><p Style=" font-size: 10px; margin-left:2px; margin-top:15px;color: #747474;float: left; ">��õ ���</p> 
</div> 
</a>

<a onclick="pop8()">
<div class="tourinfolistbox3">
<img src='http://tong.visitkorea.or.kr/cms/resource/06/181606_image2_1.jpg' style="border-radius: 3px; width: 198px; height:120px;"/>
<p class="textin2">����õ ���� 5����</p>
<p Style="margin-left:8px;color: #747474;">������ �������غ�</p>
<img src="/webProject/f_main/img_main/marker.png" style="margin-left:120px; margin-top:8px;width:25px; height:25px; float: left; "><p Style=" font-size: 10px; margin-left:2px; margin-top:15px;color: #747474;float: left; ">���� ���</p> 
</div> 
</a>

</body>
</html>