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
	<div class="container" style="margin-top:100px;"> 
		<div class="section-title">
          <span>SoulMovie</span>
          <h2 style="font-family:'GothicB'; font-style:oblique;">${user_nick}'s Info<br /></h2>
          <p></p>
      </div>	
      
      		 <div class="row" >				
	
					
				<div class="col-lg-12 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right">
					<table style="word-break:break-all" class="table">
						<tbody>
							<tr>					
								<td><ul style="font-family:aCinemaL">
								<form action="${pageContext.request.contextPath}/member/update" method="post" enctype="multipart/form-data">
										ID : <input type="text" class="form-control" name="username" value="${obj.username}" readonly />
										PASSWORD : <input type="password" class="form-control" name="password" value="" placeholder="**********" readonly />
										NAME : <input id="text" class="form-control" name="userrname" value="${obj.userrname}" readonly />
										NICKNAME : <input id="text" class="form-control" name="usernick" value="${obj.usernick}" readonly />
									
							            AGE : <input id="text" class="form-control" name="usernick" value="${obj.userage}" readonly />
							                       
										GENDER : <input type="text" class="form-control" name="usergender" value="${obj.usergender}" readonly />
										
										E-MAIL : <input id="text" class="form-control" name="useremail" value="${obj.useremail}" readonly />
										
										JOIN DATE : <c:set var="dt" value="${fn:split(obj.joindate, ' ')}" />
													<input id="text" class="form-control" name="joindate" value="${dt[0]}" readonly />
										
											<hr />
											
											<a href="${pageContext.request.contextPath}/member/update" class="btn btn-danger " style="background-color:#ff0000;">Update</a>
									

								</form>

								</ul>
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