<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>

<!---디자인 찾는 중--->

	
	
	<meta charset="UTF-8">
	<title>join</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet" />

</head>

<body class="is-article-visible">
<div id="wrapper">




<div id="main" style="">

<article id="contact" class="active" style="">

<form action= "${pageContext.request.contextPath}/member/join" method="post">
	<!--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
				<h2 class="major">JOIN</h2>
				<div class="fields">
				<div class="field half">
				<label for="username">ID</label>
				<input type="text" name="username" id="username">
				</div>
				<div class="field half">
				<label for="password">PASSWORD</label>
				<input type="password" name="password" id="password">
				</div>
				<div class="field half">
				<label for="userrname">NAME</label>
				<input type="text" name="userrname" id="userrname">
				</div>
				
	        <!-----라디오버튼으로 바꾸기----->
				
				<div class="field half">
				<label for="usergender">GENDER</label>
				<input type="checkbox" name="usergender" value="male" />MALE
				<input type="checkbox" name="usergender" value="female" />FEMALE
				</div>
				
				
				<div class="field half">
				<label for="userage">AGE</label>
				  <select name= "userage">
				        <option value="">10~19</option>
				        <option value="">20~29</option>
				        <option value="">30~39</option>
				        <option value="">40~49</option>
				        <option value="">50~59</option>
				        <option value="">60~</option>
	      	  	  </select>
				</div>
				<div class="field half">
				<label for="usernick">NICKNAME</label>
				<input type="text" name="usernick" id="usernick">
				</div>
				</div>
				<div class="field half">
				<label for="useremail">E-MAIL</label>
				<input type="text" name="useremail" id="useremail">
				</div>
 
	     
	      <br />
	      <select name= "admin">
	      	<option value="USER" >회원</option>
	      	<option value="MANAGER">매니저</option>
	      	<option value="ADMIN">관리자</option>
			
	      </select>
	      <br />
	      
	      
	      <ul class="actions">
			<li>
			<input type="submit" value="JOIN IN" class="primary">
			</li>
			<li>
			<input type="reset" value="Reset">
			</li>
			</ul>
	      
	</form>


</article>
</div>



</div>
</body>
</html>