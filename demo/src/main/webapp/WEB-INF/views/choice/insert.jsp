<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
 
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
		<button type="button" id="searchmovie" class="btn btn-primary">영화 검색</button><br />
			영화제목 : <input type="text" name="choice_code" value="${choice_code}" readonly/><br />
			관람 횟수: <input type ="text" name="choice_freq" /> <br />	
			인생영화 선택 이유 : <textarea id="content" name="choice_reason" placeholder="내용을 입력하세요."></textarea><br />
							<input type="checkbox" name="choice_category" value="영상미" />영상미
							<input type="checkbox" name="choice_category" value="스토리" />스토리
							<input type="checkbox" name="choice_category" value="연기" />연기
							<input type="checkbox" name="choice_category" value="음악" />음악
							<input type="checkbox" name="choice_category" value="기타" />기타<br />					
			작성자 :<input type="text" name="choice_id" value="${userid}" readonly/>
			<input type ="submit" value="등록" />
			<button type="button" class="close">닫기</button>
		</form>
	</div>
	
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
	</script>  -->
</body>
</html>

