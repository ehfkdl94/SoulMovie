<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>



<!DOCTYPE html>
<html lang="en">
<head>

   <title>update</title>
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

 <div class="hs-item" style="height:1200px;">
    
   <div class="container" style="margin-top:90px;"> 
      <div class="section-title">
          <span style="margin-right:100px;">Information</span>
          <h2 style="margin-right:100px;">정보 수정<br /></h2>
          <p></p>
      </div>   
      
          <div class="row" style="margin-left:200px;" >            
   
               
            <div class="col-lg-8 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right" style="font-family:aCinemaL;">
               <table style="word-break:break-all;" class="table">
                  <tbody>
                     <tr>               
                        <td>
                        <form action="${pageContext.request.contextPath}/member/update" method="post" enctype="multipart/form-data">
                        	<ul>
                              <li><i class="icofont-check-circled"></i>ID<input id="username" type="text" class="form-control" name="username" value="${obj.username}" style="color:#000;"readonly /></li>
                              <br />
                              
                      
                              
                     
                              <li><i class="icofont-check-circled"></i>NAME<input id="userrname" class="form-control" name="userrname" value="${obj.userrname}" style="color:#000;" readonly/></li>
                              <br />
                              
                              
                              
                              
                              <li><i class="icofont-check-circled"></i>NICKNAME<input id="usernick" class="form-control" name="usernick" value="${obj.usernick}" style="color:#000; background-color:#fff; border-color:#ff0000;"></li>
                                  <p id="chk" style="color:#ff0000;"></p>
                                  <br />
                          
                           
                           
                           
                           
                           
                                 <li><i class="icofont-check-circled"></i><label for="userage" >AGE</label><br />
                                    <select name= "userage" style="color:#000; border-color:#ff0000;">
                                          <option id="userage" value="10대">10-19</option>
                                          <option id="userage" value="20대">20-29</option>
                                          <option id="userage" value="30대">30-39</option>
                                          <option id="userage" value="40대">40-49</option>
                                          <option id="userage" value="50대">50-59</option>
                                          <option id="userage" value="60대이상">60 over</option>
                                    </select></li>
                                    <br />
                                            
                                            
                                            
                                            
                              <li><i class="icofont-check-circled"></i><label for="usergender" >GENDER</label><br />
                           		            
		                        <label><input type="radio" name= "usergender" id="usergender" value="Male" checked>Male &nbsp; &nbsp;</label>
		                        <label><input type="radio" name= "usergender" id="usergender" value="Female">Female</label>
		                        </li>
		                        
		                        
		                        <!-- 
                              <input type="text" class="form-control" name="usergender" value="${obj.usergender}" style="color:#000;" readonly />
                               -->
                              <br />
                              
     
        
                              
                              
                              <li><i class="icofont-check-circled"></i>E-MAIL<input type="email" id="usereamil" class="form-control" name="useremail" value="${obj.useremail}" style="color:#000; border-color:#ff0000;" /></li>
                              <br />
                              
                              <li><i class="icofont-check-circled"></i>JOIN DATE<c:set var="dt" value="${fn:split(obj.joindate, ' ')}" />
                                       <input id="text" class="form-control" name="joindate" value="${dt[0]}" style="color:#000;" readonly /></li>
                                    
                              
                              <hr />
                               <input type="submit" class="btn btn-danger " style="background-color:#ff0000;" value="저장" />
                     
								</ul>
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
												$('#chk').text('이미 사용 중인 닉네임입니다.');
											}
											else if(data.ret == 0){
												$('#chk').text('사용가능');
											}
										}, 'json');
										}
									else{
										$('#chk').text('닉네임을 두 글자 이상으로 설정해 주세요.');
										}
								
						
								
								/*
								$.post('/rest/memberidcheck.json', {id:'a'}, function(data){
									console.log("POST", data);
								}, 'json');
								*/
							});
						});

                       
                           
  
              
     				 </script>
				                        </td>
				                     </tr>                     
				                  </tbody>
				                  
				                  
				                  
				               </table>
		
				            </div>

				      </div>
				

				   </div>
				 </div>
   </section>


    <%@include file="/WEB-INF/views/footer.jsp" %>
  


</body>
</html>