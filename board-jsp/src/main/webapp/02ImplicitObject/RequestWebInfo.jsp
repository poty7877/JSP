<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestWebInfo.jsp : request 요청 처리용 페이지</title>
</head>
<body>

	<h2>1.RequestMain.jsp에서 넘어온 값 확인용</h2>
	<ul>
		<li><%=request.getParameter("eng")%></li>
		<hr>
		<li><%=request.getAttribute("han")%></li> <!-- uft-8로 인코딩 필요 -->


	</ul>

</body>
</html>