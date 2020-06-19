<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인생영화 등록</title>
</head>
<body>  CHOICE_CATEGORY,  CHOICE_CODE, CHOICE_ID
	<form action="${pageContext.request.contextPath}/choice/insert" method="post">
		영화제목 : <input type ="text" name="movie_title" /> <br />	
				<input type="hidden" name="choice_code" />
		관람 횟수: <input type ="text" name="choice_freq" /> <br />	
		인생영화 선택 이유 : <textarea id="content" name="choice_reason" placeholder="내용을 입력하세요."></textarea><br />
		인생영화 선택 이유 : <input type ="text" name="choice_category" /> <br />
		<input type="hidden" name="choice_id" />
		<input type ="submit" value="등록" />
		<a href="/choice/list">목록</a>
	</form>
</body>
</html>