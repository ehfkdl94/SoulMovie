<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>    
 
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Soul Movie</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath}/resources/day/assets/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath}/resources/day/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/day/assets/vendor/aos/aos.css" rel="stylesheet">
  
  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/day/assets/css/style.css" rel="stylesheet">

  <link href="${pageContext.request.contextPath}/resources/css/style1.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Day - v2.1.0
  * Template URL: https://bootstrapmade.com/day-multipurpose-html-template-for-free/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
<header id="header" class="fixed-top " style="background:rgba(0, 0, 0, 0.9);">
   <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="index.html"><img src="${pageContext.request.contextPath}/resources/day/assets/img/logo4.png" alt=""></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li><a href="${pageContext.request.contextPath}/">Home</a></li>
          <li><a href="${pageContext.request.contextPath}/movie/movielist">Movie</a></li>
          <li><a href="${pageContext.request.contextPath}/board/list">board</a></li>
          <li><a href="${pageContext.request.contextPath}/">Contact</a></li>
          <security:authorize access="!isAuthenticated()">
          	<li><a href="${pageContext.request.contextPath}/">help</a></li>
          	<li><a href="${pageContext.request.contextPath}/member/login">login</a></li>
          	<li><a href="${pageContext.request.contextPath}/member/join" style = "font-weight: bold ;color:#ff0000;">Create an account</a></li>
          </security:authorize>
          <security:authorize access="isAuthenticated()">
          	<li><a href="${pageContext.request.contextPath}/member/mypage?username=<security:authentication property="name"/>">My page</a></li>
          	<li><a href="${pageContext.request.contextPath}/member/logout">logout</a></li>
          </security:authorize>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->
  
  <div class="col-lg-6" style="margin-top:100px;">
  	<form action="${pageContext.request.contextPath}/choice/insert" method="get" class="php-email-form">
            <security:authentication property="name" />님의 인생영화를 등록하세요!<br />			
              <div class="form-row">
                <div class="col-md-12 form-group">
                <input type ="text" name="text" class="form-control" placeholder="영화 제목을 입력하세요."/>
				<input type ="submit" value="검색" />	
                <div class="validate"></div>
                </div>                
              </div>              
              <div class="form-group">
                <table>
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
							<td><input type="checkbox" name="chk" value="${tmp.movie_code}" /></td>			
							<td>영화코드</td>
							<td>${tmp.movie_code}</td>				
						</tr>
						<tr>			
							<td>영화제목</td>
							<td>${tmp.movie_title}</td>				
						</tr>
						<tr>			
							<td>개봉날짜</td>
							<td><c:set var="dt" value="${fn:split(tmp.movie_date, ' ')}" />
								${dt[0]}
							</td>				
						</tr>
					</c:forEach>
					</c:if>				
					</c:if>
					</tbody>
				</table>
				<a href="/choice/moviecode?chk=${chk}"><input type="submit" value="선택"/></a>
                <div class="validate"></div>
              </div>              
   </form>
</div>

	
<!--  
	<div>
	<div class="col-lg-6" style="margin-top:100px;">
            <form action="${pageContext.request.contextPath}/choice/insert" method="get" class="php-email-form">
              <div class="form-row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                  <div class="validate"></div>
                </div>
                <div class="col-md-6 form-group">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                  <div class="validate"></div>
                </div>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <textarea class="form-control" name="message" rows="5" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                <div class="validate"></div>
              </div>
              <div class="mb-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>
              <div class="text-center"><button type="submit">Send Message</button></div>
            </form>
          </div> -->	
	
	<form action="${pageContext.request.contextPath}/choice/insert" method="post">
		<input type="hidden" name="choice_code" value="${choice_code}" readonly/><br />			
			영화제목 : ${movie_title} <br />					
			관람 횟수: <input type ="text" name="choice_freq" /> <br />	
			인생영화 선택 이유 : <br />
		<textarea rows="6" id="content" name="choice_reason" placeholder="내용을 입력하세요." id="reason" onKeyUp="javascript:fnChkByte(this,'150')"></textarea>
		<span id="byteInfo">0</span> 150bytes<br />
							<input type="checkbox" name="choice_category" value="영상미" />영상미
							<input type="checkbox" name="choice_category" value="스토리" />스토리
							<input type="checkbox" name="choice_category" value="연기" />연기
							<input type="checkbox" name="choice_category" value="음악" />음악
							<input type="checkbox" name="choice_category" value="기타" />기타<br />					
			<input type="hidden" name="choice_id" value="${choice_id}" readonly/>
			<input type ="submit" value="등록" />
			<button type="button" class="close">닫기</button>
		</form>
	</div>
	
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
	
	<script type="text/javascript">
	
	function fnChkByte(obj, maxByte)
	{
	    var str = obj.value;
	    var str_len = str.length;
	    var rbyte = 0;
	    var rlen = 0;
	    var one_char = "";
	    var str2 = "";

	    for(var i=0; i<str_len; i++)
	    {
	        one_char = str.charAt(i);
	        if(escape(one_char).length > 4)
	        {
	            rbyte += 2;                                         //한글2Byte
	        }else
	        {
	            rbyte++;                                            //영문 등 나머지 1Byte
	        }

	        if(rbyte <= maxByte)
	        {
	            rlen = i+1;                                          //return할 문자열 갯수
	        }
	     }

	     if(rbyte > maxByte)
	     {
	  // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
	  alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
	  str2 = str.substr(0,rlen);                                  //문자열 자르기
	  obj.value = str2;
	  fnChkByte(obj, maxByte);
	     }else
	     {
	        document.getElementById('byteInfo').innerText = rbyte;
	     }
	}

	</script>
	
<!-- 	
	<div class="modal" id ="myModal" tabindex="-1" role="dialog">
  		<div class="modal-dialog">    
    		<div class="modal-content">
      			<div class="modal-header">
        			<button type="button" class="close" data-dismiss="modal" aria-label="Close">x</button>
        			<h4 class="modal-title">영화 검색</h4>
      			</div>
      			<div class="modal-body">
        			모달테스트
     			 </div>
	      		<div class="modal-footer">
	      			<button type="button" class="btn btn-primary" id ="moviechoice">등록</button>
	        		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	     		</div>
    		</div>
  		</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min2.js" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript">
	 $(function(){
		 $('#searchmovie').click(function(){
				$('#myModal')..modal('show');
				$('#moviechoice').click(function () {
		             var mcode = $('.chk').val();
		             var data = 'chk=' + mcode;
		             $.ajax({
		                 url: "/choice/insert",
		                 type: "POST",
		                 data: data,
		                 dataType: "text",
		                 error : function(){
		                     alert('등록실패');
		                 },
		                 success : function(data){
		                     alert('등록');                     
		                 }     
		             })
		             .done(function() { alert("성공"); });            
		         });
			});
	});
	  -->
</body>
</html>

