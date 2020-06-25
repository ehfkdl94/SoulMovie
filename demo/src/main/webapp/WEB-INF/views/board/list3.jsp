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
	 
 <%@include file="/WEB-INF/views/header.jsp" %>
 
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

    <!-- ======= About Section ======= -->
    <section id="rank" class="about">
			<div class="hs-item" style="height: 1200px;">
				<div class="container" style="margin-top: 10px;">
					<h2 >Board list</h2><br/>
					
					<form action="${pageContext.request.contextPath}/board/list" method="get"  style="font-family:'aCinemaL';">
						<input type="hidden" name="page" value="1"/>
						<input type="text" name="text" placeholder="Please enter a search" style="float:left"/>
						<input type="submit" class="btn btn-sm btn-success" value="Search"/>
						<a href="${pageContext.request.contextPath}/board/insert" class="btn btn-sm btn-success">Write</a>
			 		</form>

					<table class="table table-sm" style="font-family:'aCinemaL';">
						<thead>
							<tr>
								<th>Num</th>
								<th>Subject</th>
								<th>Writer</th>
								<th>Views</th>
								<th>Date</th>
							</tr>
						</thead>

						<tbody>
							<c:if test="${empty list}">
								<tr>
									<td colspan="5">No results were found for your search.</td>
								</tr>
							</c:if>
							<c:if test="${!empty list}">
								<c:forEach var="tmp" items="${list}">
									<tr>
										<td>${tmp.ROWN}</td>
										<td><a
											href="/board/content?no=${tmp.brdno}&bno=${tmp.brdnumber}">${tmp.brdtitle}</a>
										</td>
										<td>${tmp.username}</td>
										<td><fmt:formatNumber value="${tmp.brdhit}"
												pattern="#,###" /></td>
										<td><c:set var="dt" value="${fn:split(tmp.brddate, ' ')}" />
											${dt[0]}</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<c:if test="${param.page != 1}">

				<a style="font-size: 20px; 
					href="${pageContext.request.contextPath}/admin/member?page=${param.page-1}&text=${param.text}"><<</a>
			</c:if>

			<c:forEach var="i" begin="1" end="${cnt}" step="1">
				<c:if test="${param.page == i}">
					<a class="active" style="font-size: 20px;"
						href="${pageContext.request.contextPath}/board/list?page=${i}&text=${param.text}">${i}</a>
				</c:if>
				<c:if test="${param.page != i}">
					<a style="font-size: 20px;"
						href="${pageContext.request.contextPath}/board/list?page=${i}&text=${param.text}">${i}</a>
				</c:if>
			</c:forEach>


			<c:if test="${cnt != param.page}">
				<a style="font-size: 20px;"
					href="${pageContext.request.contextPath}/board/list?page=${param.page+1}&text=${param.text}">>></a>
			</c:if>
				</div>
				
			</div>

			<!--  
			<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
			-->
			

		</section>
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