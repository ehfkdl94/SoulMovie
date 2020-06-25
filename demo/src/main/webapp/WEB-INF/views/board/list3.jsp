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
	 
 <%@include file="/WEB-INF/views/header.jsp" %>
 
	<section id="cta" class="cta2" style="height:400px;" >
      <div class="container" data-aos="zoom-in">
        <div class="text-center">
        <br />
        <br />
        <br />
          <h3 style="font-family:'PlayfairB';">MY SOUL BOARD</h3>          
          
         
       </div>
      </div>
      
    </section>
  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="rank" class="about">
			<div class="hs-item" style="height: 600px;">
				<div class="container" style="margin-top: 10px;">
					<h2 >Board list</h2><br/>
					
					<form action="${pageContext.request.contextPath}/board/list" method="get"  style="font-family:'aCinemaL';">
						<input type="hidden" name="page" value="1"/>
						<input type="text" name="text" placeholder="Please enter a search" style="float:left"/>
						<input type="submit" class="btn btn-sm btn-success" value="Search"/>
						<a href="${pageContext.request.contextPath}/board/insert" class="btn btn-sm btn-success">Write</a>
			 		</form>

					<table class="table table-sm" style="font-family:'aCinemaL';">
						<thead>
							<tr>
								<th>Num</th>
								<th>Subject</th>
								<th>Writer</th>
								<th>Views</th>
								<th>Date</th>
							</tr>
						</thead>

						<tbody>
							<c:if test="${empty list}">
								<tr>
									<td colspan="5">No results were found for your search.</td>
								</tr>
							</c:if>
							<c:if test="${!empty list}">
								<c:forEach var="tmp" items="${list}">
									<tr>
										<td>${tmp.ROWN}</td>
										<td><a
											href="/board/content?no=${tmp.brdno}&bno=${tmp.brdnumber}">${tmp.brdtitle}</a>
										</td>
										<td>${tmp.username}</td>
										<td><fmt:formatNumber value="${tmp.brdhit}"
												pattern="#,###" /></td>
										<td><c:set var="dt" value="${fn:split(tmp.brddate, ' ')}" />
											${dt[0]}</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<c:if test="${param.page != 1}">

				<a style="font-size: 20px; 
					href="${pageContext.request.contextPath}/admin/member?page=${param.page-1}&text=${param.text}"><<</a>
			</c:if>

			<c:forEach var="i" begin="1" end="${cnt}" step="1">
				<c:if test="${param.page == i}">
					<a class="active" style="font-size: 20px;"
						href="${pageContext.request.contextPath}/board/list?page=${i}&text=${param.text}">${i}</a>
				</c:if>
				<c:if test="${param.page != i}">
					<a style="font-size: 20px;"
						href="${pageContext.request.contextPath}/board/list?page=${i}&text=${param.text}">${i}</a>
				</c:if>
			</c:forEach>


			<c:if test="${cnt != param.page}">
				<a style="font-size: 20px;"
					href="${pageContext.request.contextPath}/board/list?page=${param.page+1}&text=${param.text}">>></a>
			</c:if>
				</div>
				
			</div>

			<!--  
			<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>
			-->
			

		</section>
   </main>
  <!-- ======= Footer ======= -->
  <%@include file="/WEB-INF/views/footer.jsp" %>

</body>

</html>