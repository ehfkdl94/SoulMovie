<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
		
		<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
		rel="stylesheet" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csslogin/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csslogin/noscript.css" />
	</head>
	
	<body class="is-preload">
	
	

			<div id="wrapper">
			
				<!-- Main -->
				
					<div id="main">

				<!-- Contact -->
					<article id="contact" class="active" style="">

							
						<h2 class="major">LOGIN</h2>
						<form action='${pageContext.request.contextPath}/loginProcess' method='POST' >
						
						  <div class="fields">
						 
							<div class="field">	
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							<label for="username">ID</label>
							<input type="text" class="form-control" id="username" name="username" placeholder="ID" >
							</div><br />
							<div class="field">
							<label for="password">PASSWORD</label>
							<input type="password" class="form-control" id="password" name="password" placeholder="Password" >
							</div>			
							 
							 
					      </div>
					      <br />
					    
					  
					     <ul class="actions">
							<li>
							<input type="submit" value="LOGIN" class="primary">
							</li>	
						 </ul>	
						 
					</form>
				 

	  				</article>
	  				  
	  				</div>
   
      </div>
      

      
	</body>
</html>
	  				



	

				
