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
	 
<header id="header" class="fixed-top" style="background:rgba(0, 0, 0, 0.9);">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/day/assets/img/logo4.png" alt=""></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li><a href="${pageContext.request.contextPath}/">Home</a></li>
          <li><a href="${pageContext.request.contextPath}/movie/movielist">Movie</a></li>
          <li class="active1"><a href="${pageContext.request.contextPath}/board/list">Board</a></li>
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
 
	<section id="cta" class="cta2" style="height:400px;" >
      <div class="container" data-aos="zoom-in">
        <div class="text-center">
        <br />
        <br />
        <br />
          <h3 style="font-family:'PlayfairB';">BOARD</h3>          
          
         
       </div>
      </div>
      
    </section>
  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="rank" class="about">
			<div class="hs-item" style="height: 600px;">
				<div class="container" style="margin-top: 10px;">
				
		<div class="section-title">
          <span>List</span>
          <h2>List</h2>
        </div>
					
			<form action="${pageContext.request.contextPath}/board/list" method="get"  style="font-family:'aCinemaL';">
                  <a href="${pageContext.request.contextPath}/board/insert" class="btn btn-sm btn-success" style=" float:left;font-family:'aCinemaL';">Write</a>
      
                  <input type="hidden" name="page" value="1"/>
                  
                  <input type="submit" class="btn btn-sm btn-success" style ="float:right"; value="Search"/>
                  <input type="text" name="text" placeholder="Please enter a search" style ="float:right";/>
                </form>


					<table class="table table-sm" style="font-family:'aCinemaL';">
						<thead>
							<tr>
								<th>Num</th>
								<th>Subject</th>
								<th>Writer</th>
								<th>Views</th>
								<th>Date</th>
								<th>Likes</th>
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
										<td><a href="${pageContext.request.contextPath}/board/content?no=${tmp.brdno}&bno=${tmp.ROWN}">${tmp.brdtitle}</a>
										</td>
										<td>${tmp.usernick}</td>
										<td><fmt:formatNumber value="${tmp.brdhit}"
												pattern="#,###" /></td>
										<td><c:set var="dt" value="${fn:split(tmp.brddate, ' ')}" />
											${dt[0]}</td>
									<td>${tmp.brdlike}</td> 
									</tr>
									
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					
					
					<div class="container">
				<div class="row mb-5">
					<nav aria-label="Page navigation example" class="mb-4">
						<ul
							class="custom-pagination pagination-primary pagination align-items-stretch">
							
							
							
							<c:if test="${param.page != 1}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/board/list?page=1&text=${param.text}"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/board/list?page=${param.page-1}&text=${param.text}"
									aria-label="Previous"> <span aria-hidden="true">&lt;</span>
								</a></li>
							</c:if>
							
							
			
						
						
							
			<c:forEach var="i" begin="1" end="${cnt}" step="1">
				<c:if test="${param.page == i}">
					<li class="page-item active"><a class="page-link"
						href="${pageContext.request.contextPath}/board/list?page=${i}&text=${param.text}">${i}</a></li>
				</c:if>
				<c:if test="${param.page != i}">
					<li class="page-item"><a class="page-link"
						href="${pageContext.request.contextPath}/board/list?page=${i}&text=${param.text}">${i}</a></li>
				</c:if>
			</c:forEach>
							
							

						
							<c:if test="${cnt != param.page}">
								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/board/list?page=${param.page+1}&text=${param.text}"
									aria-label="Next"><span aria-hidden="true">&gt;</span></a></li>

								<li class="page-item"><a class="page-link"
									href="${pageContext.request.contextPath}/board/list?page=${cnt}&text=${param.text}">&raquo;</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
			
			
					

				



		
		
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
  <%@include file="/WEB-INF/views/footer.jsp" %>

</body>

</html>