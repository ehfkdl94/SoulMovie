<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Day Bootstrap Template - Index</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/day/assets/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/day/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link
    href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
    rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/day/assets/css/style2.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Day - v2.1.0
  * Template URL: https://bootstrapmade.com/day-multipurpose-html-template-for-free/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <!--fold -->
  <!-- Theme Style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/icomoon/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/owl.carousel.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/animate.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/aos.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/jquery.fancybox.min.css">
  <!-- <link rel="stylesheet" href="css/style.css"> -->
</head>

<body>



 <%@include file="/WEB-INF/views/header.jsp" %>



  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about" style="margin-top:100px;">
      <div class="container">

        <div class="row">
          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content " data-aos="fade-RIG"  >
            <img src="http://file.koreafilm.or.kr/thm/02/00/05/21/TN_DPK014660.jpg"  style= "width:300px; height:400px; margin-left:100px ;" "class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left">
            <div class="why-us" data-aos="fade-up">
              <div class="box" style="height:101px;">
                <span>${list.movie_title}</span>

              </div>
            </div>
            <div class="why-us" data-aos="fade-up">
              <div class="box" style="height:101px; ">
              <c:set var="dt" value= "${fn:split(list.movie_date,' ')}"/>
					<span>${dt[0]}</span>
                


              </div>
            </div>
            <div class="why-us" data-aos="fade-up">
              <div class="box" style="height:101px;">
                <span>${list.movie_actor}</span>


              </div>
            </div>
            <div class="why-us" data-aos="fade-up">
              <div class="box" style="height:101px;">
                <span>${list.movie_genre}</span>


              </div>
            </div>

          </div>

        </div>

      </div>
      <div class="unslate_co--section section-counter" id="skills-section" style="margin:0 auto;">
        <div class="container">
          


          <div class="row justify-content-center" >
            <div class="col-6 col-sm-6 mb-5 mb-lg-0 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="0">
              <div class="counter-v1 text-center">
                <span class="number-wrap">
                  <span class="number number-counter" style="color:#ff0000;" data-number="${list.rank}">0</span>
                  <span class="append-text">등</span>
                </span>
                <span class="counter-label">Rank</span>
              </div>
            </div>
            <div class="col-6 col-sm-6 mb-5 mb-lg-0 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="100">
              <div class="counter-v1 text-center">
                <span class="number-wrap">
                  <span class="number number-counter" style="color:#ff0000;" data-number="${list.movie_freq}">0</span>
               	
                </span>
                <span class="counter-label">View</span>
              </div>
            </div>
           
          </div>
        </div>
      </div>
      <div class="unslate_co--section section-counter" id="skills-section">
        <div class="container">
          


          <div class="row justify-content-center">
          
            <div class="col-6 col-sm-6 mb-5 mb-lg-0 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="200">
              <div class="counter-v1 text-center">
                <span class="number-wrap">
                  <span class="number number-counter" style="color:#ff0000;" data-number=" ${list.movie_cnt}">0</span>
                  <span class="append-text"></span>
                </span>
                <span class="counter-label">number of spectators</span>
              </div>
            </div>
           <!--  <div class="col-6 col-sm-6 mb-5 mb-lg-0 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
              <div class="counter-v1 text-center">
                <span class="number-wrap">
                  <span class="number number-counter" style="color:#ff0000;" data-number="100">0</span>
                  <span class="append-text">%</span>
                </span>
                <span class="counter-label">Design</span>
              </div>
            </div> -->
          </div>
        </div>
      </div>
    </section><!-- End About Section -->

    <!-- ======= Why Us Section ======= -->
    <section id="why-us" class="why-us">
      <div class="container">

        <div class="row">
        <c:if test="${!empty review}">
						 <c:forEach var="tmp" items="${review}">
						 <h3 class="h5" style="color:white;">  :</h3>
                  		   <div class="col-lg-4" data-aos="fade-up">
					            <div class="box">
					              <span>${tmp.choice_id}</span>
					              <h4>Lorem Ipsum</h4>
					              <p> ${tmp.choice_reason}</p>
					            </div>
					       </div>
						</c:forEach>
						</c:if>
						<c:if test="${empty review}">
					
						 <div class="box" style="margin: 0 auto; width:500px;">
					
						         <a href="${pageContext.request.contextPath}/choice/insert?text=&chk=${list.movie_code}"> <span style="text-align:center">review 등록</span></a>
					              
					            </div>
					            
					          
						</c:if>
			
	       
		
<!--           <div class="col-lg-4 mt-4 mt-lg-0" data-aos="fade-up" data-aos-delay="150">
            <div class="box">
              <span>02</span>
              <h4>Repellat Nihil</h4>
              <p>Dolorem est fugiat occaecati voluptate velit esse. Dicta veritatis dolor quod et vel dire leno para
                dest</p>
            </div>
          </div>

          <div class="col-lg-4 mt-4 mt-lg-0" data-aos="fade-up" data-aos-delay="300">
            <div class="box">
              <span>03</span>
              <h4> Ad ad velit qui</h4>
              <p>Molestiae officiis omnis illo asperiores. Aut doloribus vitae sunt debitis quo vel nam quis</p>
            </div>
          </div>

        </div> -->

      </div>
      </div>
    </section><!-- End Why Us Section -->

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

    <!--fold-->
    <script src="${pageContext.request.contextPath}/resources/unfold/js/scripts-dist.js"></script>
    <script src="${pageContext.request.contextPath}/resources/unfold/js/main.js"></script>
</body>

</html>