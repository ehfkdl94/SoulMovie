<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>	
	
	<meta charset="UTF-8">
	<title>join</title>
	
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet" />
	
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csslogin/main.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csslogin/noscript.css" />
	
</head>

<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">


				<!-- Main -->
					<div id="main">
					
					<article id="elements">
								<h2 class="major">Join</h2>
								
									<h3 class="major">Form</h3>
									<form action= "${pageContext.request.contextPath}/member/join" method="post">
										<!--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
										<div class="fields">
											<div class="field half">
												<label for="username">Name</label>
												<input type="text" name="username" id="username" value="" placeholder="ID" />
											</div>
											<div class="field half">
												<label for="password">PASSWORD</label>
												<input type="password" name="password" id="password" value="" placeholder="password" />
											</div>
											<div class="field half">
												<label for="userrname">PASSWORD</label>
												<input type="text" name="userrname" id="userrname" value="" placeholder="name" />
											</div>

											<div class="field half">
												<label for="usergender">GENDER</label>
												<input type="radio" id="usergender" value="male" checked>
												<label for="demo-priority-low">Male</label>
												<input type="radio" id="usergender" value="female">
												<label for="demo-priority-high">Female</label>
											</div>
											
											<div class="field half">
												<label for="usernick">NICKNAME</label>
												<input type="text" name="usernick" id="usernick" value="" placeholder="nickname">
											</div>


											
											<div class="field half">
												<label for="userage">AGE</label>
												<select name= "userage">
														<option id="userage" value="10대">10-19</option>
														<option id="userage" value="20대">20-29</option>
														<option id="userage" value="30대">30-39</option>
														<option id="userage" value="40대">40-49</option>
														<option id="userage" value="50대">50-59</option>
														<option id="userage" value="60대이상">60 over</option>
												</select>
											</div>
										

												<div class="field">
													<label for="useremail">E-MAIL</label>
													<input type="text" name="useremail" id="useremail" value="" placeholder="e-mail">
												</div>
												
														-->
										</div>
										<ul class="actions">
											<li><input type="submit" value="JOIN IN" class="primary"></li>
											<li><input type="reset" value="RESET"></li>
										</ul>
									</form>
					
								

							</article>

					</div>
					
					<!-- Scripts -->
					
				<script src="resources/js/jsLogin/jquery.min.js"></script>
				<script src="resources/js/jsLogin/browser.min.js"></script>
				<script src="resources/js/jsLogin/breakpoints.min.js"></script>
				<script src="resources/js/jsLogin/util.js"></script>
				<script src="resources/js/jsLogin/main.js"></script>
							
												
				</div>

		
	</body>

</html>