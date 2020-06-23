<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Soul Movie</title>
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
<header id="header" class="fixed-top " style="background:rgba(0, 0, 0, 0.9);">
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
  <section style="margin-top:100px;">
인생영화 수정
	<form action="${pageContext.request.contextPath}/choice/update" method="post" >
			<input type="hidden" class="form-control" name="choice_no" value="${obj.choice_no}"/>		
			시청 횟수 : <input type="text" class="form-control" name="choice_freq" value="${obj.choice_freq}"/>	<br />		
			인생영화 선택 이유 : <textarea id="content" name="choice_reason" placeholder="${obj.choice_reason}"></textarea><br />
							<input type="checkbox" name="choice_category" value="영상미" />영상미
							<input type="checkbox" name="choice_category" value="스토리" />스토리
							<input type="checkbox" name="choice_category" value="연기" />연기
							<input type="checkbox" name="choice_category" value="음악" />음악
							<input type="checkbox" name="choice_category" value="기타" />기타<br />			
			<hr />
			<input type="submit" class="btn btn-success" value="저장" />
	</form>
</section>	
</body>
</html>