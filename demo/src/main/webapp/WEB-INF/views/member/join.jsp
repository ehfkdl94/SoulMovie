<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
	<title>SolMusic | HTML Template</title>
	<meta charset="UTF-8">
	<meta name="description" content="SolMusic HTML Template">
	<meta name="keywords" content="music, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!-- Favicon -->
	<link href="${pageContext.request.contextPath}/resources/img/favicon.ico" rel="shortcut icon"/>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i&display=swap" rel="stylesheet">
 
	<!-- Stylesheets -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css"/>

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>


	<%@include file="/WEB-INF/views/head.jsp" %>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp" %>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	

	<!-- Contact section -->
	<section class="contact-section">
		<div class="container-fluid">
			<div class="row">

				<div class="col-lg-6 p-0">
					<div class="contact-warp">
						<div class="section-title mb-0">
							<h2>Join</h2>
						</div>
						<p>디자인 수정 중...</p>
				
						<form class="contact-from" action="${pageContext.request.contextPath}/member/join" method="post">
							<div class="row">
								<div class="col-md-6">
									<input type="text" name="username" id="username" value="" placeholder="ID"><p id="chk"></p>
								</div>
								
								<div class="col-md-6">
									<input type="password" name="password" id="password" value="" placeholder="Password" />
								</div>
								
							
								<div class="col-md-6">
									<input type="text" name="userrname" id="userrname" value="" placeholder="Name" />
								</div>
								
								<div class="col-md-6">
									<label for="usergender">Gender</label>
									<select name= "usergender" >
                                          <option id="usergender" value="male">MALE</option>
                                          <option id="usergender" value="female">FEMALE</option>
                                  
                                    </select>
								</div>
								
								
								<div class="col-md-6">
									<input type="text" name="usernick" id="usernick" value="" placeholder="Nickname" /><p id="chk2"></p>
								</div>
								
								
								<div class="col-md-6">
								 <label for="userage">Age</label>
                                    <select name= "userage">
                                          <option id="userage" value="10대">10-19</option>
                                          <option id="userage" value="20대">20-29</option>
                                          <option id="userage" value="30대">30-39</option>
                                          <option id="userage" value="40대">40-49</option>
                                          <option id="userage" value="50대">50-59</option>
                                          <option id="userage" value="60대이상">60 over</option>
                                    </select>
                                </div>
							
								
								
								<div class="col-md-12">
									<input type="email"  name="useremail" id="useremail" value="" placeholder="E-mail" />
									<button class="site-btn" style="background-color:#ff0000">Join In</button>
								</div>
							</div>
						</form>
						
						
		<script type="text/javascript" 
		src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
		
	 <script>


	

				$(function(){
					//nickname이 usernick인 tag의 키보드가 up되면
					$('#usernick').bind('keyup',function(){
						var unick = $('#usernick').val(); //입력했던 값을 받아와서 unick변수에 보관
			
						//restcontroller를 호출해서 값을 받아옴
						$.get('/member/rest/membernickcheck.json?usernick=' + unick,function(data){
							console.log("GET", data);
							//console.log("GET", data);  {"ret":1}  or {"ret":0}
							if(data.ret == 1){
								$('#chk2').text('이미 사용 중인 닉네임입니다.');
							}
							else if(data.ret == 0){
								$('#chk2').text('사용가능');
							}
						}, 'json');
						
						/*
						$.post('/rest/memberidcheck.json', {id:'a'}, function(data){
							console.log("POST", data);
						}, 'json');
						*/
					});
				});
			



			
		
		$(function(){
			//id가 userid인 tag의 키보드가 up되면
			$('#username').bind('keyup',function(){
				var uid = $('#username').val(); //입력했던 값을 받아와서 uid변수에 보관

				if (uid.length >= 2){
				//restcontroller를 호출해서 값을 받아옴
				$.get('/member/rest/memberidcheck.json?username=' + uid,function(data){
					console.log("GET", data);
					//console.log("GET", data);  {"ret":1}  or {"ret":0}
					if(data.ret == 1){
						$('#chk').text('이미 사용중인 아이디입니다.');
					}
					else if(data.ret == 0){
						$('#chk').text('사용가능');
					}
				}, 'json');
				}
			
				
				/*
				$.post('/rest/memberidcheck.json', {id:'a'}, function(data){
					console.log("POST", data);
				}, 'json');
				*/
			});
		});
		</script>
						
						
						
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog section end -->

	
	<!--====== Javascripts & Jquery ======-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	
	<%@include file="/WEB-INF/views/footer.jsp" %>
	</body>
</html>
