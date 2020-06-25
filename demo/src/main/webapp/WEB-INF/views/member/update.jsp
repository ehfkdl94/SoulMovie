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
<%@include file="/WEB-INF/views/header.jsp" %>



      <section id="cta" class="cta" style="height:400px;" >
            <div class="container" data-aos="zoom-in">
                 <div class="text-center">
                    <br />
                    <br />
                    <br />
                      <h3>MY Info</h3>          
                 </div>
            </div>
         
       </section>
       

         
    <%@include file="/WEB-INF/views/sidebar.jsp" %>
    
    
    
<section style="margin-top:20px;margin-left:200px;">

 <div class="hs-item" style="height:1200px;">
    
   <div class="container" style="margin-top:90px;"> 
      <div class="section-title">
          <span style="margin-right:100px;">SoulMovie</span>
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
                        	
                              <li>ID : <input type="text" class="form-control" name="username" value="${obj.username}" style="color:#000;"readonly /></li>
                              <br />
                              <li>PASSWORD : <input type="password" class="form-control" name="password" value="${obj.password}" placeholder="**********" style="color:#848484;"  /></li>
                              <br />
                              
                     
                              <li>NAME : <input id="text" class="form-control" name="userrname" value="${obj.userrname}" style="color:#000;" readonly/></li>
                              <br />
                              
                              
                              
                              
                              <li>NICKNAME : <input id="text" class="form-control" name="usernick" value="${obj.usernick}" style="color:#848484;"></li>
                                  <p id="chk2" style="padding:18px;margin:0px; font-size:16px; color:#ff0000">중복확인</p>
                              <br />
                           
                           
                           
                           
                           
                                 <li><label for="userage" >AGE : </label>
                                    <select name= "userage" style="color:#848484;">
                                          <option id="userage" value="10대">10-19</option>
                                          <option id="userage" value="20대">20-29</option>
                                          <option id="userage" value="30대">30-39</option>
                                          <option id="userage" value="40대">40-49</option>
                                          <option id="userage" value="50대">50-59</option>
                                          <option id="userage" value="60대이상">60 over</option>
                                    </select></li>
                                    <br />
                                            
                              <li>GENDER : <input type="text" class="form-control" name="usergender" value="${obj.usergender}" style="color:#000;" readonly /></li>
                              <br />
                              
                              <li>E-MAIL : <input id="text" class="form-control" name="useremail" value="${obj.useremail}" style="color:#848484;" /></li>
                              <br />
                              
                              <li>JOIN DATE : <c:set var="dt" value="${fn:split(obj.joindate, ' ')}" />
                                       <input id="text" class="form-control" name="joindate" value="${dt[0]}" style="color:#000;" readonly /></li>
                                    
                              
                              <hr />
                              <input type="submit" class="btn btn-danger " style="background-color:#ff0000;" value="저장" />
                     

				             </form>
				                        
				                        
				                        		               
				               
				               		<script type="text/javascript" 
						src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
					
					
				 		<script>


                              $(function(){
                                 //nickname이 usernick인 tag의 키보드가 up되면
                                 $('#usernick').bind('keyup',function(){
                                    var unick = $('#usernick').val(); //입력했던 값을 받아와서 unick변수에 보관
                           
                                    //restcontroller를 호출해서 값을 받아옴
                                    $.get('/member/rest/membernickcheck.json?usernick=' + unick,function(data){
                                       console.log("GET", data);
                                       //console.log("GET", data);  {"ret":1}  or {"ret":0}
                                       if(data.ret == 1){
                                          $('#chk2').text('이미 사용 중인 닉네임입니다.');
                                       }
                                       else if(data.ret == 0){
                                          $('#chk2').text('사용가능');
                                       }
                                    }, 'json');
                                    
           
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