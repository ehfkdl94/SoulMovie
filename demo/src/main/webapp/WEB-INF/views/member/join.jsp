<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
		<title>login</title>
	<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Join</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

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

  <!-- =======================================================
  * Template Name: Day - v2.1.0
  * Template URL: https://bootstrapmade.com/day-multipurpose-html-template-for-free/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

<!-- ======= Header ======= -->
  <header id="header" class="fixed-top" style="background:rgba(0, 0, 0, 0.9);">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="index.html"><img src="${pageContext.request.contextPath}/resources/day/assets/img/logo4.png" alt=""></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li><a href="${pageContext.request.contextPath}/">Home</a></li>
          <li><a href="${pageContext.request.contextPath}/movie/movielist">Movie</a></li>
          <li><a href="${pageContext.request.contextPath}/board/list">board</a></li>
          <li><a href="${pageContext.request.contextPath}/">Contact</a></li>
          <security:authorize access="!isAuthenticated()">
          	<li><a href="${pageContext.request.contextPath}/">help</a></li>
          	<li><a href="${pageContext.request.contextPath}/member/login">login</a></li>
          	<li><a href="${pageContext.request.contextPath}/member/join" style = "font-weight: bold ;color:#ff0000;">Create an account</a></li>
          </security:authorize>
          <security:authorize access="isAuthenticated()">
          	<li><a href="${pageContext.request.contextPath}/member/mypage?username=<security:authentication property="name"/>">My page</a></li>
          	<li><a href="${pageContext.request.contextPath}/member/logout">logout</a></li>
          </security:authorize>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->
  
  
  <!-- Page Preloder -->
   <div id="preloder">
      <div class="loader"></div>
   </div>



	<!-- Hero section -->
	<section class="hero-section">
	
			<div class="hs-item" style="height:900px;">
				<div class="container">
				   <div style="margin-bottom: 250px;">
							<div class="row mb-5 align-items-center">
							
							<!-- <div class="col-md-12 col-lg-6 text-left text-lg-right" data-aos="fade-up" data-aos-delay="100">
								<div id="filters" class="filters">
								<a href="#" data-filter="*" class="active" style="color:white;">All</a>
								<a href="#" data-filter=".web" style="color:white;">Web</a>
								<a href="#" data-filter=".design" style="color:white;">Design</a>
								<a href="#" data-filter=".branding" style="color:white;">Branding</a>
								<a href="#" data-filter=".photography" style="color:white;">Photography</a>
								</div>
							</div> -->
							</div>
					
                            <div class="hero-slider owl-carousel">
                                <div class="hs-item" style="height: 600px;">
                                
                                <div id="wrapper" style="margin-top:200px;">
                                
                                    <!-- Main -->
                                    
                                        <div id="main">
                    
                                    <!-- Contact -->
                                        <article id="contact" class="active" style="">
                    
                                                
                                            <h2 class="major">JOIN</h2>




						<form action= "${pageContext.request.contextPath}/member/join" method="post">
                              <!--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
                              <div class="fields">
                                 <div class="field half">
                                    <label for="username">ID</label>
                                    <input type="text" style="color:#ffffff" name="username" id="username" value="" placeholder="ID" /><p id="chk"></p>
                                    <input type="button" id="btn" value="중복확인" />
                        
                                 </div>
                                 <br />
                                 <div class="field half">
                                    <label for="password">PASSWORD</label>
                                    <input type="password" style="color:#ffffff" name="password" id="password" value="" placeholder="password" />
                                 </div>
                                 <div class="field half">
                                    <label for="userrname">NAME</label>
                                    <input type="text" style="color:#ffffff" name="userrname" id="userrname" value="" placeholder="name" />
                                 </div>
                                 
                                 

                                 
                              
                                 
                                 <div class="field half">
                                    <label for="usergender" >GENDER</label>
                                        <select name= "usergender" style="color:#ffffff" >
                                          <option id="demo-priority-male" value="male">MALE</option>
                                          <option id="demo-priority-female" value="female">FEMALE</option>
                                  
                                    </select>
                                 </div>
                                 
                                 
                                 
                                 
                                 
                                 
                                 <div class="field half">
                                    <label for="usernick">NICKNAME</label>
                                    <input type="text" style="color:#ffffff" name="usernick" id="usernick" value="" placeholder="nickname" />확인<p id="chk2"></p>
                                    
                                 </div>


                                 
                                 <div class="field half" >
                                    <label for="userage">AGE</label>
                                    <select name= "userage" style="color:#ffffff">
                                          <option id="userage" value="10대">10-19</option>
                                          <option id="userage" value="20대">20-29</option>
                                          <option id="userage" value="30대">30-39</option>
                                          <option id="userage" value="40대">40-49</option>
                                          <option id="userage" value="50대">50-59</option>
                                          <option id="userage" value="60대이상">60 over</option>
                                    </select>
                                 </div>
                              

                                    <div class="field">
                                       <label for="useremail">E-MAIL</label>
                                       <input type="email" style="color:#ffffff" name="useremail" id="useremail" value="" placeholder="e-mail">
                                    </div>
                                    
                                          
                              </div>
                              <ul class="actions">
                                 <li><input type="submit" value="JOIN IN" class="primary"></li>
                                 <li><input type="reset" value="RESET"></li>
                              </ul>
                              

                
                </form>
	
	
	
	
	<script type="text/javascript" 
		src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
	<script>


	

				$(function(){
					//id가 userid인 tag의 키보드가 up되면
					$('#usernick').bind('keyup',function(){
						var unick = $('#usernick').val(); //입력했던 값을 받아와서 uid변수에 보관
			
						//restcontroller를 호출해서 값을 받아옴
						$.get('/member/rest/membernickcheck.json?usernick=' + unick,function(data){
							console.log("GET", data);
							//console.log("GET", data);  {"ret":1}  or {"ret":0}
							if(data.ret == 1){
								$('#chk2').text('중복된 닉네임이 있습니다.');
							}
							else if(data.ret == 0){
								$('#chk2').text('사용가능');
							}
						}, 'json');
						
						/*
						$.post('/rest/memberidcheck.json', {id:'a'}, function(data){
							console.log("POST", data);
						}, 'json');
						*/
					});
				});
			





	
		$(function(){
			//id가 userid인 tag의 키보드가 up되면
			$('#btn').bind('click',function(){
				var uid = $('#username').val(); //입력했던 값을 받아와서 uid변수에 보관

				if (uid.length >= 2){
				//restcontroller를 호출해서 값을 받아옴
				$.get('/member/rest/memberidcheck.json?username=' + uid,function(data){
					console.log("GET", data);
					//console.log("GET", data);  {"ret":1}  or {"ret":0}
					if(data.ret == 1){
						$('#chk').text('사용불가');
						alert('중복된 ');
					}
					else if(data.ret == 0){
						$('#chk').text('사용가능');
						alert('사용가능');
					}
				}, 'json');
				}
				else{
					alert('아이디를 N자 이상으로 설정해주세요.');
					}
				
				/*
				$.post('/rest/memberidcheck.json', {id:'a'}, function(data){
					console.log("POST", data);
				}, 'json');
				*/
			});
		});
	</script>	

                                          </article>
                    
                                 
                                                
                                            
                                          </div>
                       
                          </div>
                          
                    
                                    
                    
                    
                                    
                                   
                                </div>
                            </div>
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
	<script src="${pageContext.request.contextPath}resources/js/jsLogin/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}resources/js/jsLogin/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}resources/js/jsLogin/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}resources/js/jsLogin/util.js"></script>
	<script src="${pageContext.request.contextPath}resources/js/jsLogin/main.js"></script>
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
