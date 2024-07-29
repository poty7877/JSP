<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num"); // 제목 클릭시 게시물의 번호가 num, parameter로 넘어옴
BoardDAO boardDAO = new BoardDAO(application); // 1단계, 2단계
boardDAO.updateVisitCount(num); // 조회 수  증가 3단계, 4단계
BoardDTO boardDTO = boardDAO.selectView(num); // 번호를 이용해서 객체가 넘어옴
boardDAO.close(); // 5단계
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View.jsp : 제목 클릭시 상세 보기 페이지</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<!-- 상단 메뉴 출력용 -->
	<h2>회원제 게시판 - 상세 보기 페이지</h2>
	<script>
		// 삭제 판단
		function deletePost() { // 하단에 삭제버튼을 클릭 시 동작
			var confirmed = confirm(" 정말로 삭제 하시겠습니까? "); // yes=true, no=false 선택
			if (confirmed) { // confirm 창에서 값이 true 이면
				var form = document.writeFrm; // 아래쪽에 form 객체를 변수에 넣음
				form.method = "post";
				form.action = "DeleteProcess.jsp";
				form.submit();
			}

		}
	</script>
	<form name="writeFrm">
		<input type="hidden" name="num" value="<%=num%>" />
		<!-- 다른 페이지로 전달 할 수 있는 값 -->
		<!-- 게시물의 번호 ..? -->
		<table border="1" width="90%">
			<tr>
				<td width="20%">번호</td>
				<td><%=boardDTO.getNum()%></td>
				<td width="20%">작성자</td>
				<td><%=boardDTO.getName()%></td>
			</tr>

			<tr>
				<td width="20%">작성일</td>
				<td><%=boardDTO.getPostdate()%></td>
				<td width="20%">조회수</td>
				<td><%=boardDTO.getVisitcount()%></td>
			</tr>

			<tr>
				<td width="20%">제목</td>
				<td colspan="3"><%=boardDTO.getTitle()%></td>
			</tr>

			<tr height="100px">
				<td width="20%">내용</td>
				<td colspan="3"><%=boardDTO.getContent().replace("\r\n", "<br>")%></td>
			</tr>

			<tr>
				<td colspan="4" align="center">
					<!-- 수정, 삭제, 리스트버튼 --> <!-- 수정, 삭제버튼은 로그인 상태&작성자일치 --> <%
 if (session.getAttribute("UserId") != null && session.getAttribute("UserId").toString().equals(boardDTO.getId())) {
 %>
					<button type="button"
						onclick="location.href='Edit.jsp?num=<%=boardDTO.getNum()%>';">수정</button>

					<button type="button" onclick="deletePost();">삭제</button> <%
 } // if문 종료
 %>
					<button type="button" onclick="location.href='List.jsp';">
						목록 보기</button>

				</td>
			</tr>

		</table>



	</form>


</body>
</html>