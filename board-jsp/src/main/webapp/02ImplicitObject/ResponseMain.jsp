<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseMain.jsp : 로그인 화면 (실패시 메인으로 돌아와 오류 표시)</title>
</head>
<body>
	<hr>
	<h2>1.로그인 검증</h2>
	<%
	// 오류 실패시 적용되는 코드
	String loginErr = request.getParameter("loginErr");
	if (loginErr != null) { // loginErr값이 있으면,
		out.print("로그인 실패");
		out.print("ID, PW를 확인하세요");
	} else {
		out.println("로그인을 해주세요!!!");
	}
	%>

	<form action="./ResponseLogin.jsp" method="get">
		아이디 : <input type="text" name= "user_id" /> <br>
		패스워드 : <input type="password" name= "user_pw"/> <br>
		<input type= "submit" value="로그인"/>
	</form>
	<hr>
	<h2>2. http response header add</h2>
	<form action="./ResponseHeader.jsp" method="get">
		날짜 형식 : <input type ="text" name= "add_date" value= "2024-07-23 11:30"/> <br>
		숫자 형식 : <input type ="text" name= "add_int" value= "8282"/> <br>
		문자 형식 : <input type ="text" name= "add_str" value= "MBC"/> <br>
		<input type= "submit" value="Response_add"/>
	
	</form>
	
</body>
</html>