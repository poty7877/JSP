<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestParameter.jsp : requestMain.jsp에서 넘어온 값 처리</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8"); // post방식의 한글 처리 법
	String id = request.getParameter("id");
	String sex = request.getParameter("sex");
	String[] favo = request.getParameterValues("favo"); // 배열일때 values
	String favoStr = ""; // 배열의 문자열을 추출
	if (favo != null) {
		for (int i = 0; i < favo.length; i++) {
			favoStr += favo[i] + " ";
		}

	}
	String intro = request.getParameter("intro").replace("\r\n", "<br>");
	%>
	
	<ol>
	<li>아이디 : <%=id %></li>
	<li>성별 : <%=sex %></li>
	<li>관심사 : <%=favoStr %></li>
	<li>자기소개 : <%=intro %></li>
	
	</ol>

</body>
</html>