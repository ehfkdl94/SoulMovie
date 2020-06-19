<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login</title>
</head>

<body>
	<form action='/loginProcess' method='POST' >
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<input type="text" class="form-control" id="username" name="username" placeholder="ID" >
		<input type="password" class="form-control" id="password" name="password" placeholder="Password" >
		<input type="submit" type="submit" value="로그인" />
	</form>
</body>
</html>