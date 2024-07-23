
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SesstionLocation.jsp : 세션 값 확인</title>
</head>
<body>
	<%
	List<String> lists = (List<String>) session.getAttribute("lists");
	for (String str : lists) {
		out.print(str + "<br>");
	}
	%>
</body>
</html>