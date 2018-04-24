<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="member.dto.*,java.util.*,member.dto.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="euc-kr">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link type="text/css" rel="stylesheet" href="/webProject/f_member/css_member/member.css" media="screen" />
<style type="text/css">
th{
text-align: center;
}
td{
text-align: center;
}
</style>
</head>
<body>
<div>

            
  <table class="table">
    <thead>
      <tr>
        <th>아이디</th>
        <th>이 름</th>
        <th>비밀번호</th>
        <th>닉네임</th>
        <th>네이버로그인</th>
        <th>관리</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>admin</td>
        <td>관리자</td>
        <td>1234</td>
        <td>관리자</td>
        <td></td>
        <td>
        <a href="#" data-toggle="nochange" title="회원정보 조회"><img src="/webProject/f_member/img_member/check.png" class="check"></a>
        &nbsp;
        <a href="#" data-toggle="nochange" title="회원정보 삭제"><img src="/webProject/f_member/img_member/remove.png" class="remove"></a>       
        </td>
      </tr>
      <tr>
        <td>kmk630</td>
        <td>김민규</td>
        <td>1234</td>
        <td>밍구밍구</td>
        <td>Y</td>
        <td>
        <a href="#" data-toggle="nochange" title="회원정보 조회"><img src="/webProject/f_member/img_member/check.png" class="check"></a>
        &nbsp;
        <a href="#" data-toggle="nochange" title="회원정보 삭제"><img src="/webProject/f_member/img_member/remove.png" class="remove"></a>
        </td>
      </tr>
      <tr>
        <td>yueb2</td>
        <td>유은별</td>
        <td>1234</td>
        <td>별별별</td>
        <td>N</td>
        <td>
        <a href="#" data-toggle="nochange" title="회원정보 조회"><img src="/webProject/f_member/img_member/check.png" class="check"></a>
        &nbsp;
        <a href="#" data-toggle="nochange" title="회원정보 삭제"><img src="/webProject/f_member/img_member/remove.png" class="remove"></a>
        </td>
      </tr>
    </tbody>
  </table>
</div>


</body>
</html>
