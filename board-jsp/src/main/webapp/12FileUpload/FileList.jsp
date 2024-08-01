<%@page import="java.net.URLEncoder"%>
<%@page import="fileUpload.MyFileDTO"%>
<%@page import="java.util.List"%>
<%@page import="fileUpload.MyFileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileList.jsp : 자료 게시판 리스트</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>자료실 게시판 리스트</h2>
	<a href="FileUploadMain.jsp">파일 업로드</a>
	<%
	MyFileDAO myFileDAO = new MyFileDAO(); // sql 1단계 2단계
	List<MyFileDTO> fileLists = myFileDAO.myFileLists(); // sql 3단계 4단계
	myFileDAO.close(); // sql 5단계
	%>

	<table border="1">
		<tr>
			<th>No</th>
			<th>작성자</th>
			<th>제목</th>
			<th>카테고리</th>
			<th>원본 파일명</th>
			<th>저장된 파일명</th>
			<th>작성일</th>
			<th>첨부파일</th>
		</tr>
		<%
		for (MyFileDTO f : fileLists) {
		%>
		<tr>
			<td><%=f.getIdx()%></td>
			<td><%=f.getName()%></td>
			<td><%=f.getTitle()%></td>
			<td><%=f.getCate()%></td>
			<td><%=f.getOfile()%></td>
			<td><%=f.getSfile()%></td>
			<td><%=f.getPostdate()%></td>
			<td><a
				href="Download.jsp?oName=<%=URLEncoder.encode(f.getOfile(), "UTF-8")%>
			&sName=<%=URLEncoder.encode(f.getSfile(), "UTF-8")%>">[다운로드]</a></td>
			<%-- URLEncoder.encode(f.getOfile(), "UTF-8") :한글처리 및 특수문자는 인코딩 해야 함--%>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>