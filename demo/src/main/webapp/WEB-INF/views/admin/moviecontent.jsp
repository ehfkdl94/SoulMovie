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
    <title>Cover Template · Bootstrap</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/cover/">

    <!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

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
      <img src="${pageContext.request.contextPath}/resources/img/logo4.png" alt="">
      <nav class="nav nav-masthead justify-content-center">
        <a class="nav-link active" href="#">Home</a>
        <a class="nav-link" href="#">Features</a>
        <a class="nav-link" href="#">Contact</a>
      </nav>
    </div>
  </header>

  <main role="main" class="inner cover text-center">
  	<div class="row align-items-stretch" style="margin-top:100px;">
                  <div class="col-md-8" data-aos="fade-up">
                    <img src="${pageContext.request.contextPath}/getimg?no=${obj.movie_code}" alt="Image" class="img-fluid"
                    style= "width:800px;height:800px;"
                    >
                  </div>
                  <div class="col-md-3 ml-auto" data-aos="fade-up" data-aos-delay="100">
                    <div class="sticky-content">
					 <h3 class="h3" style="color:white;">${obj.movie_title}</h3>
					<c:set var="dt" value= "${fn:split(obj.movie_date,' ')}"/>
					 <p class="mb-4"><span class="text-muted">${dt[0]}</span></p> 
					 
					 <div class="mb-5">
						<p>감독 (사라질예정) ${obj.movie_director}</p>
		  
					  </div>
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
                    
                
                     <h4 class="h4 mb-3" style="color:white;">인생영화리뷰</h4>
                     <ul class="list-unstyled list-line mb-5">
						<h3 class="h5" style="color:white;">리뷰1</h3>
						<h3 class="h5" style="color:white;">리뷰1</h3>
						<h3 class="h5" style="color:white;">리뷰1</h3>
						<h3 class="h5" style="color:white;">리뷰1</h3>
						<h3 class="h5" style="color:white;">리뷰1</h3>
                     </ul>
         
                 
                    </div>
                  </div>
                 </div>
  </main>

  <footer class="mastfoot mt-auto text-center">
    <div class="inner">
      <p>Cover template for <a href="https://getbootstrap.com/">Bootstrap</a>, by <a href="https://twitter.com/mdo">@mdo</a>.</p>
    </div>
  </footer>
</div>
</body>
</html>
