<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>FileUpload</title></head>
<script>
    function validateForm(form) { 
        if (form.name.value == "") {
            alert("작성자를 입력하세요.");
            form.name.focus(); // 커서이동
            return false;
        }
        if (form.title.value == "") {
            alert("제목을 입력하세요.");
            form.title.focus();
            return false;
        }
        if (form.attachedFile.value == "") {
            alert("첨부파일은 필수 입력입니다.");
            return false;
        }
    }
</script>
<body>
	<jsp:include page="../Common/Link.jsp" />
    <h3>파일 업로드</h3>
    <span style="color: red;">${errorMessage }</span> <!-- 에러 출력용 태그 -->
    
    <!-- enctype : 파일 전송용(multipart/form-data) -> post -->
    <form name="fileForm" method="post" enctype="multipart/form-data"
          action="UploadProcess.jsp" onsubmit="return validateForm(this);">
        작성자 : <input type="text" name="name" /><br />
        제목 : <input type="text" name="title" /><br /> 
        카테고리(선택사항) : 
            <input type="checkbox" name="cate" value="사진" checked />사진 
            <input type="checkbox" name="cate" value="과제" />과제 
            <input type="checkbox" name="cate" value="워드" />워드 
            <input type="checkbox" name="cate" value="음원" />음원 <br /> 
        첨부파일 : <input type="file" name="attachedFile" /> <br /> <!-- type=file 인 경우 찾아보기가 나옴. -->
        <input type="submit" value="전송하기" />
    </form>
</body>
</html>