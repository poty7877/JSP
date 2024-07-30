<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../Common/IsLoggedIn.jsp"%>
<!-- 로그인 여부 확인 -->

<%
String title = request.getParameter("title");
String content = request.getParameter("content"); // Write.jsp 에서 입력하여 넘어온 값 

BoardDTO boardDTO = new BoardDTO();
boardDTO.setTitle(title);
boardDTO.setContent(content);

boardDTO.setId(session.getAttribute("UserId").toString()); // 세션영역에 있는 값은 객체이기 때문에 tostring()으로 넣어줘야함.
// 객체에 제목, 내용, 작성자 보관 완료

BoardDAO boardDAO = new BoardDAO(application); // application 빼먹지 않도록 주의. 1,2단계
int result = boardDAO.insertWrite(boardDTO); // 3,4단계 적용
/* int result = 0;
for (int i = 1; i <= 100; i++) { // 글쓰기 1번에 100개 저장
	boardDTO.setTitle(title + "-" + i);
	result = boardDAO.insertWrite(boardDTO);
} */
boardDAO.close(); // 5단계

if (result > 0) { // INSERT 결과값이 1이면 성공
	response.sendRedirect("List.jsp");
%>
<%
} else {
JSFunction.alertBack("글 저장 실패, 뒤로 돌아갑니다.", out);
%>
<%
}
%>




