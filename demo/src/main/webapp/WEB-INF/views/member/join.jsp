<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
  <head>
  
    <title>Join</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <meta name="description" content="">
    <meta name="keywords" content="html, css, javascript, jquery">
    <meta name="author" content="">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/icomoon/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/vendor/jquery.fancybox.min.css">
    

    <!-- Theme Style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unfold/css/style.css">
	  <%@include file="/WEB-INF/views/head.jsp" %>
	  
  </head>
  <body data-spy="scroll" data-target=".site-nav-target" data-offset="200" style="background:rgba(0, 0, 0, 0.9);">
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
          <li><a href="${pageContext.request.contextPath}/board/list">board</a></li>
          <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
          <security:authorize access="!isAuthenticated()">
          	<li><a href="${pageContext.request.contextPath}/member/login">login</a></li>
          	<li><a href="${pageContext.request.contextPath}/member/join" style = "font-weight: bold ;color:#ff0000;">Create an account</a></li>
          </security:authorize>
          <security:authorize access="isAuthenticated()">
          	<li><a href="${pageContext.request.contextPath}/member/mypage?username=<security:authentication property="name"/>">My page</a></li>
          	<li><a href="${pageContext.request.contextPath}/member/logout">logout</a></li>
          	<li><a href="${pageContext.request.contextPath}/choice/insert" style = "font-weight: bold ;color:#ff0000;">Add SoulMovie</a></li>
          </security:authorize>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->
   



