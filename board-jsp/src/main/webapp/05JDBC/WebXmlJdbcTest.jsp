<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebXmlJdbcTest.jsp : application영역을 활용한 접속테스트</title>
</head>
<body>
	<h2>JDBC 연결 테스트 (application + jsp)</h2>
	<%
	String driver = application.getInitParameter("OracleDriver");
	String url = application.getInitParameter("OracleUrl");
	String id = application.getInitParameter("OracleId");
	String pw = application.getInitParameter("OraclePw");
	//단점 : 매번 페이지마다 필수 코드가 있음

	JDBConnect jdbc = new JDBConnect(driver, url, id, pw);
	// 1단계, 2단계 완성
	// 3단계(쿼리문생성), 4단계 진행(쿼리문실행)
	// 5단계(close) 진행
	jdbc.close();
	%>

</body>
</html>