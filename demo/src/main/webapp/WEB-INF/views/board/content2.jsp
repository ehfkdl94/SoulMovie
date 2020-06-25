<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <%@include file="/WEB-INF/views/head.jsp" %>
 
</head>
<style>
.like-content {
    display: inline-block;
    width: 100%;

    font-size: 18px;

    text-align: center;
}
.like-content span {
	color: #9d9da4;
	font-family: monospace;
}
.like-content .btn-secondary {
	  display: block;
	  margin: 0px auto 0px;
    text-align: center;
    background: #ed2553;
    border-radius: 3px;
    box-shadow: 0 10px 20px -8px rgb(240, 75, 113);
    padding: 10px 17px;
    font-size: 18px;
    cursor: pointer;
    border: none;
    outline: none;
    color: #ffffff;
    text-decoration: none;
    -webkit-transition: 0.3s ease;
    transition: 0.3s ease;
}
.like-content .btn-secondary:hover {
	  transform: translateY(-3px);
}
.like-content .btn-secondary .fa {
	  margin-right: 5px;
}
.animate-like {
	animation-name: likeAnimation;
	animation-iteration-count: 1;
	animation-fill-mode: forwards;
	animation-duration: 0.65s;
}
@keyframes likeAnimation {
  0%   { transform: scale(30); }
  100% { transform: scale(1); }
}


</style>
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
          <li><a href="${pageContext.request.contextPath}/movie/movielist">Movie</a></li>
          <li class="active1"><a href="${pageContext.request.contextPath}/board/list">board</a></li>
          <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
          <security:authorize access="!isAuthenticated()">
          	<li><a href="${pageContext.request.contextPath}/member/login">login</a></li>
          	<li><a href="${pageContext.request.contextPath}/member/join" style = "font-weight: bold ;color:#ff0000;">Create an account</a></li>
          </security:authorize>
          <security:authorize access="isAuthenticated()">
          	<li><a href="${pageContext.request.contextPath}/member/mypage?username=<security:authentication property="name"/>">My page</a></li>
          	<li><a href="${pageContext.request.contextPath}/member/logout">logout</a></li>
          	<li><a href="${pageContext.request.contextPath}/choice/list" style = "font-weight: bold ;color:#ff0000;">+ SoulMovie</a></li>
          </security:authorize>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->
	
	<section id="cta" class="cta2" style="height:400px;" >
      <div class="container" data-aos="zoom-in">
        <div class="text-center">
        <br />
        <br />
        <br />
          <h3>Board</h3>          
          
         
       </div>
      </div>
      
    </section>
	<main id="main">
    <section id="contact" class="contact">
    	<div class="section-title" >
          <span>Content</span>
          <h2>Content</h2>
        </div>
      <div class="container" style="height:600px; font-family:'aCinemaL';margin-top:10px;margin-left:400px;">
		Board Num : ${obj.brdnumber}
		Views : ${obj.brdhit}
		Date :<c:set var="dt" value="${fn:split(obj.brddate, ' ')}" />
			${dt[0]}<br/>
		<form action="/board/likeinsert" method ="post" >
		<input type="hidden" name="brdno" value="${obj.brdno}" />
		<input type="hidden" name="userid" value="${obj.userid}" />
		<input type="hidden" name="brdnumber" value="${obj.brdnumber}" />
		
          <div class="like-content" > 
          <c:if test="${LikeCheck eq 0}">
          
			  <button class="btn-secondary like-review" style="margin-left:680px; padding:4px; font-size:13px; font-family:'aCinemaL';">
			    <i class="fa fa-heart-o"  aria-hidden="true" id="like" >Like </i>
			  </button>
			  </c:if>
			  <c:if test="${LikeCheck eq 1}">
          
			  <button class="btn-secondary like-review" style="margin-left:680px; padding:4px; font-size:13px; font-family:'aCinemaL';">
			    <i class="fa fa-heart"  aria-hidden="true" id="like" >Like </i>
			  </button>
			  </c:if>
			  
		  </div>
		</form>		          
          <form action="/board/insert" method="post" style="box-sizing: content-box;">

              <div class="form-row">
                <div class="col-md-8 form-group">
                  <label for="Writer">Writer</label>
                  <input type="text" class="form-control" style="color:#000000;" name="username" value="<security:authentication property="name"/>" readonly/>
                  <div class="validate"></div>
                </div>
              </div>

               <div class="form-row">
                <div class="col-md-8 form-group">
              	<label for="title">Subject</label>
                <input type="text" class="form-control" style="color:#000000;"name="brdtitle" value="${obj.brdtitle}" id="subject" readonly/>
                <div class="validate"></div>
              </div>
              </div>
              
               <div class="form-row">
                <div class="col-md-8 form-group">
              	<label for="content">Contents</label>
                <textarea class="form-control" style="color:#000000;" name="brdcontent" rows="5" data-rule="required" readonly>${fn:replace(obj.brdcontent, newLineChar, "<br />")}</textarea>
                <div class="validate"></div>
              </div>
              </div>
            </form>
       
					<security:authentication property="name" var="uid" />
					<a href="${pageContext.request.contextPath}/board/list" class="btn btn-sm btn-success">List</a>
					<c:if test="${uid eq obj.username}">
						<a
							href="${pageContext.request.contextPath}/board/update?no=${obj.brdno}&bno=${obj.brdnumber}"
							class="btn btn-sm btn-success">Update</a>
						<a
							href="${pageContext.request.contextPath}/board/delete?no=${obj.brdno}"
							class="btn btn-sm btn-success">Delete</a>
					</c:if>

					<c:if test="${prev != 0}">
						<a
							href="${pageContext.request.contextPath}/board/content?no=${prev}&bno=${obj.brdnumber-1}"
							class="btn btn-sm btn-success">Previous</a>
					</c:if>

					<c:if test="${obj.brdnumber != cnt}">
						<a
							href="${pageContext.request.contextPath}/board/content?no=${next}&bno=${obj.brdnumber+1}"
							class="btn btn-sm btn-success">Next</a>
					</c:if>

        </div>

    </section>
     
    <!-- End Contact Section -->
	</main>
	
	<!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-4 col-md-6">
            <div class="footer-info">
              <<h3>Day</h3>>
              <p>
                A108 Adam Street <br>
                NY 535022, USA<br><br>
                <strong>Phone:</strong> +1 5589 55488 55<br>
                <strong>Email:</strong> info@example.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>

          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Day</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/day-multipurpose-html-template-for-free/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
  <div id="preloader"></div>

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

<script>
$(function(){
	$('.like-review').bind('click', '.like-review', function(e) {
		var a1 = $('#like').text();
		console.log(a1);
		if(a1=='Like'){
			$('#like').text("Like");
			
			//$(this).html('<i class="fa fa-heart" aria-hidden="true"></i> You liked this');
			//$(this).children('.fa-heart').addClass('animate-like');
		}
		else{
			$('#like').text("Like");
			//$(this).html('<i class="fa fa-heart" aria-hidden="true"></i> Like');
			//$(this).children('.fa-heart').removeClass('animate-like');
		}
	});

	/*
	$(document).one('click', '.like-review', function(e) {
		$(this).html('<i class="fa fa-heart" aria-hidden="true"></i> Like');
		$(this).children('.fa-heart').removeClass('animate-like');
	});
	*/
});
</script>