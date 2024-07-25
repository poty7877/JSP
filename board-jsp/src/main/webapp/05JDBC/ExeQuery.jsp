<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ExeQuery.jsp : 정적 쿼리문으로 회원 조회</title>
</head>
<body>
	<h2>회원 목록 조회 테스트 (executeQuery() 사용)</h2>
	<%
	JDBConnect jdbc = new JDBConnect(); // 1단계 ,2단계
	String sql = "SELECT * FROM MEMBER";
	Statement statement = jdbc.connection.createStatement(); // 3단계
	ResultSet resultSet = statement.executeQuery(sql); // 4단계
	
	while(resultSet.next())	{
		String id = resultSet.getString("id");
		String pw = resultSet.getString("pass");
		String name = resultSet.getString("name");
		java.sql.Date date = resultSet.getDate("regidate");
		
		out.println(String.format("%s %s %s %s", id, pw, name, date + "<br/>"));
		}
	jdbc.close(); // 5단계
	
	%>
</body>
</html>