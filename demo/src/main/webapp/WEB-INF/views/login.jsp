<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet" />

</head>
<body>
	<div class="container">
		<div style="width: 400px; padding: 20px; border: 1px solid #cccccc;">
			<form action="/member/login" method="post">
				<div class="form-inline" style="margin: 5px;">
					<label style="width: 100px;">아이디</label> <input type="text"
						class="form-control" name="userid" placeholder="아이디를 입력하세요" />
				</div>
				<div class="form-inline" style="margin: 5px;">
					<label style="width: 100px;">비밀번호</label> <input type="password"
						class="form-control" name="password" placeholder="비밀번호를 입력하세요" />
				</div>
				<div class="form-inline" style="margin: 5px;">
					<label style="width: 100px;"></label> <input type="submit"
						class="btn btn-success" value="로그인" />&nbsp; <a href="/"
						class="btn btn-secondary">홈으로</a>
				</div>
			</form>
		</div>
	</div>
</body>
</html>