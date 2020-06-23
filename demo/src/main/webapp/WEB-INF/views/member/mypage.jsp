<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zxx">
<head>

  <%@include file="/WEB-INF/views/head.jsp" %>
  
</head>

<body>
<%@include file="/WEB-INF/views/header.jsp" %>
<section>
 <div class="hs-item" style="height:1200px;">
	<div class="container"> 
	
	
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
			<a href="${pageContext.request.contextPath}/member/update" class="btn btn-success">Update</a>
			<a href="${pageContext.request.contextPath}/choice/list" class="btn btn-success">My SoulMovie</a>

			
		</form>
		
	
		
	
	</div>
	</div>
	</section>
	
	<!--====== Javascripts & Jquery ======-->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/mixitup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script src="${pageContext.request.contextPath}resources/js/jsLogin/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}resources/js/jsLogin/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}resources/js/jsLogin/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}resources/js/jsLogin/util.js"></script>
	<script src="${pageContext.request.contextPath}resources/js/jsLogin/main.js"></script>
	<!-- Vendor JS Files -->
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-migrate.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/easing/easing.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/php-email-form/validate.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/isotope/isotope.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/aos/aos.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Main JS File -->
	<script src="${pageContext.request.contextPath}/resources/js/main2.js"></script>
	





</body>
</html>