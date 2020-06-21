<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>게시판 글쓰기</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
		rel="stylesheet" />
</head>
<body>
	<article>
		<div class="container" role="main">
			<h2>게시판 글쓰기</h2>
			<form name="form" id="form" role="form" method="post" action="/board/insert" enctype="multipart/form-data">
				<div class="mb-3">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="brdtitle" id="title" placeholder="제목을 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="brdcontent" id="content" placeholder="내용을 입력해 주세요" ></textarea>
				</div>
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<input type="text" class="form-control" name="username" value="${userid}" >
				</div>				
				<input type="submit" class="btn btn-sm btn-primary" value="저장">
				<button type="button" class="btn btn-sm btn-primary"  onclick="location.href='/board/list'" id="btnList">목록</button>
			</form>
		</div>
	</article>
</body>
</html>