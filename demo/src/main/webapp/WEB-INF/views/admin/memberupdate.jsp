<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
  </head>
  <body>
    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
  <header class="masthead mb-auto">
    <div class="inner">
      <img src="${pageContext.request.contextPath}/resources/img/logo4.png" alt="">
      <nav class="nav nav-masthead justify-content-center">
        <a class="nav-link active" href="#">Home</a>
        <a class="nav-link" href="/admin/member">Member</a>
        <a class="nav-link" href="/admin/movie">Movie</a>
        <a class="nav-link" href="/admin/board">Board</a>
      </nav>
    </div>
  </header>

  <main role="main" class="inner cover text-center">
  	 <div class="hero-slider owl-carousel">
            <div class="hs-item" style="height: 800px;">
      <!-- Wrapper -->
         <div id="wrapper">


            <!-- Main -->
               <div id="main">
               
               <article id="elements">
                        <h2 class="major">Join</h2>
                        
                        
                           <h3 class="major">Form</h3>
                           <form action= "${pageContext.request.contextPath}/member/join" method="post">
                              <!--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
                              <div class="fields">
                                 <div class="field half">
                                    <label for="username">ID</label>
                                    <input type="text" name="username" id="username" value="${obj.username}" placeholder="ID" />
                                 </div>
                                 <div class="field half">
                                    <label for="password">PASSWORD</label>
                                    <input type="password" name="password" id="password" value="${obj.password}" placeholder="password" />
                                 </div>
                                 <div class="field half">
                                    <label for="userrname">NAME</label>
                                    <input type="text" name="userrname" id="userrname" value="${obj.userrname}" placeholder="name" />
                                 </div>
                                 
                                 

                                 
                              
                                 
                                 <div class="field half">
                                    <label for="usergender">GENDER</label>
                                        <select name= "usergender">
                                          <option id="demo-priority-male" value="male">MALE</option>
                                          <option id="demo-priority-female" value="female">FEMALE</option>
                                  
                                    </select>
                                 </div>
                                 
                                 
                                 
                                 
                                 
                                 
                                 <div class="field half">
                                    <label for="usernick">NICKNAME</label>
                                    <input type="text" name="usernick" id="usernick" value="${obj.usernick}" placeholder="nickname">
                                 </div>


                                 
                                 <div class="field half">
                                    <label for="userage">AGE</label>
                                    <select name= "userage">
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
                                       <input type="text" name="useremail" id="useremail" value="${obj.useremail}" placeholder="e-mail">
                                    </div>
                                    
                                          
                              </div>
                              <ul class="actions">
                                 <li><input type="submit" value="JOIN IN" class="primary"></li>
                                 <li><input type="reset" value="RESET"></li>
                              </ul>
                           </form>
               
                   

                     </article>
				</div>
               </div>
               </div>
               </div>
  </main>

  
</div>
</body>
</html>
