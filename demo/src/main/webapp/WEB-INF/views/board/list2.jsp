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
   <link href="${pageContext.request.contextPath}/resources/img/favicon.ico" rel="shortcut icon"/>

   <!-- Google font -->
   <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i&display=swap" rel="stylesheet">

   <!-- Stylesheets -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"/>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css"/>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css"/>
   <!-- Bootstrap CSS File -->
   <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

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
         <div class="user-panel">
            <a href="${pageContext.request.contextPath}/member/login" class="login">Login</a>
            <a href="" class="register">Create an account</a>
         </div>
      </div>
      <ul class="main-menu">
         <li><a href="/">Home</a></li>
         <li><a href="#">About</a></li>
         <li><a href="#">Movie</a>
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
   
   
   <section class="hero-section clearfix" >
 		<div class="hero-slider owl-carousel">
         <div class="hs-item" style="height:800px">
            <div class="container">
	           	
		         <form action="${pageContext.request.contextPath}/board/list" method="get">
		            <input type="hidden" name="page" value="1" />
		            <input type="text" name="text" class="form-control" placeholder="검색어" />
		            <input type="submit" class="btn btn-success" value="검색" />
		         </form>

   
			      <table class="table table-sm" style="color:white;">
			         <thead>
			            <tr>   
			               <th>번호</th>
			               <th>제목</th>
			               <th>작성자</th>
			               <th>조회수</th>
			               <th>날짜</th>
			            </tr>
			         </thead>
			         
			         <tbody>
			            <c:if test="${empty list}">
			            <tr>
			               <td colspan="5">검색결과가 없습니다.</td>
			            </tr>
			            </c:if>
			            <c:if test="${!empty list}">
			            <c:forEach var="tmp" items="${list}">
			            <tr>
			               <td>${tmp.brdno}</td>
			               <td>
			                 <a href="/board/content?no=${tmp.brdno}">${tmp.brdtitle}</a>
			               </td>
			               <td>${tmp.username}</td>
			               <td><fmt:formatNumber value="${tmp.brdhit}" pattern="#,###" /></td>
			               <td>
			                  <c:set var="dt" value="${fn:split(tmp.brddate, ' ')}" />
						${dt[0]}
			               </td>
			            </tr>
			            </c:forEach>
			            </c:if>
			         </tbody>
			      </table>
			      
		      <div id="pagination-div"></div>
		      <a href="${pageContext.request.contextPath}/board/insert" class="btn btn-success">글쓰기</a>
		      	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>	
				<script>
					$(function(){
						$('#pagination-div').twbsPagination({
					        totalPages: Number('${cnt}'), /* 전체 페이지 수*/
					        visiblePages: 10, /*화면에 표시할 페이지 수 */
					        startPage : Number('${param.page}'), /* 주소창에 ~~/board/list?page=1 */
					        initiateStartPageClick : false,
					        onPageClick: function (event, page) {
					             window.location.href = "/board/list?page=" + page + "&text=${param.text}";
					        }
					    });
					})
				</script>
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