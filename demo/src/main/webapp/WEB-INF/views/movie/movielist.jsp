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
<title>SolMusic | HTML Template</title>
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
		<a href="index.html" class="site-logo"> <img src="img/logo.png"
			alt="">
		</a>
		<div class="header-right">
			<a href="#" class="hr-btn">Help</a> <span>|</span>
			<div class="user-panel">
				<a href="" class="login">Login</a> <a href="" class="register">Create
					an account</a>
			</div>
		</div>
		<ul class="main-menu">
			<li><a href="index.html">Home</a></li>
			<li><a href="#">About</a></li>
			<li><a href="#">Pages</a>
				<ul class="sub-menu">
					<li><a href="category.html">Category</a></li>
					<li><a href="playlist.html">Playlist</a></li>
					<li><a href="artist.html">Artist</a></li>
					<li><a href="blog.html">Blog</a></li>
					<li><a href="contact.html">Contact</a></li>
				</ul></li>
			<li><a href="blog.html">News</a></li>
			<li><a href="contact.html">Contact</a></li>
		</ul>
	</header>
	<!-- Header section end -->

	<!-- Playlist section -->
	<section class="playlist-section spad">
		<div class="container-fluid">
			<div class="section-title">
				<h2>Movielist</h2>
			</div>
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
			<div class="row playlist-area">

				<c:forEach var="tmp" items="${list2}">
					<div class="mix col-lg-3 col-md-4 col-sm-6 genres">
						<div class="playlist-item">
							<a href="${pageContext.request.contextPath}/movie/moviedetail?movie_code=${tmp.movie_code}">
							<img 
								src="http://file.koreafilm.or.kr/thm/02/00/05/21/TN_DPK014660.jpg"
								alt=""></a>
							<h5>${tmp.movie_title}( ${tmp.movie_actor } )</h5>
							<h4 class="blog-date" style="color: red;">${tmp.rank }위</h4>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- Playlist section end -->

	<!-- Help section end -->
	<section class="help-section spad pt-0">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="section-title mb-0 pb-4">
						<h2>Search for?</h2>
					</div>

				</div>
				<div class="col-lg-6">
					<div class="d-flex h-100 align-items-end">
						<form class="search-form">
						<input type="hidden" name="page" value="1" /> 
							<input type="text" name="text" placeholder="MovieTitle">
							<button>Search</button>
						</form>
					</div>
				</div>
				<div class="site-pagination" style="margin:0 auto; margin-top:20px;">

				<c:if test="${param.page != 1}">

					<a style="font-size:20px;"
						href="${pageContext.request.contextPath}/movie/movielist?page=${param.page-1}&text=${param.text}">이전</a>
				</c:if>

				<c:forEach var="i" begin="1" end="${cnt}" step="1">
					<c:if test="${param.page == i}">
						<a class="active" style="font-size:20px;"
							href="${pageContext.request.contextPath}/movie/movielist?page=${i}&text=${param.text}">${i}</a>
					</c:if>
					<c:if test="${param.page != i}">
						<a style="font-size:20px;"
							href="${pageContext.request.contextPath}/movie/movielist?page=${i}&text=${param.text}">${i}</a>
					</c:if>
				</c:forEach>


				<c:if test="${cnt != param.page}">
					<a style="font-size:20px;"
						href="${pageContext.request.contextPath}/movie/movielist?page=${param.page+1}&text=${param.text}">다음</a>
				</c:if>

			</div>
			</div>
		</div>
	</section>
	<!-- Help section end -->
	<!-- <section class="help-section spad pt-0">
		<div class="container">
	<div class="row">
		<div class="col-lg-12">
			
		</div>
	</div>
	</div>
	</section> -->
	<!-- Footer section -->
	<footer class="footer-section">
		<div class="container">
			<div class="row">
				<div class="col-xl-6 col-lg-7 order-lg-2">
					<div class="row">
						<div class="col-sm-4">
							<div class="footer-widget">
								<h2>About us</h2>
								<ul>
									<li><a href="">Our Story</a></li>
									<li><a href="">Sol Music Blog</a></li>
									<li><a href="">History</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="footer-widget">
								<h2>Products</h2>
								<ul>
									<li><a href="">Music</a></li>
									<li><a href="">Subscription</a></li>
									<li><a href="">Custom Music</a></li>
									<li><a href="">Footage</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="footer-widget">
								<h2>Playlists</h2>
								<ul>
									<li><a href="">Newsletter</a></li>
									<li><a href="">Careers</a></li>
									<li><a href="">Press</a></li>
									<li><a href="">Contact</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-6 col-lg-5 order-lg-1">
					<img
						src="${pageContext.request.contextPath}/resources/img/logo.png"
						alt="">
					<div class="copyright">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</div>
					<div class="social-links">
						<a href=""><i class="fa fa-instagram"></i></a> <a href=""><i
							class="fa fa-pinterest"></i></a> <a href=""><i
							class="fa fa-facebook"></i></a> <a href=""><i
							class="fa fa-twitter"></i></a> <a href=""><i
							class="fa fa-youtube"></i></a>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer section end -->

	<!--====== Javascripts & Jquery ======-->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>

</html>