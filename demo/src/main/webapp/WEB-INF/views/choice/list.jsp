<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인생영화 선택목록</title>
</head>
<body>
<div class="container"> 
		<h4><security:authentication property="name" />님의 인생영화 목록입니다!<br /></h4>
		<a href="${pageContext.request.contextPath}/choice/insert">나의 인생영화 등록</a>
		<table class="table">
			<tbody>
				<c:forEach var="tmp" items="${list}">
				<tr>
					<td rowspan="6"><img src="${pageContext.request.contextPath}/choice/getimg?no=${tmp.choice_code}" style="height:500px;"></td>
					<td>영화제목: ${tmp.movie_title}</td>
				</tr>
				<tr>
					<td>관람횟수: ${tmp.choice_freq}</td>
				</tr>
				<tr>
					<td>인생 영화 선정 이유: ${fn:replace(tmp.choice_reason, newLineChar, "<br />")}</td>
				</tr>
				<tr>
					<td>${tmp.choice_category}</td>
				</tr>
				<tr>
					<td><c:set var="dt" value="${fn:split(tmp.choice_date, ' ')}" />
						등록일: ${dt[0]}</td>
				</tr>
				<tr>
					<td>작성자: ${tmp.choice_id}
						<a href="${pageContext.request.contextPath}/choice/update" class="btn btn-primary">수정</a>
						<a href="${pageContext.request.contextPath}/choice/update" class="btn btn-danger">삭제</a>
						</td>
				</tr>			
				</c:forEach>
				
								
			</tbody>
		</table>
	</div>
</body>
</html>