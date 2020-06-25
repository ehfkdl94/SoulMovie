<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="en">

<head>
<%@include file="/WEB-INF/views/head.jsp"%>
<title>Soul Movie Choice</title>

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
          <h3 style="font-family:'PlayfairB';">MY SOUL MOVIE</h3>           
        </div>
      </div>
    </section>
	
 <%@include file="/WEB-INF/views/sidebar.jsp" %>	
	<section id="contact" class="contact" style="margin-top:20px;margin-left:200px;">
      <div class="container">
     	 <div class="section-title">
          <span>SoulMovie</span>
          <h2>${ user_nick}
			님의 인생영화를 등록하세요!<br /></h2>
          <p></p>
        </div>
	<div class="col-lg-6" style="margin-top: 40px;margin-left:200px;">
		<form action="${pageContext.request.contextPath}/choice/insert"
			method="get" class="php-email-form2">
			
			<div class="form-row">
				<div class="col-md-12 form-group">
					<input type="text" name="text" 
						placeholder="영화 제목을 입력하세요." class="form-control" style="color:#000000;font-family:aCinemaL;"/> 						
					<div class="validate"></div>
				</div>
			<div class="text-right" style="font-family:aCinemaL;">
				<button class="btn btn-dark" type="submit">검색</button>
			</div>
			<div class="col-md-12 form-group">
				<table class="table" style="font-family:aCinemaL;">
					<tbody>
						<c:if test="${empty list}">
							<tr>
								<td colspan="5">검색결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${list eq '@@@@초기값'}">
						</c:if>
						<c:if test="${list ne '@@@@초기값'}">
							<c:if test="${!empty list}">
								<c:forEach var="tmp" items="${list}">
									<tr>
										<td rowspan="3"><input type="radio" name="chk"
											value="${tmp.movie_code}" /></td>
										<td rowspan="3" width="100px"><img src="${tmp.movie_img}" style="width:100px;"></td>
										<td width="90px">영화코드: </td>
										<td>${tmp.movie_code}</td>
									</tr>
									<tr>
										<td>영화제목: </td>
										<td>${tmp.movie_title}</td>
									</tr>
									<tr>
										<td>개봉날짜: </td>
										<td><c:set var="dt"
												value="${fn:split(tmp.movie_date, ' ')}" /> ${dt[0]}<br /></td>										
									</tr>								
								</c:forEach>
								<tr>									
								<td colspan="4"><input type="submit" class="btn btn-dark" value="선택" /></td>						
								</tr>
							</c:if>
						</c:if>
					</tbody>
				</table>
				<hr />
				</div>
				<div class="validate"></div>
			</div>			
		</form>
	</div>	

	<div class="col-lg-6" style="margin-top: 10px;margin-left:200px;">
			<c:if test="${!empty choice_code}">	
			<form action="${pageContext.request.contextPath}/choice/insert" method="post" >
				<input type="hidden" name="choice_code" value="${choice_code}" readonly /><br />
				<div class="form-row" style="font-family:aCinemaL;">
					<div class="col-md-6 form-group">
						영화제목 : <br /> ${movie_title} <br /> 					
						<div class="validate"></div>
					</div>
					<div class="col-md-6 form-group">
						관람 횟수: <input type="number" name="choice_freq" class="form-control" 
							style="color:#000000;" value="1"/> <br /> 						
						<div class="validate"></div>
					</div>
				</div>			
				<div class="form-group" style="font-family:aCinemaL;">
					<textarea class="form-control" rows="5" id="content"
						name="choice_reason" data-rule="required" data-msg="이유를 꼭 말해주세요"
						placeholder="내용을 입력하세요." id="reason"
						onKeyUp="javascript:fnChkByte(this,'150')" style="color:#000000;"></textarea>
					<div class="text-right">
						<span id="byteInfo">0</span> / 150bytes<br /> 
					</div>				
					<div class="validate"></div>
					<input type="checkbox" name="choice_category" value="영상미" checked />영상미
					<input type="checkbox"	name="choice_category" value="스토리" />스토리 
					<input type="checkbox" name="choice_category" value="연기" />연기 
					<input type="checkbox" name="choice_category" value="음악" />음악 
					<input type="checkbox" name="choice_category" value="기타" />기타<br />
					<input type="hidden" name="choice_id" value="${choice_id}" readonly />
				</div>			
				<div class="text-center" style="font-family:aCinemaL;">			
					<button class="btn btn-danger" type="submit" style="background-color:#ff0000;">등록</button>
				</div>
			</form>
			</c:if>			
			<div class="text-right" style="font-family:aCinemaL;">	
				<a href="${pageContext.request.contextPath}/choice/list" class="btn btn-secondary">뒤로</a>
			</div>	
		</div>
	</div>
    </section>	

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"
		type="text/javascript"></script>

	<script type="text/javascript">
		function fnChkByte(obj, maxByte) {
			var str = obj.value;
			var str_len = str.length;
			var rbyte = 0;
			var rlen = 0;
			var one_char = "";
			var str2 = "";

			for (var i = 0; i < str_len; i++) {
				one_char = str.charAt(i);
				if (escape(one_char).length > 4) {
					rbyte += 2; //한글2Byte
				} else {
					rbyte++; //영문 등 나머지 1Byte
				}

				if (rbyte <= maxByte) {
					rlen = i + 1; //return할 문자열 갯수
				}
			}

			if (rbyte > maxByte) {
				// alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
				alert("이유는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
				str2 = str.substr(0, rlen); //문자열 자르기
				obj.value = str2;
				fnChkByte(obj, maxByte);
			} else {
				document.getElementById('byteInfo').innerText = rbyte;
			}
		}		
	</script>
	
	<%@include file="/WEB-INF/views/footer.jsp"%>
	
</body>
</html>

