<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<style>
		body {
			margin: 2rem;	
		}
	</style>
</head>
<body>
	<h2>Hello World!</h2>
	
	<div class="btn-group" role="group" aria-label="Basic outlined example">
	  <button type="button" class="btn btn-outline-primary">글작성</button>
	  <button type="button" class="btn btn-outline-primary">글목록</button>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<script type="text/javascript">
	$('button').on('click', function(e) {
		e.preventDefault();
		
		switch ($(this).text()) {
			case '글작성':
				location.href='/board/save';
				break;
				
			case '글목록':
				location.href='/board';
				break;
		}
	});
</script>
</body>
</html>
