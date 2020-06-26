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
          	<li><a href="${pageContext.request.contextPath}/choice/list" style = "font-weight: bold ;color:#ff0000;">+ SoulMovie</a></li>
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
          <h3 style="font-family:'PlayfairB';">MY SOUL MOVIE LIST</h3>          
          
          <c:if test="${userccnt<10}">
          <a class="cta-btn" href="${pageContext.request.contextPath}/choice/insert" style="font-family:aCinemaL;">나의 인생영화 등록</a>
        </c:if>
        <c:if test="${userccnt>=10}">
          <a class="cta-btn check"  style="font-family:aCinemaL;">나의 인생영화 등록</a>
        </c:if>
        </div>
      </div>
      
    </section>
    
 	<%@include file="/WEB-INF/views/sidebar.jsp" %>
 	
 	<section id="about" class="about" style="margin-top:20px;margin-left:200px;">	
 	
	<div class="container"> 
	<div class="section-title" style="font-family:'GothicB';">
          <span>SoulMovie</span>
          <h2>${user_nick}님의 인생영화입니다<br /></h2>          
      </div>	
		 <div class="row" >				
			<c:if test="${empty list}">
				<div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left">
					<table>
						<tbody>
							<tr>
								<td><h5 style="font-family:aCinemaL;">${user_nick}님의 인생 영화를 공유해주세요!</h5></td>
							</tr>
						</tbody>
					</table>
				</div>
			</c:if>
			<c:if test="${!empty list}">
				<c:forEach var="tmp" items="${list}">				
				<div class="col-lg-12 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right">
					<table style="word-break:break-all" class="table">
						<tbody>
							<tr>
								<td colspan="2" class="tdchoiceno" style="display:none;"> ${tmp.choice_no}</td>
							</tr>
							<tr>								
								<td rowspan="6" style=" width:350px;" align="center"><img src="${tmp.movie_img}" ></td>					
								<td><ul style="font-family:aCinemaL;">
								<li><i class="icofont-check-circled"></i>영화제목: ${tmp.movie_title}</li>
								<li><i class="icofont-check-circled"></i>관람횟수: ${tmp.choice_freq}</li>
								<li><i class="icofont-check-circled"></i>인생 영화 선정 이유: ${fn:replace(tmp.choice_reason, newLineChar, "<br />")}</li>
								<li><i class="icofont-check-circled"></i>카테고리: ${tmp.choice_category}</li>
								<li><i class="icofont-check-circled"></i><c:set var="dt" value="${fn:split(tmp.choice_date, ' ')}" />
									등록일: ${dt[0]}</li>
								<li><a href="${pageContext.request.contextPath}/choice/update?no=${tmp.choice_no}" class="btn btn-dark update">수정</a>
								<a href="#" class="btn btn-danger delete" style="background-color:#ff0000">삭제</a></li>
								</ul>
								</td>
							</tr>							
						</tbody>
					</table>
				</div>
			</c:forEach>
			</c:if>							
			
		</div>
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
						window.location.href="${pageContext.request.contextPath}/choice/delete?no=" + no;
					}
				});
			});			
		}); 
		// jquery라이브러리 사용 종료
	</script>	
	<script type="text/javascript">
		//jquery 라이브러리 사용 시작
		$(function(){			
			$('.check').click(function(){
				Swal.fire({
					title: '10개까지 등록 가능합니다.',
					icon: 'info',
					showCancelButton: false,
					confirmButtonColor: '#3085d6',
					cancelButtonColor: '#d33',
					confirmButtonText: '확인',
					
				}).then((result) => {
					if (result.value) {
						
					}
				});
			});			
		}); 
		// jquery라이브러리 사용 종료
	</script>	
	  

	<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>