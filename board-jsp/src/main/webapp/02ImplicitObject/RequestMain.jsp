<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestMain.jsp : 요청에대한 처리를 담당</title>		
</head>
<body>
	<h1>1. 클라이언트와 서버의 환경정보 읽기</h1>
	<a href="./RequestWebInfo.jsp?eng=hello&han=안녕">get방식의 url로 요청</a>
	<br>
	<hr>
	<form action="RequestWebInfo.jsp" method="get">
		영어: <input type="text" name="eng" value="Bye" /> <br>
		한글: <input type="text" name="han" value="잘가"/> <br>
				<input type="submit" value="get버튼"/>
	</form>
	<hr>
	<h2>2. 클라이언트의 요청 매개변수 읽기</h2>
	<form action="RequestParameter.jsp" method="post">
	아이디 : <input type="text" name="id" value=""/><br>
	
	성별: <input type="radio" name="sex" value="man"/>남자
		  <input type="radio" name="sex" value="woman"/>여자<br>
		
	관심사항 : <input type="checkbox" name="favo" value="eco"/>경제
			   <input type="checkbox" name="favo" value="pol"/>정치
			   <input type="checkbox" name="favo" value="ent"/>연예<br>
			   
	자기소개 : <textarea rows="4" clos="30" name="intro">자기소개</textarea> <br>
			   <input type="submit" value="전송"/>
			   </form>
			   
	<hr>
	<h2>3. HTTP 요청 헤더 정보 읽기</h2>
	<a href="RequestHeader.jsp">환영합니다.</a>		   
			   
			   

</body>
</html>