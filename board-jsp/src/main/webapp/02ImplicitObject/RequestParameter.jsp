<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><title>RequestParameter.jsp : RequstMain.jsp에서 넘어온 값처리</title>
</head><body>

<% // 스크립틀릿 : 자바의 원시코드
	request.setCharacterEncoding("utf-8"); // post방식의 한글 처리법
	String id = request.getParameter("id");
	String sex = request.getParameter("sex");
	String[] favo = request.getParameterValues("favo");
	String favoSTR = ""; // 배열에 문자열을 추출
	if(favo != null){ // 관심사항이 빈것이 아니면
		for(int i=0 ; i<favo.length ; i++){
			favoSTR += favo[i] + " ";
		} // 배열에 있는 문자열을 추출해서 붙여 1개로 만듬
	}
	
	String intro = request.getParameter("intro").replace("\r\n", "<br>");
	// 키보드에 엔터는 라인피드, 캐리지리턴이 결합된 코드 ->  브라우져에서는 <br> 엔터임
			
%>
	<ol>
		<li>아이디 : <%= id %></li>
		<li>성별   : <%= sex %></li>
		<li>관심사항 : <%= favoSTR %> </li>
		<li>자기소개 : <%= intro %></li>
	</ol>



</body>
</html>