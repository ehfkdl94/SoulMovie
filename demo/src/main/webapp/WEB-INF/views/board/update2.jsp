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

<body>

	<%@include file="/WEB-INF/views/header.jsp"%>
	
	<section id="cta" class="cta2" style="height:400px;" >
      <div class="container" data-aos="zoom-in">
        <div class="text-center">
        <br />
        <br />
        <br />
          <h3 style="font-family:'PlayfairB';">MY SOUL BOARD</h3>          
          
         
       </div>
      </div>
      
    </section>
	<main id="main">
    <section id="contact" class="contact">
      <div class="container" style="height:600px; margin-top:10px;font-family:'aCinemaL';">
      <h2>Board update</h2><br/>
      	Board Num : ${bno}
		Views : ${obj.brdhit}
		Date :<c:set var="dt" value="${fn:split(obj.brddate, ' ')}" />
			${dt[0]}<br/> 	
          <form action="/board/update" method="post" style="box-sizing: content-box;">
          	<input type="hidden" value="${obj.brdno}" style="color:#000000;" name="brdno"/>
              <div class="form-row">                
                <div class="col-md-8 form-group">
                  <label for="reg_id">Writer</label>
                  <input type="text" class="form-control" style="color:#000000;" name="username" value="<security:authentication property="name"/>"readonly />
                  <div class="validate"></div>
                </div>
              </div>

              <div class="form-row">                
                <div class="col-md-8 form-group">
              	<label for="title">Subject</label>
                <input type="text" class="form-control" name="brdtitle"  value="${vo.brdtitle}" style="color:#000000;"/>
                <div class="validate"></div>
              </div>
              </div>
              
              <div class="form-row">                
                <div class="col-md-8 form-group">
              	<label for="content">Contents</label>
                <textarea class="form-control" name="brdcontent" rows="5" data-rule="required" style="color:#000000;">${vo.brdcontent}</textarea>
                <div class="validate"></div>
              </div>
              </div>
              
              <div class="text">
			  <input type="submit" class="btn btn-sm btn-success" value="Edit" />
			  <a href="${pageContext.request.contextPath}/board/list" class="btn btn-sm btn-success">List</a>	
			            
              </div>
              
            </form>

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