<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html lang="zxx">
<head>
<title>SolMusic | HTML Template</title>
<meta charset="UTF-8">
<meta name="description" content="SolMusic HTML Template">
<meta name="keywords" content="music, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Favicon -->
<link
	href="${pageContext.request.contextPath}/resources/img/favicon.ico"
	rel="shortcut icon" />

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
<!-- Bootstrap CSS File -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/icofont/icofont.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendor/line-awesome/css/line-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendor/aos/aos.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/vendor/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Main Stylesheets -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />
<link href="${pageContext.request.contextPath}/resources/css/style1.css"
	rel="stylesheet">


<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
<!-- 카테고리 jsp -->

<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=PT+Sans:400,700&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cssContent/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cssContent/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cssContent/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cssContent/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/cssContent/style.css"
	type="text/css">

</head>
<body>

	<!-- Header section -->
	<header class="header-section clearfix">
		<a href="${pageContext.request.contextPath}/" class="site-logo"> <img
			src="${pageContext.request.contextPath}/resources/img/logo4.png"
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
			<li><a href="${pageContext.request.contextPath}/">Home</a></li>
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
	<!-- search  start-->
	<div class="hero-search set-bg"
		style="background: #0a183d;">
		<div class="container">
			<div class="filter-table">
				<form action="#" class="filter-search">
					<input type= "hidden" name="page" value="1" />
					<input type="text"  name ="text" placeholder="검색어"> 
					<select id="category">
						<option value="">분류</option>
					</select> <select id="tag">
						<option value="">영화제목</option>
						<option value="">게시글번호</option>
					</select>
					<button type="submit">Search</button>
				</form>
			</div>
		</div>
	</div>
	<!-- search end -->
	<!-- Hero section -->
	<section class="hero-section">
	
		<div class="hero-slider owl-carousel">
			<div class="hs-item" style="height: 1500px;">
			
			<c:if test="${size <4}">
				<div class="container" style= "margin-bottom:500px;">
				</c:if>
 			<c:if test="${size >3}">  
				<div class="container" >
	  			</c:if>	
					<div class="row">
					<c:forEach var="tmp" items="${list2}">
						<div class="col-lg-4 col-sm-6">
							<div class="recipe-item">
								<a href="${pageContext.request.contextPath}/movie/moviedetail?movie_code=${tmp.movie_code}"><img
									src="${pageContext.request.contextPath}/getimg?no=${tmp.movie_code}" 
									style ="height:400px;"
									alt=""></a>
								<div class="ri-text">
									<div class="cat-name">${tmp.rank}등</div>
									<a >
										<h4>${tmp.movie_title}</h4>
									</a>
									<p>${tmp.movie_actor}</p>
								</div>
							</div>
						</div>
	
						
					</c:forEach>




					</div>
					<div class="row">
						<div class="col-lg-12">
							<div class="recipe-pagination">
							
											</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</section>
	<!-- Hero section end -->

	<!-- page start -->




	<!-- page end -->


	<script>
		$(function(){
			$('#recipe-pagination').twbsPagination({
		        totalPages: Number('${cnt}'), /* 전체 페이지 수*/
		        visiblePages: 6, /*화면에 표시할 페이지 수 */
		        startPage : Number('${param.page}'), /* 주소창에 ~~/board/list?page=1 */
		        initiateStartPageClick : false,
		        onPageClick: function (event, page) {
		             window.location.href = "/movie/movielist?page="+page +"&text=${param.text}";
		        }
		    });
		})
	</script>
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
	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-migrate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/easing/easing.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/php-email-form/validate.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/isotope/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/aos/aos.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>
	<!-- 컨텐츠  -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jsContent/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jsContent/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jsContent/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jsContent/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jsContent/mixitup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jsContent/main.js"></script>
</body>
</html>