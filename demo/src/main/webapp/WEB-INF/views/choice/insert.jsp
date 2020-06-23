<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security" uri= "http://www.springframework.org/security/tags" %>    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인생영화 등록</title>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet"/>
</head>
<body>
<div>
<form action="${pageContext.request.contextPath}/choice/insert" method="get">
			<security:authentication property="name" />님의 인생영화를 등록하세요!<br />
			<input type ="text" name="text" placeholder="영화 제목을 입력하세요."/>
			<input type ="submit" value="검색" />			
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
				
	</form>
	</div>
	<div>
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

