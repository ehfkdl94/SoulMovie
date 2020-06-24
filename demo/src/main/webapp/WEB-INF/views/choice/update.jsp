<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <%@include file="/WEB-INF/views/head.jsp"%>
  <title>Soul Movie</title>  
</head>

<body>
<%@include file="/WEB-INF/views/header.jsp"%>
<section id="cta" class="cta" style="height:400px;" >
      <div class="container" data-aos="zoom-in">
        <div class="text-center">
        <br />
        <br />
        <br />
          <h3>MY SOUL MOVIE</h3>                    
        </div>
      </div>
    </section>
  
   <%@include file="/WEB-INF/views/sidebar.jsp" %>
  <section style="margin-top:20px;"> 
 	 <div class="section-title">
          <span>SoulMovie</span>
          <h2>인생 영화를 수정합니다<br /></h2>
          <p></p>
      </div> 
  	<div class="col-lg-6" style="margin-top: 10px;">
		<form action="${pageContext.request.contextPath}/choice/insert"
			method="post" class="php-email-form">
			<input type="hidden" class="form-control" name="choice_no" value="${obj.choice_no}"/>
			<div class="form-row">
				<div class="col-md-6 form-group">
					영화제목 : <br /> ${movie_title} <br /> 
					
					<div class="validate"></div>
				</div>
				<div class="col-md-6 form-group">
					시청 횟수 : <input type="text" class="form-control" name="choice_freq" value="${obj.choice_freq}"/>	<br /> 
					<div class="validate"></div>
				</div>
			</div>
			
			<div class="form-group">
				인생 영화 선택 이유 : <br />
				<textarea class="form-control" rows="5" id="content"
					name="choice_reason" data-rule="required" data-msg="이유를 꼭 말해주세요"
					placeholder="${obj.choice_reason}" id="reason"
					onKeyUp="javascript:fnChkByte(this,'150')"></textarea>
				<span id="byteInfo">0</span> / 150bytes<br /> 
				
				<div class="validate"></div>
				<input type="checkbox" name="choice_category" value="영상미" />영상미
				 <input type="checkbox"	name="choice_category" value="스토리" />스토리 
				<input type="checkbox" name="choice_category" value="연기" />연기 
				<input type="checkbox" name="choice_category" value="음악" />음악 
				<input type="checkbox" name="choice_category" value="기타" />기타<br />
				<hr />
			</div>
			<div class="mb-3">
				<div class="loading">Loading</div>
				<div class="error-message"></div>
				<div class="sent-message">인생영화가 수정되었습니다. Thank you!</div>
			</div>
			<div class="text-center">
				<button type="submit">저장</button>
			</div>
		</form>
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