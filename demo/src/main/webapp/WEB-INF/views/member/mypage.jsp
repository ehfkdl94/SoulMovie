<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>My page</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css"  rel="stylesheet"/>
</head>
<body>

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
			<a href="${pageContext.request.contextPath}/member/update" class="btn btn-success">update</a>
			<a href="${pageContext.request.contextPath}/choice/list" class="btn btn-success">choice list</a>

			
		</form>
		
	
		
	
	</div>






</body>
</html>