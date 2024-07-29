<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm.jsp : 로그인 창 (성공-> 세션에저장 //)</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>로그인 페이지</h2>
	<span style="color: red; font-size: 1.2em;"> <%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
		<!-- 조건 : request영역에 "LoginErrMsg"가 있니 ? true : false -->
	</span>
	<!-- span태그는 1줄 글자 출력용 -->
	<%
	if (session.getAttribute("UserId") == null) {
		// 로그아웃 상태
	%><!-- 로그인 스크립트 실행 -->
	<script>
		function validateForm(form) { // validateForm을 호출하면 form 정보를 받는다. (32~37)
			if (!form.user_id.value) { // form 안에 user_id안에 value값이 없으면,
				alert("아이디를 입력하세요."); // 경고창 출력
				return false; // false를 반환
			}
			if (form.user_pw.value == "") { //form안에 user_pw안에 value값이 없으면,
				alert("패스워드를 입력하세요."); // 경고창 출력
				return false; // false를 반환
			}
		}
	</script>
	<form action="LoginProcess.jsp" method="post" name="loginFrm"
		onsubmit="return validateForm(this);">
		<!-- onsubmit값에 return이 true이가 나와야 action으로 진행. false이면 뒤로 -->
		아이디 : <input type="text"name="user_id"/><br> 패스워드 : <input
			type="password" name="user_pw" /><br> <input type="submit"
			value="로그인하기" />
		<!-- 1순위 : onsubmit -> 2순위 : action -> -->
	</form>
	<%
	} else { // 로그인 된 상태
	%>
	<%=session.getAttribute("UserName")%>
	<%=session.getAttribute("UserId")%>
	회원님, 로그인하셨습니다.
	<br>
	<a href="Logout.jsp">[로그아웃]</a>
	<!-- 세션제거 -->
	<%
	}
	%>
</body>
</html>