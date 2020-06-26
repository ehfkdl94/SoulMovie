<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title>Soul Movie Admin Page</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/cover/">

    <!-- Bootstrap core CSS -->
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }
	  td, tr{
	  	color:white;
	  }
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/cover.css" rel="stylesheet">
    
  </head>
  <body>
    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
  <header class="masthead mb-auto">
    <div class="inner">
      <a href="${pageContext.request.contextPath}/admin/home"><img src="${pageContext.request.contextPath}/resources/img/logo4.png" alt=""></a>
      <nav class="nav nav-masthead justify-content-center">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/home">Home</a>
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/member">Member</a>
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/movie">Movie</a>
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/board">Board</a>
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/contact">Contact</a>
      </nav>
    </div>
  </header>

  <main role="main" class="inner cover text-center">
  	<div class="row align-items-stretch" style="margin-top:100px;">
                  <div class="col-md-8" data-aos="fade-up">
                    <img src="${obj.movie_img}" alt="Image" class="img-fluid"
                    style= "width:800px;height:800px;"
                    >
                  </div>
                  <div class="col-md-3 ml-auto" data-aos="fade-up" data-aos-delay="100">
                    <div class="sticky-content">
					 <h3 class="h3" style="color:white;">${obj.movie_title}</h3>
					<c:set var="dt" value= "${fn:split(obj.movie_date,' ')}"/>
					 <p class="mb-4"><span class="text-muted">${dt[0]}</span></p> 
					 
				
					  <div class="mb-5">
						<p>출연진 ${obj.movie_actor}</p>
		  
					  </div>
					  <div class="mb-5">
						<p>장르 ${obj.movie_genre}</p>
		  
					  </div>
					  <div class="mb-5">
						<p>순위 ${obj.rank}</p>
		  
					  </div>
					  <div class="mb-5">
						<p>총 누적 관람 횟수 ${obj.movie_freq}</p>
		  
					  </div>
					  <div class="mb-4">
						<p>인생 영화 선정수 ${obj.movie_cnt}</p>
		  				
					  </div>
                    </div>
                  </div>
                 </div>
                 <ul class="actions">
					<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/movie' ">List</button>
					
				 </ul>
  </main>

  <footer class="mastfoot mt-auto text-center">
    <div class="inner">
      <p>Cover template for <a href="https://getbootstrap.com/">Bootstrap</a>, by <a href="https://twitter.com/mdo">@mdo</a>.</p>
    </div>
  </footer>
</div>
</body>
</html>
