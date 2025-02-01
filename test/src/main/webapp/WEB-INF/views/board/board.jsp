<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<style>
	body {
		margin: 2rem;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/modules/navbar.jsp" />

	
	<table class="table" style="width: 50%;">
	  <thead>
	    <tr>
	      <th scope="col">글번호</th>
	      <th scope="col">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">조회수</th>
	      <th scope="col">작성일자</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:forEach var="board" items="${boardList}">
		    <tr>
		  		<th scope="row">${board.id}</th>
				<td><a href="/board/detail?id=${board.id}&pageNo=${paging.page}">${board.boardTitle}</a></td>
				<td>${board.boardWriter}</td>
				<td>${board.boardHits}</td>
				<td><fmt:formatDate value="${board.boardCreatedTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
		    </tr>
	    </c:forEach>
	  </tbody>
	</table>


	<nav class="mt-5" aria-label="Page navigation example">
	  <ul class="pagination">
  		<li class="page-item"><a class="page-link" href="/board?pageNo=${1}">맨앞</a></li>
  		
	  	<c:choose>
	  		<%-- 현재 페이지가 1페이지면 disabled --%>
	  		<c:when test="${paging.page <= 1}">
	  			<li class="page-item"><a class="page-link" style="color:gray">이전</a></li>
	  		</c:when>
	  		
		  	<c:otherwise>
		  		<li class="page-item"><a class="page-link" href="/board?pageNo=${paging.page - 1}">이전</a></li>
		  	</c:otherwise>
	  	</c:choose>
	  	
	  	<!-- for(int i=startPage; i < endPage; i++) -->
	  	<c:forEach begin="${paging.start}" end="${paging.end}" var="i"> <!-- begin 시작 end 끝 var 변수 step 증감 값 -->
	  		<c:choose>
	  			<%-- 요청한 현재 페이지에 있는 경우 disabled --%>
	  			<c:when test="${i eq paging.page}">
	  				<li class="page-item"><a class="page-link" style="font-weight:bold">${i}</a></li>
	  			</c:when>
	  			
	  			<c:otherwise>
				    <li class="page-item"><a class="page-link" href="/board?pageNo=${i}">${i}</a></li>
	  			</c:otherwise>
	  		</c:choose>
	  	</c:forEach>
	    
	    <c:choose>
	    	<%-- 현재 페이지가 마지막 페이지면 disabled --%>
	    	<c:when test="${paging.page >= paging.maxPage}">
	    		<li class="page-item"><a class="page-link" style="color:gray">다음</a></li>
	    	</c:when>
	    	
	    	<c:otherwise>
		    	<li class="page-item"><a class="page-link" href="/board?pageNo=${paging.page + 1}">다음</a></li>
	    	</c:otherwise>
	    </c:choose>
	    
	    <li class="page-item"><a class="page-link" href="/board?pageNo=${paging.maxPage}">맨뒤</a></li>

	  </ul>
	</nav>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script>

	$('button').on('click', function(e) {
		e.preventDefault();
		
		switch ($(this).text()) {
			case '홈으로':
				location.href='/';
				break;
				
			case '글작성':
				location.href='/board/save';
				break;
		}
	});
	
</script>
</body>
</html>