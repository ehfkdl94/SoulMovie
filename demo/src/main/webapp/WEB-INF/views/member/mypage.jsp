<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>

		<title>My Page</title>
  <%@include file="/WEB-INF/views/head.jsp" %>
  
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
          <li><a href="${pageContext.request.contextPath}/movie/movielist">Movie</a></li>
          <li><a href="${pageContext.request.contextPath}/board/list">Board</a></li>
          <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
          <security:authorize access="!isAuthenticated()">
          	<li><a href="${pageContext.request.contextPath}/member/login">Login</a></li>
          	<li><a href="${pageContext.request.contextPath}/member/join" style = "font-weight: bold ;color:#ff0000;">Create an account</a></li>
          </security:authorize>
          <security:authorize access="isAuthenticated()">
          	<li class="active1"><a href="${pageContext.request.contextPath}/member/mypage?username=<security:authentication property="name"/>">My page</a></li>
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
				          <h3 style="font-family:'PlayfairB';">MY INFORMATION</h3>          
			        </div>
		      </div>
	      
	    </section>
	    
	    

			
    <%@include file="/WEB-INF/views/sidebar.jsp" %>
    
	<section id="about" class="about" style="margin-top:20px;margin-left:200px;">


	<div class="container"> 
	
	
	 <div class="section-title" style="font-family:'GothicB';">
	 <span style="margin-right:100px;">Information</span>
          <h2 style="margin-right:100px;">${user_nick}님의 정보<br /></h2>       
      </div>	
      
	
             <div class="row" style="margin-left:200px;" >      
	
					
				<div class="col-lg-8 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right" style="font-family:aCinemaL;">
					<table style="word-break:break-all" class="table">
						<tbody>
							<tr>					
							  <td>
								
								<form action="${pageContext.request.contextPath}/member/mypage" method="post" enctype="multipart/form-data">
										<ul>
										<li><i class="icofont-check-circled"></i>ID<input type="text" class="form-control" name="username" value="${obj.username}" style="color:#fff;background-color:#000; opacity:15%;" readonly /></li>
										<br />
										
										<!-- 
										<li><i class="icofont-check-circled"></i>ID : ${obj.username}</li>
										 -->
										 
										<li><i class="icofont-check-circled"></i>NAME<input id="userrname" class="form-control" name="userrname" value="${obj.userrname}" style="color:#fff;background-color:#000; opacity:15%;" readonly /></li>
										<br />
										
										<li><i class="icofont-check-circled"></i>NICKNAME<input id="text" class="form-control" name="usernick" value="${obj.usernick}" style="color:#fff;background-color:#000; opacity:15%;" readonly /></li>
										<br />
									
							            <li><i class="icofont-check-circled"></i>AGE<input id="text" class="form-control" name="usernick" value="${obj.userage}" style="color:#fff;background-color:#000; opacity:15%;" readonly /></li>
							            <br />
							                       
										<li><i class="icofont-check-circled"></i>GENDER<input type="text" id="usergender" class="form-control" name="usergender" value="${obj.usergender}" style="color:#fff;background-color:#000; opacity:15%;" readonly /></li>
										<br />
										
										<li><i class="icofont-check-circled"></i>E-MAIL<input id="text" class="form-control" name="useremail" value="${obj.useremail}" style="color:#fff;background-color:#000; opacity:15%;" readonly /></li>
										<br />
										
										<li><i class="icofont-check-circled"></i>JOIN DATE<c:set var="dt" value="${fn:split(obj.joindate, ' ')}" />
										<input id="text" class="form-control" name="joindate" value="${dt[0]}" readonly style="color:#fff;background-color:#000; opacity:15%;" /></li>
										<br />
										</ul>
							
											<hr />
											
											<a href="${pageContext.request.contextPath}/member/p_update" class="btn btn-danger " style="background-color:#ffff; color:#ff0000;">비밀번호 변경</a>
											<a href="${pageContext.request.contextPath}/member/update" class="btn btn-danger " style="background-color:#ff0000;">내 정보 수정</a>
											

								</form>

						
								</td>
							</tr>							
						</tbody>
					</table>
				</div>
	
					
			
		</div>

		
	
		
	
	</div>

	</section>


    <%@include file="/WEB-INF/views/footer.jsp" %>
  




</body>
</html>