<%@page import="utils.BoardPage"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BoardDAO boardDAO = new BoardDAO(application);
Map<String, Object> param = new HashMap<String, Object>();
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) { // 검색어가 있으면
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);

}
int totalCount = boardDAO.selectCount(param); // 검색조건을 파라미터로 dao로 넘어가고 결과는 int totalCount로 받음
// 전체 페이지 수 계산
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
// 현재 페이지에 보여줄 리스트 개수 10
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
// 한 화면에 보여줄 블럭 수 5
int totalPage = (int) Math.ceil((double) totalCount / pageSize);
// 총 페이지 수 = 	11	  <-	(올림)10.8	=	108     /    10 // 3단계

// 현재 페이지용 코드
int pageNum = 1; // 무조건 처음페이지는 1
String pageTemp = request.getParameter("pageNum"); // List.jsp?pageNum=1
if(pageTemp != null && !pageTemp.equals("")) { // url로 넘어온 값이 있으면 
	pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 적용
}
//목록에 출력할 게시물 범위를 계산 2단계

int start = (pageNum - 1 ) * pageSize + 1; // 첫 게시물 번호 (11)
//    11  =   ( 2  -   1) *   10   +   1
int end = pageNum * pageSize ; // 마지막 게시물 번호 (20)
//    20  =  2   *   10
param.put("start", start); 
param.put("end", end); // map을 통해 검색조건과 같은 타입으로 전달이 됨
//검색조건에 대한 변수 선언 - Map<String, Obeject> maps

// param -> searchField, searchWord, start, end 전달

List<BoardDTO> boardLists = boardDAO.selectList(param); // 검색조건을 파라미터로 dao로 넘어가고 결과는 list로 받음

boardDAO.close();// 5단계
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List.jsp : BoardDTO, BoardDAO를 활용한 list 출력 + 검색</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<!-- 상단메뉴(반복) -->
	<!-- 검색폼 -->
	<h2 align="center">회원제 게시판 - 목록보기(list.jsp)</h2>
	<form method="get">
		<table border="1" width="100%">
			<tr>
				<!-- 1줄 -->
				<td align="center">
					<!-- 1칸 : 가운데 정렬 --> <select name="searchField">
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="id">아이디</option>
				</select> <!-- 검색 필드 설정 --> <input type="text" name="searchWord" /> <!-- 검색 단어 -->
					<input type="submit" value="검색하기" /> <!-- 버튼 -->
				</td>
			</tr>
		</table>
	</form>
	<!-- boardList method 활용 -->
	<table border="1" width="100%">
		<tr>
			<!-- 제목한줄 -->
			<th width="10%">번호</th>
			<th width="50%">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
		</tr>
		<!-- 제목행 끝  다음 : 목록-->
		<%
		if (boardLists.isEmpty()) { // dao에서 리스트로 나온 값이 비었을 때
		%>
		<tr>
			<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
		</tr>
		<%
		} else { // 등록된 게시물이 있으면,

		int virtualNum = 0; // 가상번호
		int countNum = 0; // 페이징 처리 처리용으로 개선
		for (BoardDTO dto : boardLists) { // boardLists dao에서 받은 결과 리스트 

			/* virtualNum = totalCount--; //게시물의 총개수에서 -1 */
			virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++) ;
		%>
		<tr>
			<td><%=virtualNum%></td>
			<td align="left"><a href="View.jsp?num=<%=dto.getNum()%>"> <!-- ?num2 request.getParameter("num"); -->
					<%=dto.getTitle()%></a></td>
			<td><%=dto.getId()%></td>
			<td><%=dto.getVisitcount()%></td>
			<td><%=dto.getPostdate()%></td>
		</tr>
		<%
		}
		}
		%>

	</table>
	<!-- 리스트 종료 -->
	<!-- 글쓰기 테이블 -->
	<table border="1" width="100%">
		<tr align="center">
		<td>
		<%= BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI()) %>
		</td>
			<td>
				<button type="button" onclick="location.href='Write.jsp';">글쓰기</button>
			</td>
		</tr>

	</table>
</body>
</html>