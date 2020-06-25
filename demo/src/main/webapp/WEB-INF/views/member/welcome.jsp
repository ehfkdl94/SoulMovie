<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Welcome</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csslogin/author/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csslogin/author/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csslogin/author/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csslogin/author/magnific-popup.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csslogin/author/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csslogin/author/style.css">
    
    	  <%@include file="/WEB-INF/views/head.jsp" %>
  </head>
  <body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">
     <!-- ======= Header ======= -->
  <header id="header" class="fixed-top" style="background:rgba(0, 0, 0, 0.9);">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/day/assets/img/logo4.png" alt=""></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li><a href="${pageContext.request.contextPath}/">Home</a></li>
          <li><a href="${pageContext.request.contextPath}/movie/movielist">Movie</a></li>
          <li><a href="${pageContext.request.contextPath}/board/list">Board</a></li>
          <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
          <security:authorize access="!isAuthenticated()">
          	<li><a href="${pageContext.request.contextPath}/member/login">Login</a></li>
          	<li><a href="${pageContext.request.contextPath}/member/join" style = "font-weight: bold ;color:#ff0000;">Create an account</a></li>
          </security:authorize>
          <security:authorize access="isAuthenticated()">
          	<li><a href="${pageContext.request.contextPath}/member/mypage?username=<security:authentication property="name"/>">My page</a></li>
          	<li><a href="${pageContext.request.contextPath}/member/logout">Logout</a></li>
          	<li><a href="${pageContext.request.contextPath}/choice/list" style = "font-weight: bold ;color:#ff0000;">+ SoulMovie</a></li>
          </security:authorize>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->
    
    	<section id="cta" class="cta" style="height:400px;">
      <div class="container" data-aos="zoom-in">
        <div class="text-center">
         <br />
        <br />
        <br />
        <h3 style="color:#fff; font-family:'PlayfairB';">Welcome!</h3>

        </div>
      </div>
    </section>

	  
	
<
		<section class="ftco-about img ftco-section ftco-no-pt ftco-no-pb" id="author-section">
    	<div class="container">
    		<div class="row d-flex no-gutters">
    			
    			<div class="col-md-6 col-lg-6 d-flex"  style="margin-left:300px">
    				<div class="py-md-5 w-100 bg-light px-md-5">
    				<form action="${pageContext.request.contextPath}/loginProcess" class="form-outline-style-v1" method="post">
    				<div class="text-center">
    					<div class="py-md-5">
		    				<div class="row justify-content-start pb-3">
				          <div class="col-md-12 heading-section ftco-animate">
				          
							              <h3 style="font-family:'GothicB';"><b>SOUL MOVIE</b></h3><br />
							              <h4>회원가입이 완료되었습니다.</h4><br />  
							             
							              <!--     
				            <ul class="about-info mt-4 px-md-0 px-2">
				            	<li class="flex"><span>님 환영합니다</span></li>
				            </ul>
				             -->   
				            
				            <div class="col-md-12 ">
				            	
				            	<h6>아래의 버튼을 클릭하여 로그인 하세요.</h6><br />
		                      <a class="btn" href="${pageContext.request.contextPath}/member/login" style="background-color:#ff0000; color:white;">LOGIN</a>
		                      <span class="submitting"></span>
		                    
		                    </div>
				          </div>
				        </div>
	
			   
			          </div>
			             </div>
			      </form>
		        </div>
	        </div>
        </div>
    </div>
    </section>
     
     
     <br />


    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="${pageContext.request.contextPath}/resources/js/jsLogin/author/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jsLogin/author/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jsLogin/author/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jsLogin/author/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jsLogin/author/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jsLogin/author/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jsLogin/author/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jsLogin/author/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jsLogin/author/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jsLogin/author/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jsLogin/author/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jsLogin/author/google-map.js"></script>
  
  <script src="${pageContext.request.contextPath}/resources/js/jsLogin/author/main.js"></script>
  
  
    <!-- footer -->
    <br />
	 <%@include file="/WEB-INF/views/footer.jsp" %>
	 
  </body>
</html>