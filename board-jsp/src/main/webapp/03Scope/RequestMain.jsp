
<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setAttribute("reqStr", "문지현");
request.setAttribute("reqPerson", new Person("조용재", 35));
// request 영역에 속성값 생성
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestMain.jsp : Request영역은 요청을 처리하는동안 값이 유지됨</title>
</head>
<body>
	<h2>request 영역 값 삭제하기</h2>
	<%
	request.removeAttribute("reqStr"); // 문지현 삭제 -> 지워짐
	request.removeAttribute("reqInt"); // 정수 삭제 -> 값 없음
	// removeAttribute는 값이 없어도 오류가 안뜸
	%>
	<hr>
	<h2>request 영역 값 출력해보기</h2>
	<%
	String requestStr = (String) request.getAttribute("reqStr");
	Person requestPerson = (Person) request.getAttribute("reqPerson");
	// 속성값 불러와 변수에 넣음
	%>
	<ul>
		<li>String 객체 : <%=requestStr%></li>
		<li>Person 객체 : <%=requestPerson.getName()%>, <%=requestPerson.getAge()%></li>
	</ul>
	<hr>
	<h2>포워드된 페이지에서 request 영역 속성 값 읽기</h2>
	<%
	//.getRequestDispatcher는 바로 url로 페이지를 넘긴다.
	request.getRequestDispatcher("RequestForward.jsp?han=한글&eng=English").forward(request, response);
	%>

</body>
</html>