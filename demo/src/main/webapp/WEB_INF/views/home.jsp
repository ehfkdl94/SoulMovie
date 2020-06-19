<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>security _ Home</title>

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet" />
</head>
<body>
	<h1>인덱스 페이지 입니다.</h1>

	<security:authorize access="!isAuthenticated()">
	<p>로그인 되지 않은 상태</p>
	<a href="${pageContext.request.contextPath}/security/login">로그인</a>
	<a href="${pageContext.request.contextPath}/security/join">회원가입</a>
	</security:authorize>
	

	<security:authorize access="isAuthenticated()">
		<p>로그인 된 상태</p>
		
		<security:authentication property="principal"/> <hr /> 
		로그인한 사용자 권한 : <security:authentication property="authorities"/> <br />
		로그인한 사용자 아이디 : <security:authentication property="name"/> 님 환영합니다 <br />
		<form action="/security/logout" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="submit" value="로그아웃" />
		</form>
		
		<security:authorize access="hasAuthority('ADMIN')">
    		<a href="admin">admin</a>
		</security:authorize>
		
		<security:authorize access="hasAuthority('USER')">
    		<a href="user">user</a>
		</security:authorize>
	</security:authorize>
	

</body>
</html>