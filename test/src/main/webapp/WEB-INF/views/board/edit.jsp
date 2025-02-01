<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	h3, textarea, button {
		margin: 1rem;
	}
</style>
</head>
<body>
	
	<form action="/board/edit" method="POST">
	
		<input type="hidden" name="id" value="${board.id}">
		
		제목: <input name="boardTitle" value="${board.boardTitle}">
		작성자: <input name="boardWriter" value="${board.boardWriter}" disabled>
		
		<h3>글 내용</h3>
		<textarea rows="10" cols="10" name="boardContents">${board.boardContents}</textarea>
		
		조회수: <input name="boardHits" value="${board.boardHits}" disabled>
		작성일: <input name="boardCreatedTime" value="${board.boardCreatedTime}" disabled>
		
		<button type="submit">수정하기</button>
	</form>
	
	
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function() {

		
	});
</script>
</body>
</html>