<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <%@include file="/WEB-INF/views/head.jsp"%>
  <title>Soul Movie</title>  
</head>

<body>
<%@include file="/WEB-INF/views/header.jsp"%>
  <section style="margin-top:100px;">
인생영화 수정
	<form action="${pageContext.request.contextPath}/choice/update" method="post" >
			<input type="hidden" class="form-control" name="choice_no" value="${obj.choice_no}"/>		
			시청 횟수 : <input type="text" class="form-control" name="choice_freq" value="${obj.choice_freq}"/>	<br />		
			인생영화 선택 이유 : <textarea id="content" name="choice_reason" placeholder="${obj.choice_reason}"></textarea><br />
							<input type="checkbox" name="choice_category" value="영상미" />영상미
							<input type="checkbox" name="choice_category" value="스토리" />스토리
							<input type="checkbox" name="choice_category" value="연기" />연기
							<input type="checkbox" name="choice_category" value="음악" />음악
							<input type="checkbox" name="choice_category" value="기타" />기타<br />			
			<hr />
			<input type="submit" class="btn btn-success" value="저장" />
	</form>
</section>
<%@include file="/WEB-INF/views/footer.jsp"%>	
</body>
</html>