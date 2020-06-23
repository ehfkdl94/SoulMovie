<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
		<title>login</title>
	<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Soul Movie</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/day/assets/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/day/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/day/assets/css/style.css" rel="stylesheet">

  <link href="${pageContext.request.contextPath}/resources/css/style1.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Day - v2.1.0
  * Template URL: https://bootstrapmade.com/day-multipurpose-html-template-for-free/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<body>


	
	
 <!-- ======= Header ======= -->
  <header id="header" class="fixed-top" style="background:rgba(0, 0, 0, 0.9);">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="index.html"><img src="${pageContext.request.contextPath}/resources/day/assets/img/logo4.png" alt=""></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li><a href="${pageContext.request.contextPath}/">Home</a></li>
          <li><a href="${pageContext.request.contextPath}/movie/movielist">Movie</a></li>
          <li><a href="${pageContext.request.contextPath}/board/list">board</a></li>
          <li><a href="${pageContext.request.contextPath}/">Contact</a></li>
          <security:authorize access="!isAuthenticated()">
          	<li><a href="${pageContext.request.contextPath}/">help</a></li>
          	<li><a href="${pageContext.request.contextPath}/member/login">login</a></li>
          	<li><a href="${pageContext.request.contextPath}/member/join" style = "font-weight: bold ;color:#ff0000;">Create an account</a></li>
          </security:authorize>
          <security:authorize access="isAuthenticated()">
          	<li><a href="${pageContext.request.contextPath}/member/mypage?username=<security:authentication property="name"/>">My page</a></li>
          	<li><a href="${pageContext.request.contextPath}/member/logout">logout</a></li>
          </security:authorize>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->
  
  
   <!-- Page Preloder -->
   <div id="preloder">
      <div class="loader"></div>
   </div>



	<!-- Hero section -->
	<section class="hero-section">
	
			<div class="hs-item" style="height:900px;">
				<div class="container">
				   <div style="margin-bottom: 250px;">
							<div class="row mb-5 align-items-center">
							
							<!-- <div class="col-md-12 col-lg-6 text-left text-lg-right" data-aos="fade-up" data-aos-delay="100">
								<div id="filters" class="filters">
								<a href="#" data-filter="*" class="active" style="color:white;">All</a>
								<a href="#" data-filter=".web" style="color:white;">Web</a>
								<a href="#" data-filter=".design" style="color:white;">Design</a>
								<a href="#" data-filter=".branding" style="color:white;">Branding</a>
								<a href="#" data-filter=".photography" style="color:white;">Photography</a>
								</div>
							</div> -->
							</div>
					
                            <div class="hero-slider owl-carousel">
                                <div class="hs-item" style="height: 600px;">
                                
                                <div id="wrapper" style="margin-top:200px;">
                                
                                    <!-- Main -->
                                    
                                        <div id="main">
                    
                                    <!-- Contact -->
                                        <article id="contact" class="active" style="">
                    
                                                
                                            <h2 class="major">LOGIN</h2>
                                            <form action='${pageContext.request.contextPath}/loginProcess' method='POST' >
                                            
                                              <div class="fields">
                                             
                                                <div class="field" style="width:calc(70% - 0.75rem)" >	
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                <label for="username">ID</label>
                                                <input type="text"  class="form-control" id="username" name="username" placeholder="ID" >
                                                </div><br />
                                                <div class="field" style="width:calc(70% - 0.75rem)">
                                                <label for="password">PASSWORD</label>
                                                <input type="password"  class="form-control" id="password" name="password" placeholder="Password" >
                                                </div>			
                                                 
                                                 
                                              </div>
                                              <br />
                                            
                                          
                                             <ul class="actions">
                                                <li>
                                                <input type="submit" value="LOGIN" class="primary">
                                                </li>	
                                             </ul>	
                                             
                                        </form>
                                     
                    
                                          </article>
                    
                                 
                                                
                                            
                                          </div>
                       
                          </div>
                          
                    
                                    
                    
                    
                                    
                                   
                                </div>
                            </div>
                            </div>
                    
				  
				  </div>
				  </div>
			
		</div>

	</section>
	<!-- Hero section end -->




	<!--====== Javascripts & Jquery ======-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script src="${pageContext.request.contextPath}resources/js/jsLogin/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}resources/js/jsLogin/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}resources/js/jsLogin/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}resources/js/jsLogin/util.js"></script>
	<script src="${pageContext.request.contextPath}resources/js/jsLogin/main.js"></script>
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


	</body>
</html>
