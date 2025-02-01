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
	
	<input type="hidden" value="${board.id}" id="boardId">
	<input type="hidden" value="${pageNo}" id="pageNo">
	<h3>제목: ${board.boardTitle}</h3>
	<h3>작성자: ${board.boardWriter}</h3>

	<h3>글 내용</h3>
	<textarea rows="10" cols="10" disabled="disabled">${board.boardContents}</textarea>
	
	<h3>조회수: ${board.boardHits}</h3>
	<h3>작성일: ${board.boardCreatedTime}</h3>
	
	<button>목록</button>
	<button>수정</button>
	<button>삭제</button>
	
	
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function() {
		
		$('button').on('click', function(e) {
			e.preventDefault();
			
			console.log($(this).text());
			console.log($('#boardId').val());
			
			switch ($(this).text()) {
			case '목록':
				location.href='/board?pageNo=' + $('#pageNo').val();
				break;
				
			case '수정':
				location.href='edit?id=' + $('#boardId').val();
				break;
				
			case '삭제':
				$.ajax({
					url: "delete/" + $('#boardId').val(),
					method: "DELETE",
					success: function(resp) {
						alert('삭제가 완료되었습니다.');
						// location.href='/board';
					},
					error: function(xhr) {
						alert('삭제 실패');
					}
				});
				break;

			}
		});
		
	});
</script>
</body>
</html>