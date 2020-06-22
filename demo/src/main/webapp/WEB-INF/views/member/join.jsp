<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>

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
   <!--  -->
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
	<!-- Bootstrap CSS File -->
	<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- Vendor CSS Files -->
	<link href="${pageContext.request.contextPath}/resources/vendor/icofont/icofont.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/vendor/line-awesome/css/line-awesome.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/vendor/aos/aos.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/vendor/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

	<!-- Main Stylesheets -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
	<link href="${pageContext.request.contextPath}/resources/css/style1.css" rel="stylesheet">
</head>

<body class="is-preload">
<!-- Header section -->
	<header class="header-section clearfix">
		<a href="${pageContext.request.contextPath}/" class="site-logo">
			<img src="${pageContext.request.contextPath}/resources/img/logo4.png" alt="">
		</a>
		<div class="header-right">
			<security:authorize access="!isAuthenticated()">
			<a href="#" class="hr-btn">Help</a>
			<span>|</span>
			
			<div class="user-panel">
				<a href="${pageContext.request.contextPath}/member/login" class="login">Login</a>
				<a href="${pageContext.request.contextPath}/member/join" class="register">Create an account</a>
			</div>
			</security:authorize>
			
			<security:authorize access="isAuthenticated()">
				<a href="${pageContext.request.contextPath}/member/mypage?username=<security:authentication property="name"/>" style="color:white;">My page</a>
				<span>|</span>
				<div class="user-panel">
				<a href="${pageContext.request.contextPath}/member/logout" class="logout">Logout</a>
				<a href="${pageContext.request.contextPath}/member/join" class="register">Create an account</a>
			</div>
			</security:authorize>
		</div>
		<ul class="main-menu">
			<li><a href="/">Home</a></li>
			<li><a href="${pageContext.request.contextPath}/movie/movielist">Movie</a>
				<!--  
				<ul class="sub-menu">
					<li><a href="category.html">Category</a></li>
					<li><a href="playlist.html">Playlist</a></li>
					<li><a href="artist.html">Artist</a></li>
					<li><a href="blog.html">Blog</a></li>
					<li><a href="contact.html">Contact</a></li>
				</ul>
				-->
			</li>
			<li><a href="${pageContext.request.contextPath}/board/list">Board</a></li>
			<li><a href="contact.html">Contact</a></li>
		</ul>
	</header>
	<!-- Header section end -->
	<section class="hero-section">

        <div class="hero-slider owl-carousel">
            <div class="hs-item" style="height: 800px;">
      <!-- Wrapper -->
         <div id="wrapper">


            <!-- Main -->
               <div id="main">
               
               <article id="contact" class="active" style="">
         
                        <h2 class="major">Join</h2>
                        
                        
                           <h3 class="major">Form</h3>
                           <form action= "${pageContext.request.contextPath}/member/join" method="post">
                              <!--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
                              <div class="fields">
                                 <div class="field half">
                                    <label for="username">ID</label>
                                    <input type="text" name="username" id="username" value="" placeholder="ID" />
                                 </div>
                                 <div class="field half">
                                    <label for="password">PASSWORD</label>
                                    <input type="password" name="password" id="password" value="" placeholder="password" />
                                 </div>
                                 <div class="field half">
                                    <label for="userrname">NAME</label>
                                    <input type="text" name="userrname" id="userrname" value="" placeholder="name" />
                                 </div>
                                 
                                 

                                 
                              
                                 
                                 <div class="field half">
                                    <label for="usergender">GENDER</label>
                                        <select name= "usergender">
                                          <option id="demo-priority-male" value="male">MALE</option>
                                          <option id="demo-priority-female" value="female">FEMALE</option>
                                  
                                    </select>
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
                                    
                                          
                              </div>
                              <ul class="actions">
                                 <li><input type="submit" value="JOIN IN" class="primary"></li>
                                 <li><input type="reset" value="RESET"></li>
                              </ul>
                           </form>
               
                   

                     </article>
				</div>
               </div>
               </div>
               </div>
               </section>
               
	<!--====== Javascripts & Jquery ======-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<!-- Vendor JS Files -->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-migrate.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/php-email-form/validate.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/isotope/isotope.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/aos/aos.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>
               <!-- Scripts -->
               
            <script src="resources/js/jsLogin/jquery.min.js"></script>
            <script src="resources/js/jsLogin/browser.min.js"></script>
            <script src="resources/js/jsLogin/breakpoints.min.js"></script>
            <script src="resources/js/jsLogin/util.js"></script>
            <script src="resources/js/jsLogin/main.js"></script>
                     
                                    
         

      
   </body>

</html>