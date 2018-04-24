<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="/webProject/f_member/css_member/member.css" media="screen" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
var count=0;
function change1(check){
   count += 1;
    if(count%2==0){
       check.style.background = 'white';    
    }else{
        check.style.background = 'skyblue'; 
    }
}

var xhr
function idCheck2(){
   xhr = new XMLHttpRequest();
   xhr.onreadystatechange = readyCallBack_id2;
   
   xhr.open("POST","/webProject/member/idcheck.do",true);
   xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
   xhr.send("mem_id="+myform.mem_id2.value);
}

function readyCallBack_id2(){
   if(xhr.status==200& xhr.readyState==4 ){
      document.getElementById("mem_id_text2").innerHTML = xhr.responseText;
   }
}
var xhr
function nickNameCheck2(){
   xhr = new XMLHttpRequest();
   xhr.onreadystatechange = readyCallBack_nickname2;
   
   xhr.open("POST","/webProject/member/nicknamechack.do",true);
   xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
   xhr.send("nickname="+myform.nickname2.value);
}

function readyCallBack_nickname2(){
   if(xhr.status==200& xhr.readyState==4 ){
      document.getElementById("nickname_text2").innerHTML = xhr.responseText;
   }
}
$(document).ready(function(){
   //비밀번호 확인
   $("#pass2_ok").on("keyup",function(){
      if($("#pass2_ok").val()!=$("#pass2").val()){
         $(this).css("border","3px solid red");
         var str = "비밀번호가 일치하지 않습니다.";
         $("#pass_ok_text2").text(str);
      }
      else{
         $("#pass_ok_text2").empty();
         $(this).css("border","3px solid #90ee90");            
      }
   });
   
   //비밀번호
   $("#pass2").on("keyup",function(){
        if($(this).val().length<8 | $(this).val().match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/)) {
           var str = "비밀번호는 8자리 이상, 특수문자를 포함하세요";
           $(this).css("border","3px solid red");
           $("#pass_text2").text(str);
        }
        else{
           $("#pass_text2").empty();
           $(this).css("border","3px solid #90ee90");
        }
        
   });
   

   //이름
   $("#name2").on("keyup",function(){
      if($(this).val().length<2){
         $(this).css("border","3px solid red");
      }
      else{
         $(this).css("border","3px solid #90ee90");
      }
   });
   
   //아이디 중복확인 및 이메일형식
   $("#mem_id2").on("keyup",function(){
        if($("#mem_id_text2").text()=="이메일 형식으로 입력해 주세요"||$("#mem_id_text2").text()==""||$("#mem_id_text2").text()=="이미 사용중인 아이디입니다") {
           $(this).css("border","3px solid red");
        }
        else if($("#mem_id_text2").text()=="사용 가능한 아이디입니다"){
           $(this).css("border","3px solid #90ee90");
        }
        
   });
   //이름
   $("#nickname2").on("keyup",function(){
      if($(this).val().length<3||$(this).val().length>6){
         $(this).css("border","3px solid red");
      }
      else{
         $(this).css("border","3px solid #90ee90");
      }
   });
   
});
function register2(){            
   if($("#mem_id2").val()!=""&&$("#name2").val()!=""&&$("#pass2").val()!=""&&$("#pass2_ok").val()!=""&&$("#nickname2").val()!=""&&
      $("#mem_id2").css("border-color")!="red"&&$("#name2").css("border-color")!="red"&&
      $("#pass2").css("border-color")!="red"&&$("#pass2_ok").css("border-color")!="red"&&
      $("#nickname2").css("border-color")!="red"){   
      alert("회원가입이 되었습니다.");   
       window.document.myform.submit();
   }else{
      alert("정확한 정보를 입력해 주십시오");
      location.href="/webProject/member/view.html?url=singup_web.jsp";
   }
}

</script>
</head>
<body>

<img src="/webProject/f_member/img_member/logo_top.png" id="login_img">
 
 <form action="/webProject/member/register.html" name="myform" method="post">  
<div class="form-group" id="loginbox2">
<input type="text" class="form-control" id="mem_id2" name="mem_id2" placeholder="아이디" style="text-align: center;" onkeyup="idCheck2()">
<label id="mem_id_text2" style="color:red; font-size:10px;margin-left:90px;"></label>
</div>
<div class="form-group" id="namebox">
  <input type="text" class="form-control" id="name2" name="name2" placeholder="이름" style="text-align: center;">
