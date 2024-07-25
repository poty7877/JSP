<%@page import="memberShip.MemberDTO"%>
<%@page import="memberShip.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginProcess.jsp : form 으로 받은 request값 처리</title>
</head>
<body>
	<!-- dto와 dao를 이용하여 로그인 처리 -->
	<%
	String userId = request.getParameter("user_id");
	String userPw = request.getParameter("user_pw");
	// form 에서 넘어온 데이터를 변수로 넣음.

	String driver = application.getInitParameter("OracleDriver");
	String url = application.getInitParameter("OracleUrl");
	String id = application.getInitParameter("OracleId");
	String pw = application.getInitParameter("OraclePw");
	// DAO는 web.xml 2번째 생성자

	MemberDAO memberDAO = new MemberDAO(driver, url, id, pw); // 1단계 , 2단계
	MemberDTO memberDTO = memberDAO.getMemberDTO(userId, userPw); // 3단계, 4단계
	memberDAO.close(); // 5단계
	//id ,pw를 넣고 객체를 받음. -> 성공 dto, 실패 null

	// 성공시 세션, 실패시 뒤로돌아감
	if (memberDTO.getId() != null) { // DB에 정보가 있음
		session.setAttribute("UserId", memberDTO.getId()); // 세션에 id 넣음
		session.setAttribute("UserName", memberDTO.getName()); // 세션에 name 넣음
		// 페이지 이동 해야 함
		response.sendRedirect("LoginForm.jsp");
	} else { // DB에 정보가 없음
		request.setAttribute("LoginErrMsg", "id,pw를 확인하세요");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
	%>


</body>
</html>