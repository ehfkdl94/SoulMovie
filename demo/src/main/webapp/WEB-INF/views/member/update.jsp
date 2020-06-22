<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>update</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css"  rel="stylesheet"/>
</head>
<body>

	<div class="container"> 
	
	<form action="${pageContext.request.contextPath}/member/update" method="post" enctype="multipart/form-data">
			ID : <input type="text" class="form-control" name="username" value="${obj.username}" readonly />
			
			<!-- PASSWORD : <input type="password" class="form-control" name="password" value="${obj.password}"  /> -->
			
			NAME : <input id="text" class="form-control" name="userrname" value="${obj.userrname}" readonly/>
			NICKNAME : <input id="text" class="form-control" name="usernick" value="${obj.usernick}" />
		
            <label for="userage">AGE</label>
               <select name= "userage">
                     <option id="userage" value="10대">10-19</option>
                     <option id="userage" value="20대">20-29</option>
                     <option id="userage" value="30대">30-39</option>
                     <option id="userage" value="40대">40-49</option>
                     <option id="userage" value="50대">50-59</option>
                     <option id="userage" value="60대이상">60 over</option>
               </select>
               <br />
                       
			GENDER : <input type="text" class="form-control" name="usergender" value="${obj.usergender}" readonly />
			E-MAIL : <input id="text" class="form-control" name="useremail" value="${obj.useremail}" />
			
			JOIN DATE : <c:set var="dt" value="${fn:split(obj.joindate, ' ')}" />
						<input id="text" class="form-control" name="joindate" value="${dt[0]}" readonly />
					
			
			<hr />
			<input type="submit" class="btn btn-success" value="save" />
		</form>
		

	
	
		
	
	</div>

</body>
</html>