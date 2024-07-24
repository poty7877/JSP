<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Import.jsp : 외부 패키지 연동</title>
</head>
<body>
	<h2>날짜 확인</h2>
	<%
	Date today = new Date();
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String todayStr = simpleDateFormat.format(today);
	out.print("오늘 날짜 : " + todayStr);
	%>

</body>
</html>