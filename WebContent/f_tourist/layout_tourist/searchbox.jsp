<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=EUC-KR">
<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="/webProject/f_tourist/css_tourist/tourist.css" media="screen" /> -->

</head>
<style>
#search{
		border: none;
        background-color: rgba(0,0,0,0);
         color: #27a1db;
         border-bottom: solid 2px #27a1db;
         width: 300px;
         transition: all 1s;
         font-size:20px;
         text-align: center;
 }  
</style>
<body>

  <div style="display: flex;flex-direction: row; text-align: right;
                             padding-top:10px; padding-left:520px; padding-bottom:20px;">
       <a id="ajaxbtn"><img id='ajaxbtn' src="/webProject/f_tourist/img_tourist/search.png" style="width: 24px;
        height: 40px;
        width:40px;    
        margin-right: 5px;"></a>
        <input id="search" name="search" type="text" placeholder="지역이나 명소를 입력하세요.">

    </div>
 
</body>
</html> 