<!--  
    <div class="unslate_co--site-wrap">

      <div class="unslate_co--site-inner">

        <div class="lines-wrap">
          <div class="lines-inner">
            <div class="lines"></div>
          </div>
        </div>
      


        </div>
      </div>
       -->

      <div class="unslate_co--section" id="services-section">
        <div class="container">



        </div>
      </div>





      <div class="unslate_co--section" id="contact-section">
        <div class="container">
          <div class="section-heading-wrap text-center mb-5">
            <h2 class="heading-h2 text-center divider"><span class="gsap-reveal">JOIN</span></h2>
            <span class="gsap-reveal"><img src="${pageContext.request.contextPath}/resources/unfold/images/divider.png" alt="divider" width="55"></span>
          </div>


          <div class="row justify-content-between">
            
            <div class="col-md-8" style="margin-left: 33%;">
            
               
              <form action="${pageContext.request.contextPath}/member/join" class="form-outline-style-v1" method="post">
                <div class="form-group row mb-0">

                  <div class="col-md-7 form-group gsap-reveal">
                   
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <label for="username">ID</label>
                    <input name="username" type="text" class="form-control" id="username">
                  </div>
                  <div class="col-md-5" >
                    <p id="chk" style="padding:18px;margin:0px; font-size:16px; color:#ff0000"></p>
                  </div>
                  <br />
                  
                  <div class="col-md-7 form-group gsap-reveal">
                    <label for="password">Password</label>
                    <input name="password" type="password" class="form-control" id="password">
                  </div>
                  <div class="col-md-5" >
                    <p id="" style="padding:18px;margin:0px;"></p>
                  </div>

                  <div class="col-md-7 form-group gsap-reveal">
                    <label for="userrname">Name</label>
                    <input name="userrname" type="text" class="form-control" id="userrname">
                  </div>
                   <div class="col-md-4" >
                    <p id="" style="padding:18px;margin:0px;"></p>
                  </div>
                

    
                    <div class="col-md-4 form-group gsap-reveal" style="padding:18px; color:#fff; margin:0px;">
                        <label for="usergender" style="color:#A6A6A6">Gender</label><br />
                        <input type="radio" name= "usergender" id="usergender" value="Male">Male &nbsp; &nbsp;
                        <input type="radio" name= "usergender" id="usergender" value="Female">Female
                      
                             
                    </div>
                    
                    
                       <div class="col-md-4 form-group gsap-reveal" style="padding:18px; margin:0px;">
					 <label for="userage" style="color:#A6A6A6">Age</label><br />
                                 <select name= "userage" style="border:1px solid #A6A6A6;background-color:#A6A6A6; border: 1px solid #fff; color:#fff;">
                                       <option id="userage" value="10대">10-19</option>
                                       <option id="userage" value="20대">20-29</option>
                                       <option id="userage" value="30대">30-39</option>
                                       <option id="userage" value="40대">40-49</option>
                                       <option id="userage" value="50대">50-59</option>
                                       <option id="userage" value="60대이상">60 over</option>
                                 </select>
                             </div>
                             <div class="col-md-7" >
								<p id="" style="padding:18px;margin:0px; font-size:16px; color:#ff0000"></p>
					       </div>
                    
                    
                    

                     <div class="col-md-7 form-group gsap-reveal">
                        <label for="email">E-mail</label>
                        <input name="useremail" type="email" class="form-control" id="email">
                    </div>
                    <div class="col-md-5" >
						<p id="" style="padding:18px;margin:0px; font-size:16px; color:#ff0000"></p>
					</div>
                    
                    
                    
                    
                    <div class="col-md-7 form-group gsap-reveal">
                    	<label for="usernick">NickName</label>
						<input type="text" name="usernick" class="form-control" id="usernick">
					</div>
					<div class="col-md-5" >
						<p id="chk2" style="padding:18px;margin:0px; font-size:16px; color:#ff0000"></p>
					</div>

                  
               
               </div>
               		<section class="cta" style="background-image:none; padding:10px">
						<div class="form-group row gsap-reveal" style="margin-left: 42%;">
                    <div class="col-md-12 d-flex align-items-center">
                    
                       <input type="submit" class="cta-btn" style="font-family:aCinemaL;" value="JOIN" />
                      <span class="submitting"></span>
                    </div>
                  </div>
                  </section>
              </form>
              
              				
		<script type="text/javascript" 
			src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
		
	 


	 	<script>
 		$(function(){
			//nickname이 usernick인 tag의 키보드가 up되면
			$('#usernick').bind('keyup',function(){
				var unick = $('#usernick').val(); //입력했던 값을 받아와서 unick변수에 보관
	
				//restcontroller를 호출해서 값을 받아옴
		
					if (unick.length >= 2){
						//restcontroller를 호출해서 값을 받아옴
						$.get('${pageContext.request.contextPath}/member/rest/membernickcheck.json?usernick=' + unick,function(data){
							console.log("GET", data);
							//console.log("GET", data);  {"ret":1}  or {"ret":0}
							if(data.ret == 1){
								$('#chk2').text('이미 사용 중인 닉네임입니다.');
							}
							else if(data.ret == 0){
								$('#chk2').text('사용가능');
							}
						}, 'json');
						}
					else{
						$('#chk2').text('닉네임을 두 글자 이상으로 설정해 주세요.');
						}

			});
		});

       
 		$(function(){
			//nickname이 usernick인 tag의 키보드가 up되면
			$('#username').bind('keyup',function(){
				var uid = $('#username').val(); //입력했던 값을 받아와서 unick변수에 보관
	
				//restcontroller를 호출해서 값을 받아옴
		
					if (uid.length >= 3){
						//restcontroller를 호출해서 값을 받아옴
						$.get('${pageContext.request.contextPath}/member/rest/memberidcheck.json?username=' + uid,function(data){
							console.log("GET", data);
							//console.log("GET", data);  {"ret":1}  or {"ret":0}
							if(data.ret == 1){
								$('#chk').text('이미 사용 중인 아이디입니다.');
							}
							else if(data.ret == 0){
								$('#chk').text('사용가능');
							}
						}, 'json');
						}
					else{
						$('#chk').text('아이디를 세 글자 이상으로 설정해 주세요.');
						}

			});
		});
           


		
		</script>
 
 
 
           

            </div>

    

          </div>
        </div>
      </div>
 

    
    <!-- Loader 
    <div id="unslate_co--overlayer"></div>
    <div class="site-loader-wrap">
      <div class="site-loader"></div>
    </div>
    -->

    <script src="${pageContext.request.contextPath}/resources/unfold/js/scripts-dist.js"></script>
    <script src="${pageContext.request.contextPath}/resources/unfold/js/main.js"></script>


	 <%@include file="/WEB-INF/views/footer.jsp" %>
  </body>
</html>