<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
  <%@include file="/WEB-INF/views/head.jsp" %>
<title>MovieList</title>
<meta charset="UTF-8">
<meta name="description" content="SolMusic HTML Template">
<meta name="keywords" content="music, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicon -->
<link href="img/favicon.ico" rel="shortcut icon" />

<!-- Google font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i&display=swap"
	rel="stylesheet">

 <!-- Stylesheets -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" />

<!-- Main Stylesheets -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
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

<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	
</head>

<body>


 <!-- ======= Header ======= -->
  <header id="header" class="fixed-top" style="background:rgba(0, 0, 0, 0.9);">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/day/assets/img/logo4.png" alt=""></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li><a href="${pageContext.request.contextPath}/">Home</a></li>
          <li class="active1"><a href="${pageContext.request.contextPath}/movie/movielist">Movie</a></li>
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
 <section id="cta100" class="cta100" style="height:400px;" >
      <div class="container" data-aos="zoom-in">
        <div class="text-center">
        <br />
        <br />
        <br />
          <h3 style="font-family:'PlayfairB';">MOVIE LIST</h3>          
          
         
        </div>
      </div>
      
    </section>
	<!-- Header section end -->
<!-- Help section end -->
	<section class="help-section spad pt-0" style= "margin-top:60px; height:10px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
				

				</div>
				<div class="col-lg-6">
					<div class="d-flex h-100 align-items-end">
						<form class="search-form">
						<input type="hidden" name="page" value="1" /> 
							<input type="text" name="text" placeholder="MovieTitle">
						
							<button style="font-family:aCinemaL;background:#cc1616; " >Search</button>
							
                 		
						</form>
					</div>
				</div>
				
			</div>
		</div>
	</section>
		
	<!-- Help section end -->
	<!-- Playlist section -->
	<section class="playlist-section spad" style="background:white;" >
		<div class="container-fluid">
		
			<!-- <div class="container">
				<ul class="playlist-filter controls">
					<li class="control" data-filter=".genres">Genres</li>
					<li class="control" data-filter=".artists">Artists</li>
					<li class="control" data-filter=".movies">Movies Soundtracks</li>
					<li class="control" data-filter=".labels">Labels</li>
					<li class="control" data-filter="all">All Movie</li>
				</ul>
			</div> -->
			<div class="clearfix"></div>
			<div class="row playlist-area" >

				<c:forEach var="tmp" items="${list2}" varStatus="i">
					<div class="mix col-lg-3 col-md-4 col-sm-6 genres">
						<div class="playlist-item">
							<security:authorize access="!isAuthenticated()">
                       	   		<c:if test="${i.index==0}">
                       	   			<a href="${pageContext.request.contextPath}/member/login" class="item-wrap fancybox"></a>
		                              
		                              <img class="img-fluid" src="${pageContext.request.contextPath}/resources/img/qm3.jpg" style="border: solid 1px red; height:450px;">
		                              <h5 style = "color:black; font-family:aCinemaL;">회원가입 후 확인 할 수 있습니다.</h5>
									  <h4 class="blog-date" style="color: red; font-weight:bold;">?</h4>
		                           
                       	   		</c:if>
                       	   		<c:if test="${i.index!=0}">
                       	   			<a href="${pageContext.request.contextPath}/movie/moviedetail?movie_code=${tmp.movie_code}">
									<img  style="border: solid 1px red; height:450px;" 
										src="${tmp.movie_img}"
										alt=""></a>
									<h5 style ="color:black;font-family:aCinemaL;">${tmp.movie_title}</h5>
									<h4 class="blog-date" style="color: red; font-weight:bold;">${tmp.rank }위</h4>
                       	   		</c:if>
                       	   	</security:authorize>
                       	   	<security:authorize access="isAuthenticated()">
								<a href="${pageContext.request.contextPath}/movie/moviedetail?movie_code=${tmp.movie_code}">
								<img  style="border: solid 1px red; height:450px;" 
									src="${tmp.movie_img}"
									alt=""></a>
								<h5 style = "color:black; font-family:aCinemaL;">${tmp.movie_title}</h5>
								<h4 class="blog-date" style="color: red; font-weight:bold;">${tmp.rank }위</h4>
							</security:authorize>
						</div>
					</div>
				</c:forEach>
			</div>
			
		<div class="site-pagination" style="margin:0 auto; margin-top:20px; ">
				
			
				<c:if test="${param.page != 1}">


					<a style="font-size:20px; color:red;"
						href="${pageContext.request.contextPath}/movie/movielist?page=1&text=${param.text}"><<</a>
				</c:if>
				<c:if test="${param.page != 1}">

					<a style="font-size:20px;color:red;"
						href="${pageContext.request.contextPath}/movie/movielist?page=${param.page-1}&text=${param.text}"><</a>

				</c:if>

				<c:forEach var="i" begin="${start}" end="${end}" step="1">
					<c:if test="${param.page == i}">
							<a class="active" style="font-size:20px;font-weight:bold; color:red;"
							href="${pageContext.request.contextPath}/movie/movielist?page=${i}&text=${param.text}">${i}</a>
						
					</c:if>

					<c:if test="${param.page != i}">
						<a style="font-size:20px; color:red;"
							href="${pageContext.request.contextPath}/movie/movielist?page=${i}&text=${param.text}">${i}</a>

					</c:if>
				</c:forEach>


				<c:if test="${allpage != param.page}">
					<a style="font-size:20px;color:red;"
						href="${pageContext.request.contextPath}/movie/movielist?page=${param.page+1}&text=${param.text}">></a>
				</c:if>
				<c:if test="${allpage != param.page}">
					<a style="font-size:20px; color:red;"
						href="${pageContext.request.contextPath}/movie/movielist?page=${allpage}&text=${param.text}">>></a>
				</c:if>
			</div>
		</div>
	</section>
	<!-- Playlist section end -->

	
	<!-- <section class="help-section spad pt-0">
		<div class="container">
	<div class="row">
		<div class="col-lg-12">
			
		</div>
	</div>
	</div>
	</section> -->
	<!-- Footer section -->
	 <%@include file="/WEB-INF/views/footer.jsp" %>
	<!-- Footer section end -->

 <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/resources/day/assets/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/day/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/day/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/day/assets/vendor/php-email-form/validate.js"></script>
  <script src="${pageContext.request.contextPath}/resources/day/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/day/assets/vendor/venobox/venobox.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/day/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/day/assets/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath}/resources/day/assets/js/main.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>
    
</body>

</html>