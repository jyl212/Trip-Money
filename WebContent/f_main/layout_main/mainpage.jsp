<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=EUC-KR">
<title>Trip and Money</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="/webProject/f_main/css_main/main_layout.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <link type="text/css" rel="stylesheet" href="/webProject/f_tourist/css_tourist/tourist.css" media="screen" /> 
<script type="text/javascript">

  function pop1(){  
	  window.open("http://localhost:8088/webProject/tourist/tourlist.do?contentid=126080","detail");
  }

  function pop2(){  
	  window.open("http://localhost:8088/webProject/tourist/tourlist.do?contentid=126535","detail");
  }
  
  function pop3(){  
	  window.open("http://localhost:8088/webProject/tourist/tourlist.do?contentid=128792","detail");
  }

  
  
  function pop4(){  
	  window.open("http://localhost:8088/webProject/tourist/tourlist.do?contentid=1964700","detail");
  }

  function pop5(){  
	  window.open("http://localhost:8088/webProject/tourist/tourlist.do?contentid=2531702","detail");
  }

  function pop6(){  
	  window.open("http://localhost:8088/webProject/tourist/tourlist.do?contentid=2494459","detail");
  }

  function pop7(){  
	  window.open("http://localhost:8088/webProject/tourist/tourlist.do?contentid=2390168","detail");
  }



</script>
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar1" data-offset="50">

<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
    
      <div class="item active">
        <a onclick="pop1()">       
        <img src="http://tong.visitkorea.or.kr/cms/resource/50/1994250_image2_1.jpg" alt="busan" style="opacity:0.8; width: 1700px; height:533px;cursor: pointer;"></a>
        <div class="carousel-caption">
          <p style="font-weight: bolder; margin-bottom:2px; font-size: 25px;color:#fd6e4e">추천 관광지 BEST 1</p>        
          <p style="font-weight: bolder;margin-bottom:2px;font-size: 23px">부산 송정해수욕장</p>
          <p style="font-weight: bolder;margin-bottom:2px;font-size: 16px">맑은 바닷물과 은빛의 백사장으로 남국의 정취가 가득한 곳</p>         
        </div>      
      </div>

      <div class="item">
      <a onclick="pop2()">
        <img src="http://tong.visitkorea.or.kr/cms/resource/30/2477030_image2_1.jpg" alt="seoul" style="opacity:0.8; width: 1700px; height:533px;cursor: pointer;"></a>
        <div class="carousel-caption">
         <p style="font-weight: bolder; margin-bottom:2px; font-size: 25px;color:#fd6e4e">추천 관광지 BEST 2</p>
          <p style="font-weight: bolder;margin-bottom:2px;font-size: 23px">서울 남산타워</p>
          <p style="font-weight: bolder;margin-bottom:2px;font-size: 16px">한국 최초의 타워형태의 관광명소</p>
        </div>      
      </div>
    
      <div class="item">
      <a onclick="pop3()">
        <img src="http://tong.visitkorea.or.kr/cms/resource/86/1274186_image2_1.jpg" alt="kyungnam" style="opacity:0.8; width: 1700px; height:533px;cursor: pointer;"></a>
        <div class="carousel-caption">
          <p style="font-weight: bolder; margin-bottom:2px; font-size: 25px;color:#fd6e4e">추천 관광지 BEST 3</p>
          <p style="font-weight: bolder;margin-bottom:2px;font-size: 23px">진도 여좌천</p>
          <p style="font-weight: bolder;margin-bottom:2px;font-size: 16px">진해를 찾는 관광객들의 벚꽃나들이 코스</p>
        </div>      
      </div>
      
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
    
</div> 

<table>
<tr>
<td>
<a onclick="pop4()">
<div class="tourinfolistbox4">
<img src='http://tong.visitkorea.or.kr/cms/resource/99/1964699_image2_1.jpg' style="border-radius: 3px; width: 198px; height:120px;"/>
<p class="textin2">【축제정보】</p>
<p Style="margin-left:8px;color: #747474;">강화도 빙어 송어 축제 2018</p>
<img src="/webProject/f_main/img_main/marker.png" style="margin-left:120px; margin-top:8px;width:25px; height:25px; float: left; "><p Style=" font-size: 10px; margin-left:2px; margin-top:15px;color: #747474;float: left; ">인천 축제</p> 
</div>
</a>
</td>
<td></td>
<td>
<a onclick="pop5()">
<div class="tourinfolistbox4">
<img src='http://tong.visitkorea.or.kr/cms/resource/98/2531698_image2_1.jpg' style="border-radius: 3px; width: 198px; height:120px;"/>
<p class="textin2">【축제정보】</p>
<p Style="margin-left:8px;color: #747474;">겨울공주 군밤축제 2018</p>
<img src="/webProject/f_main/img_main/marker.png" style="margin-left:120px; margin-top:8px;width:25px; height:25px; float: left; "><p Style=" font-size: 10px; margin-left:2px; margin-top:15px;color: #747474;float: left; ">충남 축제</p> 
</div> 
</a>
</td>

<td>
<a onclick="pop6()">
<div class="tourinfolistbox4">
<img src='http://tong.visitkorea.or.kr/cms/resource/29/2530329_image2_1.jpg' style="border-radius: 3px; width: 198px; height:120px;"/>
<p class="textin2">【축제정보】</p>
<p Style="margin-left:8px;color: #747474;">강릉 하트불꽃크루즈 2018</p>
<img src="/webProject/f_main/img_main/marker.png" style="margin-left:120px; margin-top:8px;width:25px; height:25px; float: left; "><p Style=" font-size: 10px; margin-left:2px; margin-top:15px;color: #747474;float: left; ">강원 축제</p> 
</div> 
</a>
</td>

<td>
<a onclick="pop7()">
<div class="tourinfolistbox4">
<img src='http://tong.visitkorea.or.kr/cms/resource/59/2534559_image2_1.jpg' style="border-radius: 3px; width: 198px; height:120px;"/>
<p class="textin2">【축제정보】</p>
<p Style="margin-left:8px;color: #747474;">부산원아시아페스티벌 2018</p>
<img src="/webProject/f_main/img_main/marker.png" style="margin-left:120px; margin-top:8px;width:25px; height:25px; float: left; "><p Style=" font-size: 10px; margin-left:2px; margin-top:15px;color: #747474;float: left; ">부산 축제</p> 
</div> 
</a>
</td>

</tr>
</table>
 
</body>
</html>