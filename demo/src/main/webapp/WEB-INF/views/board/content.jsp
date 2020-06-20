<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>content</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css"  rel="stylesheet"/>
</head>

<body>
	<div class="container">
		글번호 : ${obj.brdno}<br />
		글제목 : ${obj.brdtitle}<br />
		글내용 : ${fn:replace(obj.brdcontent, newLineChar, "<br />")}<br />
		작성자 : ${obj.brdid}<br />
		조회수 : ${obj.brdhit}<br />
		날짜 : <c:set var="dt" value="${fn:split(obj.brddate, ' ')}" />
						${dt[0]}<br />
		<img src="${pageContext.request.contextPath}/board/getimg?no=${obj.brd_no}" width="100px" height="100px" /><br />
		<hr />
		<a href="${pageContext.request.contextPath}/board/list" class="btn btn-success">목록</a>
		<a href="${pageContext.request.contextPath}/board/update?no=${obj.brd_no}" class="btn btn-success">수정</a>
		<a href="${pageContext.request.contextPath}/board/delete?no=${obj.brd_no}" class="btn btn-success">삭제</a>
		
		<c:if test="${prev != 0}">
		<a href="${pageContext.request.contextPath}/board/content?no=${prev}" class="btn btn-success">이전글</a>
		</c:if>
		
		<c:if test="${next != 0}">
		<a href="${pageContext.request.contextPath}/board/content?no=${next}" class="btn btn-success">다음글</a>
		</c:if>
	</div>
</body>
</html>