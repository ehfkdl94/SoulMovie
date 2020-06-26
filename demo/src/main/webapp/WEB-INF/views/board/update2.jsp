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
          	<li><a href="${pageContext.request.contextPath}/choice/list" style = "font-weight: bold ;color:#ff0000;">+ SoulMovie</a></li>
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
    <section id="contact" class="contact">
    	<div class="section-title" >
          <span>Update</span>
          <h2>Update</h2>
        </div>  
      <div class="container" style="height:600px; margin-top:10px;margin-left:400px;font-family:'aCinemaL';">
    	Board Num : ${obj.brdnumber}
		Views : ${obj.brdhit}
		Date :<c:set var="dt" value="${fn:split(obj.brddate, ' ')}" />
			${dt[0]}<br/> 	
          <form action="/board/update" method="post" style="box-sizing: content-box;">
          	<input type="hidden" value="${obj.brdno}" style="color:#000000;" name="brdno"/>
              <div class="form-row">                
                <div class="col-md-8 form-group">
                  <label for="reg_id">Writer</label>
                  <input type="text" class="form-control" style="color:#000000;" name="username" value="<security:authentication property="name"/>"readonly />
                  <div class="validate"></div>
                </div>
              </div>

              <div class="form-row">                
                <div class="col-md-8 form-group">
              	<label for="title">Subject</label>
                <input type="text" class="form-control" name="brdtitle"  value="${obj.brdtitle}" style="color:#000000;"/>
                <div class="validate"></div>
              </div>
              </div>
              
              <div class="form-row">                
                <div class="col-md-8 form-group">
              	<label for="content">Contents</label>
                <textarea class="form-control" name="brdcontent" rows="5" data-rule="required" style="color:#000000;">${obj.brdcontent}</textarea>
                <div class="validate"></div>
              </div>
              </div>
              
              <div class="text">
			  <input type="submit" class="btn btn-sm btn-success" value="Edit" style="background-color:#ffff; color:#ff0000;" />
			  <a href="${pageContext.request.contextPath}/board/list" class="btn btn-sm btn-success">List</a>	
			            
              </div>
              
            </form>

        </div>

    </section>
     
    <!-- End Contact Section -->
	</main>
	
	<%@include file="/WEB-INF/views/footer.jsp" %>

</body>

</html>