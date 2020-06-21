<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title>Cover Template · Bootstrap</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/cover/">

    <!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }
	  td, tr{
	  	color:white;
	  }
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/cover.css" rel="stylesheet">
  </head>
  <body>
    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
  <header class="masthead mb-auto">
    <div class="inner">
      <img src="${pageContext.request.contextPath}/resources/img/logo4.png" alt="">
      <nav class="nav nav-masthead justify-content-center">
        <a class="nav-link active" href="#">Home</a>
        <a class="nav-link" href="#">Features</a>
        <a class="nav-link" href="#">Contact</a>
      </nav>
    </div>
  </header>

  <main role="main" class="inner cover text-center">
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
					<th>작성자</th>
					<th>조회수</th>
					<th>날짜</th>
				</tr>
			</thead>
			
			<tbody>
				<c:if test="${empty list}">
				<tr>
					<td colspan="5">검색결과가 없습니다.</td>
				</tr>
				</c:if>
				
				<c:forEach var="tmp" items="${list}">
				<tr>
					<td>${tmp.brdno}</td>
					<td>
						<a href="/board/content?no=${tmp.brdno}">${tmp.brdtitle}</a>
					</td>
					<td>${tmp.username}</td>
					<td><fmt:formatNumber value="${tmp.brdhit}" pattern="#,###" /></td>
					<td>
						<c:set var="dt" value="${fn:split(tmp.brddate, ' ')}" />
						${dt[0]}
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div id="pagination-div"></div>
  </main>
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
  <footer class="mastfoot mt-auto text-center">
    <div class="inner">
      <p>Cover template for <a href="https://getbootstrap.com/">Bootstrap</a>, by <a href="https://twitter.com/mdo">@mdo</a>.</p>
    </div>
  </footer>
</div>
</body>
</html>
