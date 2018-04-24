<%@page import="mypocket.dto.ExpenseDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% ExpenseDTO expenseInfo = (ExpenseDTO)request.getAttribute("expenseInfo");%>
	<div>
	 <img src="/webProject/f_mypocket/upload/<%=expenseInfo.getImg()%>" style="width:490px; height: 300px;"/>
	 <h2 style="color:#27a1db; text-align: center;">《 <%=expenseInfo.getTitle()%> 》</h2>
	 <h2 style="text-align: center;">지출 금액 : <%=expenseInfo.getPrice()%>원</h2>
	 <h2 style="font-size: 20px;text-align: justify;"><%=expenseInfo.getNote()%></h2> 
	</div>
</body>
</html>