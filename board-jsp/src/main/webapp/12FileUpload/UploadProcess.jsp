
<%@page import="fileUpload.MyFileDAO"%>
<%@page import="fileUpload.MyFileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// method="post" enctype="multipart/form-data"
// 필요 요소 4가지 (cos.jar)
// 1. request영역
// 2. 저장경로
// 3. 단일파일 크기(MaxFileSize)
// 4. 인코딩 방식
try {

	// 1단계 : cos.jar 연결
	String saveDirectory = application.getRealPath("/Uploads"); // 저장할 디렉토리 http://192.168.111.101:80/board-jsp/Uploads
	int MaxPostSize = 1024 * 1024 * 100; // 파일 최대 크기 100Mb
	String encoding = "UTF-8";

	MultipartRequest mr = new MultipartRequest(request, saveDirectory, MaxPostSize, encoding);
	System.out.println("saveDirectory : " + saveDirectory);
	System.out.println("MaxPostSize : " + MaxPostSize);

	//2. 새로운 파일명 생성
	String fileName = mr.getFilesystemName("attachedFile"); // 현재 파일 이름
	String ext = fileName.substring(fileName.lastIndexOf(".")); // 파일 확장자
	String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
	String newFileName = now + ext; // 새로운 파일 이름("업로드일시.확장자")

	System.out.println("fileName : " + fileName);
	System.out.println("ext : " + ext);
	System.out.println("now : " + now);
	System.out.println("newFileName : " + newFileName);

	// 3. 파일명 변경
	File oldFile = new File(saveDirectory + File.separator + fileName);
	File newFile = new File(saveDirectory + File.separator + newFileName);
	oldFile.renameTo(newFile);

	System.out.println("oldFile : " + oldFile);
	System.out.println("newFile : " + newFile);

	// 4. FileUploadMain에서 넘어온 폼 값 처리
	String name = mr.getParameter("name");
	String title = mr.getParameter("title");
	String[] cateArray = mr.getParameterValues("cate");
	StringBuffer cateBuf = new StringBuffer(); // String append 가능
	if (cateArray == null) {
		cateBuf.append("선택 없음");
	} else {
		for (String s : cateArray) {
	cateBuf.append(s + ", ");
		} // 사진, 과제, 워드, 음원
	}

	// 5. DTO에 4번 값 넣기
	MyFileDTO myFileDTO = new MyFileDTO();
	myFileDTO.setName(name);
	myFileDTO.setTitle(title);
	myFileDTO.setCate(cateBuf.toString());
	myFileDTO.setOfile(fileName);
	myFileDTO.setSfile(newFileName);

	// 6.DAO를 통해 데이터베이스에 반영
	MyFileDAO myFileDAO = new MyFileDAO();
	myFileDAO.insertFile(myFileDTO);
	myFileDAO.close();

	//7. 파일 목록 JSP로 리디렉션
	response.sendRedirect("FileList.jsp"); // 성공시 FileList.jsp로 감
} catch (Exception e) {
	System.out.println("UploadProcess.jsp 오류 발생");
	e.printStackTrace();
	request.setAttribute("eroorMessage", "파일 업로드 오류");
	request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);

}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UploadProcess.jsp : cos.jar를 활용하여 파일처리하고 dao로 연결</title>
</head>
<body>

</body>
</html>