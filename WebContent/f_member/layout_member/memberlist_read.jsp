<%@page import="member.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="euc-kr">
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
   <link type="text/css" rel="stylesheet" href="/webProject/f_member/css_member/member.css" media="screen" />
  <style type="text/css">
  	th{
  		text-align: center;
  	}
  </style>
</head>
<body>
	<div class="container">
	<%ArrayList<MemberDTO> memberlist =
			(ArrayList<MemberDTO>) request.getAttribute("memberlist"); 
	 	 int size = memberlist.size();
	  %>
		<table class="table" style="margin-left:20px; width: 900px;">
			<thead>
				<tr>
					<th>ID</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			<%for(int i=0;i<size;i++){ 
				MemberDTO member =  memberlist.get(i);%>
				<tr>
					<td><%= member.getMem_id()%></td>
					<td><%= member.getName() %></td>
					<td><%= member.getNickname() %></td>
					<td><a href="/webProject/member/delete.do?memid=<%=member.getMem_id()%>" data-toggle="nochange" title="회원정보 삭제"><img src="/webProject/f_member/img_member/remove.png" class="remove"></a></td>
				</tr>
			<%}%>
			</tbody>
		</table>
	</div>

</body>
</html>
