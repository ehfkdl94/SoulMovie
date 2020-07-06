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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
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
  	<article id="contact">
								<h2 class="major">Contact</h2>
								<form method="post" action="#">
									<div class="fields">
										<div class="field">
											<label for="name">글번호 : ${obj.brdno}</label>
											<label for="name">작성자 : ${obj.username}</label>
											<label for="name">조회수 : ${obj.brdhit}</label>
										</div>
										<div class="field">
											<label for="email">제목</label>
											<p class="p_class">${obj.brdtitle}</p>

										</div>
										<div class="field">
											<label for="message">내용</label>
											<textarea name="message" id="message" rows="4" >${obj.brdcontent}</textarea>
										</div>
										<div class="field">
											<label for="name">
												<c:set var="dt" value="${fn:split(obj.brddate, ' ')}" />
												가입일 : ${dt[0]}
											</label>
										</div>
									</div>
										<ul class="actions">
											<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/board' ">List</button>
											<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/boardupdate?no=${obj.brdno}' ">update</button>
											<button type="button" onclick="location.href='${pageContext.request.contextPath}/admin/boarddelete?no=${obj.brdno}' ">delete</button>
										</ul>
								
								</form>
								<!--  
								<ul class="icons">
									<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
									<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
									<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
									<li><a href="#" class="icon fa-github"><span class="label">GitHub</span></a></li>
								</ul>
								-->
							</article>
  </main>

  
</div>
</body>
</html>
