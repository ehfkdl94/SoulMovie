<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <title>login</title>
    <meta charset="UTF-8">
    <meta name="description" content="SolMusic HTML Template">
    <meta name="keywords" content="music, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		

    <!-- Favicon -->
    <link href="${pageContext.request.contextPath}/resources/img/favicon.ico" rel="shortcut icon" />

    <!-- Google font -->
    <link
        href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i&display=swap"
        rel="stylesheet">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csslogin/main.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csslogin/noscript.css" />
    <!-- Bootstrap CSS File -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="${pageContext.request.contextPath}/resources/vendor/icofont/icofont.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/line-awesome/css/line-awesome.min.css"
        rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/aos/aos.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/vendor/owlcarousel/assets/owl.carousel.min.css"
        rel="stylesheet">

    <!-- Main Stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css" />
    <link href="${pageContext.request.contextPath}/resources/css/style1.css" rel="stylesheet">


    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
   <![endif]-->
    <!-- 카테고리 jsp -->

    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=PT+Sans:400,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cssContent/bootstrap.min.css"
        type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cssContent/font-awesome.min.css"
        type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cssContent/nice-select.css"
        type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cssContent/slicknav.min.css"
        type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cssContent/style.css" type="text/css">

</head>

<body>

    
    
    <!-- Hero section -->
    <section class="hero-section">

        <div class="hero-slider owl-carousel">
            <div class="hs-item" style="height: 700px;">
            
            <div id="wrapper">
			
				<!-- Main -->
				
					<div id="main">

				<!-- Contact -->
					<article id="contact" class="active" style="">

							
						<h2 class="major">LOGIN</h2>
						<form action='${pageContext.request.contextPath}/loginProcess' method='POST' >
						
						  <div class="fields">
						 
							<div class="field">	
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<label for="username">ID</label>
							<input type="text" class="form-control" id="username" name="username" placeholder="ID" >
							</div><br />
							<div class="field">
							<label for="password">PASSWORD</label>
							<input type="password" class="form-control" id="password" name="password" placeholder="Password" >
							</div>			
							 
							 
					      </div>
					      <br />
					    
					  
					     <ul class="actions">
							<li>
							<input type="submit" value="LOGIN" class="primary">
							</li>	
						 </ul>	
						 
					</form>
				 

	  				</article>

             
							
	  				  
	  				</div>
   
      </div>
      

                


                
               
            </div>
        </div>
        </div>


    </section>
    <!-- Hero section end -->

    <!-- page start -->




    <!-- page end -->


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
    <!-- 컨텐츠  -->
    <script src="${pageContext.request.contextPath}/resources/js/jsContent/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jsContent/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jsContent/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jsContent/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jsContent/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jsContent/main.js"></script>

       <!-- Scripts -->
					
				<script src="resources/js/jsLogin/jquery.min.js"></script>
				<script src="resources/js/jsLogin/browser.min.js"></script>
				<script src="resources/js/jsLogin/breakpoints.min.js"></script>
				<script src="resources/js/jsLogin/util.js"></script>
				<script src="resources/js/jsLogin/main.js"></script>
</body>

</html>