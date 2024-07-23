<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ResponseLogin.jsp : 로그인 정보를 파악</title>
</head>
<body>
	<%
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	if (id.equals("kkw") && pw.equals("1234")) { // ID와 PW가 일치하면,
		response.sendRedirect("./ResponseWelcome.jsp"); // 성공시 ResponseWelcome.jsp페이지로 이동
	} else { // ID와 PW가 일치하지 않으면,
		request.getRequestDispatcher("./ResponseMain.jsp?loginErr=1").forward(request, response); 
		// 실패한 메시지를 가지고 돌아가야 함. // .forward(request, response) = 암기!
	}
	%>

</body>
</html>