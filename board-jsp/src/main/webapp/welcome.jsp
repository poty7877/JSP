<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jsp 시그니처 필수(@ 지시어) -->
<%!String str1 = "jsp";
	String str2 = "안녕하세요!"; // 필드처럼 변수선언. !선언부 : 변수선언, 메서드%>

<!DOCTYPE html>
<!-- html 5 시작 -->

<html>
<!-- html 문서 시작 -->

<head>
<!-- head 시작(문서의 각종 설정 정보) -->

<meta charset="UTF-8">
<!-- 문서의 메타 정보 -->

<title>HelloJSP</title>
<!-- 브라우저의 제목 -->

</head>
<!-- head 종료 -->

<body>
	<!-- 본문(브라우저의 안쪽 페이지) -->
	<h2>
		처음 만들어 보는
		<%=str1%></h2>
	<!-- = 표현식 : 변수 내용출력(계산x) -->
	<!-- h태그는 제목태그로 글자 크기가 존재함 1(큼)~6(작음) -->
	<p>
		<!-- 문단 태크 println -->
		<%
		// 스크립틀릿 : 원시적인 java 코드 사용
		out.println(str2 + str1 + "입니다. 지금부터 시작 합시다.");
		%>
	</p>
</body>
<!-- 본문 끝 -->

</html>
<!-- html 문서 끝 -->

