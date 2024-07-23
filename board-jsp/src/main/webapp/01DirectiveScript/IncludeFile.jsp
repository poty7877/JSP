<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludeFile.jsp : 날짜 정보를 가지고 있는 페이즈</title>
</head>
<body>
	<%
	LocalDate today = LocalDate.now(); // 오늘 날짜를 가지고 있는 객체
	LocalDateTime tommorrow = LocalDateTime.now().plusDays(1); // 내일날짜, 시간을 가지고있는 객체
	%>

</body>
</html>