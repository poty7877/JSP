<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestHeader.jsp : 요청자의 정보를 분석하는 페이지</title>
</head>
<body>

	<h2>3. 너의 대한 정보를 잘 쓸게!!</h2>

	<%
	Enumeration headers = request.getHeaderNames(); // 요청온 곳의 헤더의 모든값.
	while (headers.hasMoreElements()) {
		//.hasMoreElements 헤더 요소의 마지막까지 반복
		String headerName = (String) headers.nextElement(); // 헤더명 추출
		String headerValue = request.getHeader(headerName); // 헤더값 추출
		out.println("헤더명 : " + headerName);
		out.println("헤더값 : " + headerValue + "<br>");
	}
	%>

</body>
</html>