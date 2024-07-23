<%@page import="java.util.Collection"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// 응답헤더에 날짜 처리용 코드
SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
long add_date = simpleDateFormat.parse(request.getParameter("add_date")).getTime(); // 날짜처리 암기 //parse(request.getParameter().getTime())

response.addDateHeader("resp_date", add_date); // 응답헤더에 resp_date 이름으로 추가

int add_int = Integer.parseInt(request.getParameter("add_int")); // 메인에서 넘어온 get 값
// 문자열을 숫자로 변경
response.addIntHeader("resp_int", add_int);

response.addHeader("resp_str", request.getParameter("add_str"));

response.setHeader("resp_str", "김기원"); //수정
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseHeader.jsp : get으로 받은 날짜, 숫자, 문자처리</title>
</head>
<body>
	<h2>ResponseMain.jsp에서 넘어온 응답헤더 출력</h2>
	<%
	Collection<String> headerNames = response.getHeaderNames(); // 응답 헤더에 있는 이름을 모두 출력
	for (String hName : headerNames) { // 헤더 컬렉션에 있는 이름들을 1개씩 반복
		String hValue = response.getHeader(hName); // 이름과 같은 값을 변수에 넣음
	%>
	<!-- for 중간에 태그를 사용해야 함 -->
	<li><%=hName%> : <%=hValue%></li>
	<!-- <li>는 html 태그 이기 때문에 한번 중단한 이후 다시 연결해야함. -->
	<%
	} // for end
	%>

</body>
</html>