<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Common/IsLoggedIn.jsp"%>
<%
String num = request.getParameter("num"); // 삭제할 번호
BoardDTO boardDTO = new BoardDTO();
BoardDAO boardDAO = new BoardDAO(application); // 1단계 ,2단계
boardDTO = boardDAO.selectView(num); // 번호로 객체를 가져와 빈객체 dto에 넣음

String sessionID = session.getAttribute("UserId").toString(); // 로그인한 이름
int delResult = 0; // 삭제 성공 여부 판단 // 1이면 성공 | 0이면 실패
if (sessionID.equals(boardDTO.getId())) { // 로그인한 유저와 게시물작성자의 일치 여부확인
	//일치하면 삭제
	boardDTO.setNum(num);
	delResult = boardDAO.deletePost(boardDTO); // 객체를 넣어 삭제하고 int로 return받아 변수에 저장 // 3단계 4단계
	boardDAO.close(); // 5단계
	if (delResult == 1) {
		JSFunction.alertLocation("삭제 되었습니다.", "List.jsp", out);
	} else {
		JSFunction.alertBack("삭제 실패 - 뒤로 갑니다.", out);
		return;
	}

} else {
	//일치하지않으면 삭제 안됨
	JSFunction.alertBack("작성자만 삭제 가능합니다. - 뒤로 갑니다.", out);
	return;
}
%>
