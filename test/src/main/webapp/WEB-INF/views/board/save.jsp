<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/board/save" method="POST" style="margin-bottom: 3rem;">
		<input name="boardWriter" placeholder="작성자">
		<input name="boardPass" placeholder="비밀번호">
		<input name="boardTitle" placeholder="제목">
		<input name="boardContents" placeholder="내용을 입력하세요">
		<input type="submit" value="작성">
	</form>
	
	<a href="/">홈으로 가기</a>
</body>
</html>