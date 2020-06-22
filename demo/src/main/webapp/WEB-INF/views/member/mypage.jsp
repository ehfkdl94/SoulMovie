<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>My page</title>
</head>
<body>

	<div class="container"> 
		
		아이디 : ${obj.username}<br />
		이름: ${obj.userrname}<br />
		비밀번호 : ${obj.password}<br />
		닉네임 : ${obj.usernick}<br />
		연령대 : ${obj.userage}<br />
		성별 : ${obj.usergender}<br />
		이메일 : ${obj.useremail}<br />
		가입일: ${obj.joindate}<br />
	</div>
	

			<!-- 
			아이디 
			닉네임
			비밀번호 버튼
			연령대
			성별
			이메일
			가입일
			이름
			 -->







</body>
</html>