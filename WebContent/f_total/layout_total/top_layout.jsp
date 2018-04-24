<%@page import="member.dto.MemberDTO"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");  %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Trip = Money</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/webProject/f_total/css_total/top_layout.css">
<link rel="stylesheet" href="/webProject/f_total/css_total/wow-alert.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 


</head>
<body>
	<% MemberDTO user = (MemberDTO)session.getAttribute("loginUser");%>

	<nav class="navbar1 navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/webProject/f_main/main_index.jsp"><img class="logo_top" src="/webProject/f_total/img_total/logo_top.png"></a>
			</div>
			<div class="coll apse navbar-collapse" id="myNavbar1">
				<ul class="navbar2 nav navbar-nav navbar-right">
				
					<%String mem_id =""; %>
					<%if(user!=null){%>
					<%mem_id = user.getMem_id(); %>			
						<%if(mem_id.equals("admin")) {%>
						<li><a href="/webProject/member/listread.do?state=NORMAL"><span class="glyphicon glyphicon-user"></span> Manage</a></li>
						<%} else{%>
						<li><a href="/webProject/member/view.html?url=info_change.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
						<%}%>						
						<li><a href="/webProject/member/logout.do"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
						<ul><li style="margin-top:50px; list-style: none;"><%=user.getNickname()%>님 환영합니다.<img src="/webProject/f_total/img_total/welcome.png" style="margin-top:-2px; width:16px; height: 16px"></li></ul>
					<%}  
					else{%>
					<% mem_id = "guest"; %>
					<li><a href="#" data-toggle="modal" data-target="#myModal1"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
					<li><a href="#" data-toggle="modal" data-target="#myModal2"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			       <%} %>
				</ul>
			</div>
			
			
			<div class="collapse navbar-collapse" id="myNavbar2">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/webProject/f_tourist/tourist_index.jsp">관광지</a></li>
					<%if(!mem_id.equals("admin")) {%>
						<li><a href="/webProject/loginfilter/schedule/listSchedule.do?STATE=list&mem_id=<%=mem_id%>">일정</a></li>
						<li><a href="/webProject/loginfilter/schedule/listSchedule.do?STATE=mypocket&mem_id=<%=mem_id%>">가계부</a></li>
					<%} %>
					<li><a href="/webProject/share/list.do">공유페이지</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- 네이버 아이디 연동 -->
	<%
		String clientId = "GWN0eO8QbSCzskXoN4ON";//애플리케이션 클라이언트 아이디값";
		String redirectURI = URLEncoder.encode("http://localhost:8088/webProject/member/naver.do", "UTF-8");
		SecureRandom random = new SecureRandom();
		String state = new BigInteger(130, random).toString();
		String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		apiURL += "&client_id=" + clientId;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&state=" + state;
		session.setAttribute("state", state);
	%>
	<!-- Modal -->
   <form action="/webProject/member/login.do" name="login_form" method="post">
   <div class="modal fade" id="myModal1" role="dialog">
      <div class="modal-dialog">
         <!-- Modal content-->
         <div class="modal-content" style="width: 500px;height:320px;">
            <div class="modal-header" style="width: 500px;height:50px;">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h2 style="text-align: center; margin-top:-10px">Login</h2>
            </div>
                <br/>
            <div>
               <input type="text" id="id" name="id" placeholder="아이디(이메일)"
                  class="form-control" required
                  style="width: 400px; text-align: center; margin:auto;">
            </div>
            <br/>
            <div>
               <input type="password" id="pass" name="pass" placeholder="비밀번호"
                  class="form-control" required
                  style="width: 400px; text-align: center; margin:auto;">
            </div>
            <br/>
            <div class="modal-footer">
               <input type="button" class="btn btn-default" data-dismiss="modal" onclick="login()" value="Login">
               <input type="button" class="btn btn-default" data-dismiss="modal" value="Close">
            </div>
            <a href="<%=apiURL%>" style="margin-left:100px"><img src="/webProject/f_member/img_member/naverlogin.png" style="width: 300px;height:50px; margin:auto;"></a>      
         </div>
      </div>
   </div>
   </form>
	<!-- Modal -->
   <div class="modal fade" id="myModal2" role="dialog">
      <div class="modal-dialog">
         <!-- Modal content-->
         
         <div class="modal-content" style="width: 500px;height:450px;">
            <div class="modal-header" style="width: 500px;height:50px;">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h2 style="text-align: center; margin-top:-10px">Sign up</h2>
            </div>
                <br/>
         <form action="/webProject/member/register.html" id="register_form" name="register_form" method="post">
            <div style="margin:auto;">
               <label><input type="text" id="mem_id1" name="mem_id1" placeholder="아이디(이메일)"
                  class="form-control" required onkeyup="idCheck()"
                  style="width: 300px; text-align: center; margin-left:70px;"></label>
               <label id="mem_id_text" style="color:red; font-size:10px;margin-left:90px;"></label>
            </div>
            <br/>
            <div>
               <label><input type="text" id="name1" name="name1" placeholder="이름"
                  class="form-control" required
                  style="width: 300px; text-align: center; margin-left:70px;"></label>
            </div>
            <br/>
            <div>
               <label><input type="password" id="pass1" name="pass1" placeholder="비밀번호"
                  class="form-control" required
                  style="width: 300px; text-align: center; margin-left:70px;"></label>
               <label id="pass1_text" style="color:red; font-size:10px;margin-left:90px;"></label>
               
            </div>
            <br/>
            <div>
               <label><input type="password" id="pass1_ok" name="pass1_ok" placeholder="비밀번호확인"
                  class="form-control" required
                  style="width: 300px; text-align: center; margin-left:70px;"></label>
               <label id="pass1_ok_text" style="color:red; font-size:10px;margin-left:90px;"></label>
            </div>
            <br/>
            <div>
               <label><input type="text" id="nickname1" name="nickname1" placeholder="닉네임"
                  class="form-control" required onkeyup="nickNameCheck()"
                  style="width: 300px; text-align: center; margin-left:70px"></label>
               <label id="nickname_text" style="color:red; font-size:10px;margin-left:90px;"></label> 
            </div>
            <br/>
            
            <div class="modal-footer">
               <input type="button" class="btn btn-default" data-dismiss="modal" id="" onclick="register()" value="가입">
               <input type="button" class="btn btn-default" data-dismiss="modal" value="취소">
            </div>
         </form>      
         </div>
      </div>
   </div>
   <script type="text/javascript">
   $(document).ready(function(){
      //비밀번호 확인
      $("#pass1_ok").on("keyup",function(){
         if($("#pass1_ok").val()!=$("#pass1").val()){
            $(this).css("border","3px solid red");
            var str = "비밀번호가 일치하지 않습니다.";
            $("#pass1_ok_text").text(str);
         }
         else{
            $("#pass1_ok_text").empty();
            $(this).css("border","3px solid #90ee90");            
         }
      });
      
      //비밀번호
      $("#pass1").on("keyup",function(){
           if($(this).val().length<8 | $(this).val().match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
              var str = "비밀번호는 8자리 이상, 특수문자를 포함하세요";
              $(this).css("border","3px solid red");
              $("#pass1_text").text(str);
           }
           else{
              $("#pass1_text").empty();
              $(this).css("border","3px solid #90ee90");
           }
           
      });
      

      //이름
      $("#name1").on("keyup",function(){
         if($(this).val().length<2){
            $(this).css("border","3px solid red");
         }
         else{
            $(this).css("border","3px solid #90ee90");
         }
      });
      
      //아이디 중복확인 및 이메일형식
      $("#mem_id1").on("keyup",function(){
           if($("#mem_id_text").text()=="이메일 형식으로 입력해 주세요"||$("#mem_id_text").text()==""||$("#mem_id_text").text()=="이미 사용중인 아이디입니다") {
              $(this).css("border","3px solid red");
           }
           else if($("#mem_id_text").text()=="사용 가능한 아이디입니다"){
              $(this).css("border","3px solid #90ee90");
           }
           
      });
      //이름
      $("#nickname1").on("keyup",function(){
         if($(this).val().length<3||$(this).val().length>6){
            $(this).css("border","3px solid red");
         }
         else{
            $(this).css("border","3px solid #90ee90");
         }
      });
      
   });
   </script>
   
   <script type="text/javascript">
      function register(){            
         if($("#mem_id1").val()!=""&&$("#name1").val()!=""&&$("#pass1").val()!=""&&$("#pass1_ok").val()!=""&&$("#nickname1").val()!=""&&
            $("#mem_id1").css("border-color")!="red"&&$("#name1").css("border-color")!="red"&&
            $("#pass1").css("border-color")!="red"&&$("#pass1_ok").css("border-color")!="red"&&
            $("#nickname1").css("border-color")!="red"){   
            alert("회원가입이 되었습니다.");   
            $("#register_form").submit();
         }else{
            alert("정확한 정보를 입력해 주십시오");
            location.href="/webProject/member/view.html?url=singup_web.jsp";
         }
      }
      
      function login(){
          window.document.login_form.submit();      
      }
     </script>
     
     <script type="text/javascript">
   
      var xhr
      function idCheck(){
         xhr = new XMLHttpRequest();
         xhr.onreadystatechange = readyCallBack_id;
         
         xhr.open("POST","/webProject/member/idcheck.do",true);
         xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
         xhr.send("mem_id="+register_form.mem_id1.value);
      }
      
      function readyCallBack_id(){
         if(xhr.status==200& xhr.readyState==4 ){
            document.getElementById("mem_id_text").innerHTML = xhr.responseText;
         }
      }
      
   </script>
   
   <script type="text/javascript">
   
      var xhr
      function nickNameCheck(){
         xhr = new XMLHttpRequest();
         xhr.onreadystatechange = readyCallBack_nickname;
         
         xhr.open("POST","/webProject/member/nicknamechack.do",true);
         xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
         xhr.send("nickname="+register_form.nickname1.value);
      }
      
      function readyCallBack_nickname(){
         if(xhr.status==200& xhr.readyState==4 ){
            document.getElementById("nickname_text").innerHTML = xhr.responseText;
         }
      }
      
   </script>
</body>
</html>