</div> 
<div class="form-group" id="passbox2">
  <input type="password" class="form-control" id="pass2" name="pass2" placeholder="비밀번호" style="text-align: center;">
  <label id="pass_text2" style="color:red; font-size:10px;margin-left:90px;"></label>
</div> 
<div class="form-group" id="passcheckbox2">
  <input type="password" class="form-control" id="pass2_ok" name="pass2_ok"placeholder="비밀번호 확인" style="text-align: center;">
  <label id="pass_ok_text2" style="color:red; font-size:10px;margin-left:90px;"></label>
</div> 
<div class="form-group" id="nicknamebox">
  <input type="text" class="form-control" id="nickname2" name="nickname2" placeholder="닉네임" style="text-align: center;" onkeyup="nickNameCheck2()">
  <label id="nickname_text2" style="color:red; font-size:10px;margin-left:90px;"></label> 
</div> 
<button type="button" class="btn btn-info" id="log2" onclick="register2()">가입</button>
<button type="button" class="btn btn-info" id="join2">취소</button>

<div>
<div>
<div id="checktitle1">개인정보 수집 및 이용에 대한 안내</div>
<button type="button" class="btn btn-default btn-circle" onclick="change1(this)" name="checkbutton"><i class="glyphicon glyphicon-ok"></i></button>
</div>
<div class="well" id="checklist1">
정보통신망법 규정에 따라 트립=머니에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.<br>
<br>
1. 수집하는 개인정보<br>
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 트립=머니 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 여행, 검색, 일정조회, 관광정보 조회 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 트립=머니는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
회원가입 시점에 트립=머니가 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br>
- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 닉네임’을 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대폰번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.
서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br>
트립=머니 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다.<br>
구체적으로 <br>
1) 서비스 이용 과정에서 이용자에 관한 정보를 정보통신서비스 제공자가 자동화된 방법으로 생성하여 이를 저장(수집)하거나, <br>
2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환한 후에 수집하는 경우를 의미합니다.<br>
트립=머니 위치기반서비스 이용 시 수집·저장되는 위치정보의 이용 등에 대한 자세한 사항은 ‘트립=머니 위치정보 이용약관’에서 규정하고 있습니다. <br>
<br>
2. 개인정보의 파기<br>
회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.<br>
단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.<br>
이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우는 아래와 같습니다.<br>
부정가입 및 징계기록 등의 부정이용기록은 부정 가입 및 이용 방지를 위하여 수집 시점으로부터 6개월간 보관하고 파기하고 있습니다. 부정이용기록 내 개인정보는 가입인증 휴대폰 번호(만 14세 미만 회원의 경우 법정대리인 DI)가 있습니다.
결제도용, 불법할인대출(일명 '카드깡') 등 관련 법령 및 이용약관을 위반하는 네이버페이의 부정거래기록(아이디, 이름, 휴대폰번호, 배송지 주소, IP주소, 쿠키, 기기정보)은 부정거래 방지 및 다른 선량한 이용자의 보호, 안전한 거래 환경 보장을 위하여 수집 시점으로부터 3년간 보관하고 파기합니다. 
전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 네이버는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
- 전자상거래 등에서 소비자 보호에 관한 법률 <br>
계약 또는 청약철회 등에 관한 기록: 5년 보관 <br>
대금결제 및 재화 등의 공급에 관한 기록: 5년 보관 <br>
소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관 <br>
- 전자금융거래법 <br>
전자금융에 관한 기록: 5년 보관 <br>
- 통신비밀보호법 <br>
로그인 기록: 3개월<br>
</div>
<div>
<div id="checktitle2">위치정보 이용약관 동의</div>
<button type="button" class="btn btn-default btn-circle"  id="check2" name="checkbutton" onclick="change1(this)"><i class="glyphicon glyphicon-ok"></i></button>
</div>
<div class="well" id="checklist2">
위치정보 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 트립=머니 위치기반 서비스를 이용할 수 있습니다.<br>
<br>
제 1 조 (목적)<br>
이 약관은 트립=머니 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.<br>
제 2 조 (약관 외 준칙)<br>
이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.<br>
제 3 조 (서비스 내용 및 요금)<br>
①회사는 직접 위치정보를 수집하거나 위치정보사업자인 이동통신사로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다. <br>
1.Geo Tagging 서비스: 게시글 등록 시점의 개인위치정보주체의 위치정보를 게시글과 함께 저장합니다. <br>
2.위치정보를 활용한 검색결과 제공 서비스: 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과 및 주변결과(맛집, 주변업체, 교통수단 등)를 제시합니다.<br>
3.위치정보를 활용한 친구찾기 및 친구맺기: 현재 위치를 활용하여 친구를 찾아주거나 친구를 추천하여 줍니다.<br>
4.연락처 교환하기: 위치정보를 활용하여 친구와 연락처를 교환할 수 있습니다.<br>
5.현재 위치를 활용한 광고정보 제공 서비스: 광고정보 제공 요청 시 개인위치정보주체의 현 위치를 이용하여 광고소재를 제시합니다.<br>
6. 이용자 보호 및 부정 이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의 비정상적인 서비스 이용 시도 등을 차단합니다.<br>
7. 위치정보 공유: 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 안심귀가 등을 목적으로 지인 또는 개인위치정보주체가 지정한 제3자에게 공유합니다.<br>
8. 길 안내 등 생활편의 서비스 제공: 교통정보와 길 안내 등 최적의 경로를 지도로 제공하며, 주변 시설물 찾기, 뉴스/날씨 등 생활정보, 긴급구조 서비스 등 다양한 운전 및 생활 편의 서비스를 제공합니다.<br>
②제1항 위치기반서비스의 이용요금은 무료입니다. <br>
제 4 조 (개인위치정보주체의 권리)<br>
①개인위치정보주체는 개인위치정보 수집 범위 및 이용약관의 내용 중 일부 또는 개인위치정보의 이용ㆍ제공 목적, 제공받는 자의 범위 및 위치기반서비스의 일부에 대하여 동의를 유보할 수 있습니다. 
②개인위치정보주체는 개인위치정보의 수집ㆍ이용ㆍ제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다. <br>
③개인위치정보주체는 언제든지 개인위치정보의 수집ㆍ이용ㆍ제공의 일시적인 중지를 요구할 수 있습니다. 이 경우 회사는 요구를 거절하지 아니하며, 이를 위한 기술적 수단을 갖추고 있습니다. 
④개인위치정보주체는 회사에 대하여 아래 자료의 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 이유 없이 요구를 거절하지 아니합니다. 
1.개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료 <br>
2.개인위치정보주체의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법령의 규정에 의하여 제3자에게 제공된 이유 및 내용 
⑤회사는 개인위치정보주체가 동의의 전부 또는 일부를 철회한 경우에는 지체 없이 수집된 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 파기합니다. 단, 동의의 일부를 철회하는 경우에는 철회하는 부분의 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료에 한합니다. 
⑥개인위치정보주체는 제1항 내지 제4항 의 권리행사를 위하여 이 약관 제13조의 연락처를 이용하여 회사에 요구할 수 있습니다.
제 5 조 (법정대리인의 권리)<br>
①회사는 만14세 미만 아동으로부터 개인위치정보를 수집ㆍ이용 또는 제공하고자 하는 경우에는 만14세 미만 아동과 그 법정대리인의 동의를 받아야 합니다. 
②법정대리인은 만14세 미만 아동의 개인위치정보를 수집ㆍ이용ㆍ제공에 동의하는 경우 동의유보권, 동의철회권 및 일시중지권, 열람ㆍ고지요구권을 행사할 수 있습니다. 
제 6 조 (위치정보 이용ㆍ제공사실 확인자료 보유근거 및 보유기간)
회사는 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항에 근거하여 개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 위치정보시스템에 자동으로 기록하며, 6개월 이상 보관합니다.
제 7 조 (서비스의 변경 및 중지)<br>
①회사는 위치정보사업자의 정책변경 등과 같이 회사의 제반 사정 또는 법률상의 장애 등으로 서비스를 유지할 수 없는 경우, 서비스의 전부 또는 일부를 제한, 변경하거나 중지할 수 있습니다. 
②제1항에 의한 서비스 중단의 경우에는 회사는 사전에 인터넷 등에 공지하거나 개인위치정보주체에게 통지합니다. 
제 8 조 (개인위치정보 제3자 제공시 즉시 통보)<br>
①회사는 개인위치정보주체의 동의 없이 당해 개인위치정보주체의 개인위치정보를 제3자에게 제공하지 아니하며, 제3자 제공 서비스를 제공하는 경우에는 제공 받는 자 및 제공목적을 사전에 개인위치정보주체에게 고지하고 동의를 받습니다. 
②회사는 개인위치정보를 개인위치정보주체가 지정하는 제3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신단말장치로 매회 개인위치정보주체에게 제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다. 
③다만, 아래에 해당하는 경우에는 개인위치정보주체가 미리 특정하여 지정한 통신단말장치 또는 전자우편주소 등으로 통보합니다.<br> 
1.개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우 <br>
2.개인위치정보주체가 개인위치정보를 수집한 당해 통신단말장치 외의 통신단말장치 또는 전자우편주소 등으로 통보할 것을 미리 요청한 경우 <br>
제 9 조 (8세 이하의 아동 등의 보호의무자의 권리) <br>
①회사는 아래의 경우에 해당하는 자(이하 “8세 이하의 아동”등이라 한다)의 보호의무자가 8세 이하의 아동 등의 생명 또는 신체보호를 위하여 개인위치정보의 이용 또는 제공에 동의하는 경우에는 본인의 동의가 있는 것으로 봅니다. 
1. 8세 이하의 아동<br>
2. 금치산자<br>
3. 장애인복지법제2조제2항제2호의 규정에 의한 정신적 장애를 가진 자로서 장애인고용촉진및직업재활법 제2조제2호의 규정에 의한 중증장애인에 해당하는 자(장애인복지법 제29조의 규정에 의하여 장애인등록을 한 자에 한한다)
② 8세 이하의 아동 등의 생명 또는 신체의 보호를 위하여 개인위치정보의 이용 또는 제공에 동의를 하고자 하는 보호의무자는 서면동의서에 보호의무자임을 증명하는 서면을 첨부하여 회사에 제출하여야 합니다.
③보호의무자는 8세 이하의 아동 등의 개인위치정보 이용 또는 제공에 동의하는 경우 개인위치정보주체 권리의 전부를 행사할 수 있습니다.<br>
제 10 조 (손해배상)<br>
개인위치정보주체는 회사의 위치정보의 보호 및 이용 등에 관한 법률 제15조 내지 26조의 규정을 위반한 행위로 손해를 입은 경우에 회사에 대하여 손해배상을 청구할 수 있습니다. 이 경우 회사는 고의 또는 과실이 없음을 입증하지 아니하면 책임을 면할 수 없습니다.
제 11 조 (분쟁의 조정)<br>
① 회사는 위치정보와 관련된 분쟁에 대하여 개인위치정보주체와 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 방송통신위원회에 재정을 신청할 수 있습니다.
② 회사 또는 개인정보위치 주체는 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 개인정보보호법에 따라 개인정보분쟁조정위원회에 조정을 신청할 수 있습니다. 
제 12 조 (사업자 정보)<br>
회사의 상호, 주소, 전화번호 그 밖의 연락처는 다음과 같습니다.<br>
상호: 트립=머니 주식회사<br>
주소: 경기도 성남시 분당구 불정로 6 트립=머니 (463-867) 
전화번호: 1588-3820<br>
이메일 주소: navercc@tripmoney.com<br>
부칙 <br>
제1조 시행일<br>
2015년 6월 2일부터 시행되던 종전의 약관은 본 약관으로 대체하며, 본 약관은 2015년 11월 26일부터 적용됩니다.<br>
제2조 위치정보관리 책임자 정보<br>
회사는 다음과 같이 위치정보 관리책임자를 지정하여 이용자들이 서비스 이용과정에서 발생한 민원사항 처리를 비롯하여 개인위치정보 주체의 권리 보호를 위해 힘쓰고 있습니다.<br>
위치정보 관리책임자 : (개인)정보보호 담당 부서 임원(개인정보 보호책임자 겸직)
전화번호 : 1588-3820<br>
이메일 주소 : privacy@tripmoney.com<br>
</div>
</div>
</form>
</body>
</html>