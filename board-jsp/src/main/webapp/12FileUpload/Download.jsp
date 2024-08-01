<%@page import="utils.JSFunction"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
try {
	String saveDirectory = application.getRealPath("/Uploads"); // 다운로드 받을 경로
	String saveFileName = request.getParameter("sName"); // 저장된 파일 명
	String originalFileName = request.getParameter("oName"); // 원본 파일 명

	//하드디스크에 있는 파일을 찾아 와야 함
	File file = new File(saveDirectory, saveFileName); // 경로와 파일명으로 객체 생성
	InputStream inputStream = new FileInputStream(file); // 바이트 형식으로 객체 생성

	// 윈도우용(iso-8895-1), 리눅스용(UTF-8), 유닉스용(UTF-8)
	String client = request.getHeader("User-Agent"); // 웹 브라우저 종류 판단
	if (client.indexOf("WOW64") == 1) {
		originalFileName = new String(originalFileName.getBytes("UTF-8"), "iso-8859-1");
	} else {
		originalFileName = new String(originalFileName.getBytes("ksc5601"), "iso-8859-1");
	}

	// 파일 다운로드용 응답 헤더 설정
	response.reset(); // 초기화
	response.setContentType("application/octet-stream"); // 8비트씩처리
	response.setHeader("Content-Disposition", "attachment; filename=\"" + originalFileName + "\""); // 응답헤더에 파일명을 보냄
	response.setHeader("Content-length", "" + file.length()); // 응답헤더에 파일크기를 보냄
	out.clear(); // 출력 스트림 초기화

	// 출력 스트림에 파일 내용 출력
	OutputStream outputStream = response.getOutputStream(); // 출력용 객체 응답헤더에 생성
	byte b[] = new byte[(int) file.length()]; // 파일의 크기만큼 배열 생성
	int readBuffer = 0;
	while ((readBuffer = inputStream.read(b)) > 0) {
		outputStream.write(b, 0, readBuffer);

		inputStream.close();
		outputStream.close();
	}
} catch (FileNotFoundException e) {
	JSFunction.alertBack("파일을 찾을 수 없습니다.", out);
	e.printStackTrace();
} catch (Exception e) {
	JSFunction.alertBack("다운로드 중 예외 발생 | 관리자를 호출 하세요", out);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Download.jsp : 파일 다운로드용 프로세서</title>
</head>
<body>

</body>
</html>