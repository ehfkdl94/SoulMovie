<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인생영화 등록</title>
</head>
<body>CHOICE_NO, CHOICE_FREQ, CHOICE_REASON, CHOICE_CATEGORY, CHOICE_DATE, CHOICE_CODE, CHOICE_ID
	<form action="/choice/insert" method="post">
		영화제목 : <input type ="text" name="userid" /> <br />		
		인생영화 선택 이유 : <input type ="text" name="choice_reason" /> <br />
		인생영화 선택 이유 : <input type ="text" name="choice_category" /> <br />
		<input type ="text" name="userage" /> <br />
		<input type ="submit" value="등록" />
		<a href="/choice/list">목록</a>
	</form>
</body>
</html>