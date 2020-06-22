<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<img src="${pageContext.request.contextPath}/resources/img/logo4.png" alt="">
		</a>
		<div class="header-right">
			<a href="#" class="hr-btn">Help</a>
			<span>|</span>
			<security:authorize access="!isAuthenticated()">
			<div class="user-panel">
				<a href="${pageContext.request.contextPath}/member/login" class="login">Login</a>
				<a href="${pageContext.request.contextPath}/member/join" class="register">Create an account</a>
			</div>
			</security:authorize>
			
			<security:authorize access="isAuthenticated()">
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

   <!-- Hero section -->
   <section class="hero-section" >
      <div class="hero-slider owl-carousel" >
         <div class="hs-item" style="height:1000px;">
            <div class="container">
               <div class="row align-items-stretch" style="margin-top:100px;">
                  <div class="col-md-8" data-aos="fade-up">
                    <img src="${pageContext.request.contextPath}/getimg?no=${list.movie_code}" alt="Image" class="img-fluid"
                    style= "width:800px;height:800px;"
                    >
                  </div>
                  <div class="col-md-3 ml-auto" data-aos="fade-up" data-aos-delay="100">
                    <div class="sticky-content">
					 <h3 class="h3" style="color:white;">${list.movie_title}</h3>
					<c:set var="dt" value= "${fn:split(list.movie_date,' ')}"/>
					 <p class="mb-4"><span class="text-muted">${dt[0]}</span></p> 
					 
					 <div class="mb-5">
						<p>감독 (사라질예정) ${list.movie_director}</p>
		  
					  </div>
					  <div class="mb-5">
						<p>출연진 ${list.movie_actor}</p>
		  
					  </div>
					  <div class="mb-5">
						<p>장르 ${list.movie_genre}</p>
		  
					  </div>
					  <div class="mb-5">
						<p>순위 ${list.rank}</p>
		  
					  </div>
					  <div class="mb-5">
						<p>총 누적 관람 횟수 ${list.movie_freq}</p>
		  
					  </div>
					  <div class="mb-4">
						<p>인생 영화 선정수 ${list.movie_cnt}</p>
		  
					  </div>
                    
                
                     <h4 class="h4 mb-3" style="color:white;">인생영화리뷰</h4>
                     <ul class="list-unstyled list-line mb-5">
                    	<c:if test="${!empty review}">
						 <c:forEach var="tmp" items="${review}">
						 <h3 class="h5" style="color:white;"> ${tmp.choice_id} : ${tmp.choice_reason}</h3>
                  
						</c:forEach>
						</c:if>
						<c:if test="${empty review}">
						<h3 class="h5" style="color:white;">영화의 리뷰를 남겨보세요!</h3>
						</c:if>
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
	
			<div class="hs-item">
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
					
					<div id="portfolio-grid" class="row no-gutter" data-aos="fade-up" data-aos-delay="200">
								<c:forEach var="tmp" items="${list2}">
								<div class="item web col-sm-6 col-md-4 col-lg-4 mb-4">
									<a href="${pageContext.request.contextPath}/movie/moviedetail?movie_code=${tmp.movie_code}" class="item-wrap fancybox">
									<div class="work-info">
										<h3>${tmp.movie_title}</h3>
										<span>${tmp.rank} 등</span>
									</div>
									<img class="img-fluid" src="${pageContext.request.contextPath}/getimg?no=${tmp.movie_code}">
									</a>
								</div>
								</c:forEach>
								
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


   </body>
</html>