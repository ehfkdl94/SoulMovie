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
  <title>Soul Movie Detail</title>
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
          	<li><a href="${pageContext.request.contextPath}/choice/insert" style = "font-weight: bold ;color:#ff0000;">Add SoulMovie</a></li>
          </security:authorize>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->

<section id="cta" class="cta" style="height:400px;" >
      <div class="container" data-aos="zoom-in">
        <div class="text-center">
        <br />
        <br />
        <br />
          <h3 style="font-family:'PlayfairB';">MOVIE LIST</h3>          
          
         
        </div>
      </div>
      
    </section>

  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about" style="margin-top:100px;">
      <div class="container">

        <div class="row">
          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content " data-aos="fade-RIG"  >
            <img src="${list.movie_img}"  style= "border: solid 1px black; width:300px; height:400px; margin-left:100px ;" "class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left">
            <div class="why-us" data-aos="fade-up">
              <div class="box" style="height:101px; word-break:break-all;"> 
                <span style="color:#ed5b5b;">${list.movie_title}</span>
              </div>
            </div>
            <div class="why-us" data-aos="fade-up">
              <div class="box" style="height:300px; word-break:break-all; ">
              <c:set var="dt" value= "${fn:split(list.movie_date,' ')}"/>
					<span style="word-break:break-all; color:black; font-size:20px; font-weight:bold;">${dt[0]}</span></br>
                	<span style="font-weight:bold; color:black; font-size:18px; ">${list.movie_actor}</span></br>
					 <span style="word-break:break-all;  color:black; font-size:20px; font-weight:bold;">${list.movie_genre}</span>

              </div>
            </div>
   


          </div>

        </div>

      </div>
      
      
      <div class="unslate_co--section section-counter" id="skills-section" style="margin:0 auto; margin-top:100px; margin-bottom:100px;">
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
             <div class="col-6 col-sm-6 mb-5 mb-lg-0 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="100">
              <div class="counter-v1 text-center">
                <span class="number-wrap">
                  <span class="number number-counter" style="color:#ff0000;" data-number=" ${list.movie_cnt}">0</span>
                  <span class="append-text"></span>
                </span>
                <span class="counter-label">reviews</span>
              </div>
            </div>
           
          </div>
        </div>
      </div>
      
      

    </section><!-- End About Section -->

    <!-- ======= Why Us Section ======= -->
    <section id="why-us" class="why-us">
      <div class="container">

        <div class="row">
        <c:if test="${!empty review}">
        <div style="margin: 0 auto;  "></div>
						 <c:forEach var="tmp" items="${review}">
                  		   <div class="col-lg-4" data-aos="fade-up">
					            <div class="box" style="height:300px;word-break:break-all;" >
					              <span>${tmp.user_nick}</span>
					              <h5>${tmp.choice_reason}</h5>
					       <!--        <textarea  style="height:300px; width:100%;" readonly> </textarea> -->
					              <!-- <p> </p> -->
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
    </main>
     <%@include file="/WEB-INF/views/footer.jsp" %>

   

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