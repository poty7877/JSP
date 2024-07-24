<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="IsErrorPage.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error500.jsp : 예외발생</title>
</head>
<body>
	<%
	int myAge = Integer.parseInt(request.getParameter("age")) + 10; // 현재나이 + 10
	out.print("10년후 당신의 나이는 : " + myAge + "세 입니다.");
	%>

</body>
</html>