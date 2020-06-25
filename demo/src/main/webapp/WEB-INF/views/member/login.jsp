<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
  <head>
  
    <title>login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta name="description" content="">
    <meta name="keywords" content="html, css, javascript, jquery">
    <meta name="author" content="">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/icomoon/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/jquery.fancybox.min.css">
    

    <!-- Theme Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/style.css">
	  <%@include file="/WEB-INF/views/head.jsp" %>
	  
  </head>
  <body data-spy="scroll" data-target=".site-nav-target" data-offset="200" style="background:rgba(0, 0, 0, 0.9);">
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
          	<li class="active1"><a href="${pageContext.request.contextPath}/member/login">Login</a></li>
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



<!--  
    <div class="unslate_co--site-wrap">

      <div class="unslate_co--site-inner">

        <div class="lines-wrap">
          <div class="lines-inner">
            <div class="lines"></div>
          </div>
        </div>
      


        </div>
      </div>
       -->

      <div class="unslate_co--section" id="services-section">
        <div class="container">



        </div>
      </div>





      <div class="unslate_co--section" id="contact-section">
        <div class="container">
          <div class="section-heading-wrap text-center mb-5">
            <h2 class="heading-h2 text-center divider"><span class="gsap-reveal">LOGIN</span></h2>
            <span class="gsap-reveal"><img src="${pageContext.request.contextPath}/resources/unfold/images/divider.png" alt="divider" width="73"></span>
          </div>


          <div class="row justify-content-between">
            
            <div class="col-md-7" style="margin-left: 33%;">
            
              <form action="${pageContext.request.contextPath}/loginProcess" class="form-outline-style-v1" method="post">
                <div class="form-group row mb-0">

                  <div class="col-md-7 form-group gsap-reveal">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <label for="username">ID</label>
                    <input name="username" type="text" class="form-control" id="username">
                  </div>
                  <br />
                  
                  <div class="col-md-7 form-group gsap-reveal">
                    <label for="password">Password</label>
                    <input name="password" type="password" class="form-control" id="password">
                  </div>
                  
               
               </div>
               
					<section class="cta" style="background-image:none; padding:10px">
						<div class="form-group row gsap-reveal" style="margin-left: 38%;">
                    <div class="col-md-12 d-flex align-items-center">
                   
                       <input type="submit" class="cta-btn" style="font-family:aCinemaL" value="LOGIN" />
                      <span class="submitting"></span>
                    </div>
                  </div>
                  </section>
                  
              </form>
 
 
 
 		

           

            </div>

    

          </div>
        </div>
      </div>
 

    
    <!-- Loader 
    <div id="unslate_co--overlayer"></div>
    <div class="site-loader-wrap">
      <div class="site-loader"></div>
    </div>
    -->

    <script src="${pageContext.request.contextPath}/resources/unfold/js/scripts-dist.js"></script>
    <script src="${pageContext.request.contextPath}/resources/unfold/js/main.js"></script>


	 <%@include file="/WEB-INF/views/footer.jsp" %>
  </body>
</html>