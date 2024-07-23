<%@page import="java.util.Set"%>
<%@page import="common.Person"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ApplicationResult.jsp : Application 결과 확인용</title>
</head>
<body>
	<h2>Application 영역 값 읽어보기</h2>
	<%
	Map<String, Person> maps = (Map<String, Person>)application.getAttribute("aMaps");
	
	Set<String> keys = maps.keySet(); // Map에 있는 모든 키를 가져옴
	for(String key : keys) {
		Person person = maps.get(key); // 키를 이용해 객체를 만듬.
		out.print(String.format("이름 : %s, 나이 : %d <br>" , person.getName(), person.getAge()));
	}
	
	%>
</body>
</html>