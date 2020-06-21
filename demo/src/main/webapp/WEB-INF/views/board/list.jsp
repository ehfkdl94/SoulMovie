<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" 
		rel="stylesheet"/>
</head>

<body>

	<div class="container"> 
		
		<div class="form-inline">
			<div style="margin-right:30px">
				<a href="${pageContext.request.contextPath}/board/insert" class="btn btn-success">글쓰기</a>
			</div>
			
			<form action="${pageContext.request.contextPath}/board/list" method="get">
				<input type="hidden" name="page" value="1" />
				<input type="text" name="text" class="form-control" placeholder="검색어" />
				<input type="submit" class="btn btn-success" value="검색어" />
			</form>
		</div>
	
		<table class="table table-sm">
			<thead>
				<tr>	
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
			</thead>
			
			<tbody>
				<c:if test="${empty list}">
    				<tr>
    					<td colspan="5">검색결과가 없습니다.</td>
    				</tr>
				</c:if>
				
				<c:if test="${!empty list}">
				<c:forEach var="tmp" items="${list}">
				<tr>
					<td>${tmp.brdno}</td>
					<td>
						<a href="/board/content?no=${tmp.brdno}">${tmp.brdtitle}</a>
					</td>
					<td><fmt:formatNumber value="${tmp.brdhit}" pattern="#,###" /></td>
					<td>${tmp.username}</td>
					<td>
						<c:set var="dt" value="${fn:split(tmp.brddate, ' ')}" />
						${dt[0]}
					</td>
				</tr>
				</c:forEach>
				</c:if>
			</tbody>
		</table>
		
		<div id="pagination-div"></div>

	</div>
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>

	<script>
		$(function(){
			$('#pagination-div').twbsPagination({
		        totalPages: Number('${cnt}'), /* 전체 페이지 수*/
		        visiblePages: 10, /*화면에 표시할 페이지 수 */
		        startPage : Number('${param.page}'), /* 주소창에 ~~/board/list?page=1 */
		        initiateStartPageClick : false,
		        onPageClick: function (event, page) {
		             window.location.href = "/board/list?page=" + page + "&text=${param.text}";
		        }
		    });
		})
	</script>
	
</body>
</html>