<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
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


   <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
   <![endif]-->

</head>
<body>
   <!-- Page Preloder -->
   <div id="preloder">
      <div class="loader"></div>
   </div>

   <!-- Header section -->
   <header class="header-section clearfix">
      <a href="index.html" class="site-logo">
         <img src="img/logo.png" alt="">
      </a>
      <div class="header-right">
         <a href="#" class="hr-btn">Help</a>
         <span>|</span>
         <div class="user-panel">
            <a href="" class="login">Login</a>
            <a href="" class="register">Create an account</a>
         </div> 
      </div>
      <ul class="main-menu">
         <li><a href="${pageContext.request.contextPath}/">Home</a></li>
         <li><a href="#">About</a></li>
         <li><a href="#">Pages</a>
            <ul class="sub-menu">
               <li><a href="category.html">Category</a></li>
               <li><a href="playlist.html">Playlist</a></li>
               <li><a href="artist.html">Artist</a></li>
               <li><a href="blog.html">Blog</a></li>
               <li><a href="contact.html">Contact</a></li>
            </ul>
         </li>
         <li><a href="blog.html">News</a></li>
         <li><a href="contact.html">Contact</a></li>
      </ul>
   </header>
   <!-- Header section end -->

   <!-- Hero section -->
   <section class="hero-section" >
      <div class="hero-slider owl-carousel" >
         <div class="hs-item" style="height:1000px;">
            <div class="container">
               <div class="row align-items-stretch" style="margin-top:100px;">
                  <div class="col-md-8" data-aos="fade-up">
                    <img src="${pageContext.request.contextPath}/resources/img/img_1_big.jpg" alt="Image" class="img-fluid">
                  </div>
                  <div class="col-md-3 ml-auto" data-aos="fade-up" data-aos-delay="100">
                    <div class="sticky-content">
					 <h3 class="h3" style="color:white;">영화이름</h3>

					 <p class="mb-4"><span class="text-muted">영화개봉년도 </span></p> 
					 
					 <div class="mb-5">
						<p>감독이름</p>
		  
					  </div>
					  <div class="mb-5">
						<p>출연진</p>
		  
					  </div>
					  <div class="mb-5">
						<p>장르</p>
		  
					  </div>
					  <div class="mb-5">
						<p>순위</p>
		  
					  </div>
					  <div class="mb-5">
						<p>이용객 총 누적 관람횟수</p>
		  
					  </div>
					  <div class="mb-4">
						<p>이용객 인생영화 선정수</p>
		  
					  </div>
                    
                
                     <h4 class="h4 mb-3" style="color:white;">인생영화리뷰</h4>
                     <ul class="list-unstyled list-line mb-5">
						<h3 class="h5" style="color:white;">리뷰1</h3>
						<h3 class="h5" style="color:white;">리뷰1</h3>
						<h3 class="h5" style="color:white;">리뷰1</h3>
						<h3 class="h5" style="color:white;">리뷰1</h3>
						<h3 class="h5" style="color:white;">리뷰1</h3>
                     </ul>
         
                 
                    </div>
                  </div>
                 </div>
            </div>
         </div>
         
      </div>
   </section>
   <!-- Hero section end -->

   <section class="hero-section">
      <div class="hero-slider owl-carousel">
         <div class="hs-item" style="height:1000px;">
            <div class="container">
             
         
                 <div class="row" data-aos="fade-up" data-aos-delay="200">
                  <div class="item web col-sm-6 col-md-4 col-lg-4 mb-4">
                    <a href="work-single.html" class="item-wrap fancybox">
                     <div class="work-info">
                       <h3>Boxed Water</h3>
                       <span>Web</span>
                     </div>
                     <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/img_1.jpg">
                    </a>
                  </div>
                  <div class="item photography col-sm-6 col-md-4 col-lg-4 mb-4">
                    <a href="work-single.html" class="item-wrap fancybox">
                     <div class="work-info">
                       <h3>Build Indoo</h3>
                       <span>Photography</span>
                     </div>
                     <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/img_2.jpg">
                    </a>
                  </div>
                  <div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4">
                    <a href="work-single.html" class="item-wrap fancybox">
                     <div class="work-info">
                       <h3>Cocooil</h3>
                       <span>Branding</span>
                     </div>
                     <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/img_3.jpg">
                    </a>
                  </div>
                  <div class="item design col-sm-6 col-md-4 col-lg-4 mb-4">
                    <a href="work-single.html" class="item-wrap fancybox">
                     <div class="work-info">
                       <h3>Nike Shoe</h3>
                       <span>Design</span>
                     </div>
                     <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/img_4.jpg">
                    </a>
                  </div>
                  <div class="item photography col-sm-6 col-md-4 col-lg-4 mb-4">
                    <a href="work-single.html" class="item-wrap fancybox">
                     <div class="work-info">
                       <h3>Kitchen Sink</h3>
                       <span>Photography</span>
                     </div>
                     <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/img_5.jpg">
                    </a>
                  </div>
                  <div class="item branding col-sm-6 col-md-4 col-lg-4 mb-4">
                    <a href="work-single.html" class="item-wrap fancybox">
                     <div class="work-info">
                       <h3>Amazon</h3>
                       <span>brandingn</span>
                     </div>
                     <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/img_6.jpg">
                    </a>
                  </div>
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

   </body>
</html>