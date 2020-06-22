<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인생영화 선택목록</title>
</head>
<body>
<div class="container"> 
		<h4>인생영화 선택목록</h4>
		<a href="${pageContext.request.contextPath}/choice/insert">나의 인생영화 등록</a>
		<table class="table">
			<thead>
				<tr>	
					<th>영화 제목</th>	
					<th>관람 횟수</th>	
					<th>선정 이유</th>
					<th>이유 카테고리</th>					
					<th>등록일</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="tmp" items="${list}">
				<tr>
					<td>${tmp.movie_title}</td>
					<td>${tmp.choice_freq}</td>
					<td>${tmp.choice_reason}</td>
					<td>${tmp.choice_category}</td>
					<td>${tmp.choice_date}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>