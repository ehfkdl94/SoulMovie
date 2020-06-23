<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<!DOCTYPE html>
<html lang="en">

<head> 
  <title>My Soul Movie</title> 
  <%@include file="/WEB-INF/views/head.jsp" %>
  
</head>

<body>
<%@include file="/WEB-INF/views/header.jsp" %>
  <section>
<div class="container" style="margin-top:100px;"> 
		<h4><security:authentication property="name" />님의 인생영화 목록입니다!<br /></h4>
		<a href="${pageContext.request.contextPath}/choice/insert">나의 인생영화 등록</a>
		<table class="table">
			<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan="5"><security:authentication property="name" />님의 인생 영화를 공유해주세요!</td>
				</tr>
			</c:if>
			<c:if test="${!empty list}">
				<c:forEach var="tmp" items="${list}">
				<tr>
					<td colspan="2" class="tdchoiceno"> ${tmp.choice_no}</td>
				</tr>
				<tr>
					<td rowspan="6"><img src="${pageContext.request.contextPath}/choice/getimg?no=${tmp.choice_code}" style="height:500px;"></td>
					<td>영화제목: ${tmp.movie_title}</td>
				</tr>
				<tr>
					<td>관람횟수: ${tmp.choice_freq}</td>
				</tr>
				<tr>
					<td>인생 영화 선정 이유: ${fn:replace(tmp.choice_reason, newLineChar, "<br />")}</td>
				</tr>
				<tr>
					<td>${tmp.choice_category}</td>
				</tr>
				<tr>
					<td><c:set var="dt" value="${fn:split(tmp.choice_date, ' ')}" />
						등록일: ${dt[0]}</td>
				</tr>
				<tr>
					<td><a href="${pageContext.request.contextPath}/choice/update?no=${tmp.choice_no}" class="btn btn-primary update">수정</a>
						<a href="#" class="btn btn-danger delete">삭제</a>
						</td>
				</tr>			
				</c:forEach>
				</c:if>							
			</tbody>
		</table>
	</div>
	</section>
	
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript">
		//jquery 라이브러리 사용 시작
		$(function(){			
			$('.delete').click(function(){
				var idx = $(this).index('.delete');
				var no = $('.tdchoiceno').eq(idx).text();

				Swal.fire({
					title: '삭제확인',
					text: "삭제하시겠습니까?",
					icon: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: '확인',
					cancelButtonText: '취소'
				}).then((result) => {
					if (result.value) {
						window.location.href="/choice/delete?no=" + no;
					}
				});
			});
		}); 
		// jquery라이브러리 사용 종료
	</script>	
	  

	<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>