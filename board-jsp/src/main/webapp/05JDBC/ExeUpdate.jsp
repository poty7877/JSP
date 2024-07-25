<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ExeUpdate.jsp : 동적 쿼리문으로 데이터 입력</title>
</head>
<body>
	<h2>회원 추가 테스트(executeUpdate() 사용)</h2>
	<%
	JDBConnect jdbc = new JDBConnect(); // 1단계, 2단계
	
	String id = "test1";
	String pw = "1111";
	String name = "테스트1";
	String sql = "INSERT INTO MEMBER VALUES(?, ?, ?, SYSDATE)";
	PreparedStatement preparedStatement = jdbc.connection.prepareStatement(sql);
	preparedStatement.setString(1, id);
	preparedStatement.setString(2, pw);
	preparedStatement.setString(3, name);
	int result = preparedStatement.executeUpdate();
	if(result > 0) {
		out.print("회원 추가 성공");
	}else {
		out.print("회원 추가 실패");
	}
	
	jdbc.close();
	
	%>
</body>
</html>