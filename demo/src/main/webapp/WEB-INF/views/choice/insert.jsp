<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인생영화 등록</title>
</head>
<body>  CHOICE_CATEGORY,  CHOICE_CODE, CHOICE_ID
	<form action="${pageContext.request.contextPath}/choice/insert" method="post">
		영화제목 : <input type ="text" name="movie_title" /> <br />	
				<input type="hidden" name="choice_code" value="${movie_code}"/>
		관람 횟수: <input type ="text" name="choice_freq" /> <br />	
		인생영화 선택 이유 : <textarea id="content" name="choice_reason" placeholder="내용을 입력하세요."></textarea><br />
						<input type="checkbox" name="choice_category" value="영상미" />영상미
						<input type="checkbox" name="choice_category" value="스토리" />스토리
						<input type="checkbox" name="choice_category" value="연기" />연기
						<input type="checkbox" name="choice_category" value="음악" />음악
						<input type="checkbox" name="choice_category" value="기타" />기타						
		<input type="hidden" name="choice_id" value="${userid}" readonly/>
		<input type ="submit" value="등록" />
		<a href="/choice/list">목록</a>
	</form>
</body>

<!-- 모달창에서 검색(ajax 이용)후 값을 가지고 돌아오게



<label>
<div id="check"><input type="checkbox" name="chkbox1" value="로맨스" style="margin-right:5px;">로맨스</div>
<div id="close"><a href="javascript:closePop1();">닫기 X</a></div>
</label>



Trigger the modal with a button
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" 

data-target="#myModal">영화 검색</button>

<!-- Modal 
<div id="myModal" class="modal fade" role="dialog"> // fade는 투명 효과
  <div class="modal-dialog">

    <!-- Modal content
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">x</button>
        <h4 class="modal-title">영화 검색</h4>
      </div>
      <div class="modal-body">
        <input type="text" class="form-control" placeholder="영화 제목을 입력하세요"/>
        <button type="button" class="btn btn-classic search_btn">검색</button>
        	여기에 검색 내용 불러와서 선택하게!
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary">등록</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>

  </div>
</div>
<!--  
data-target속성, data-toggle속성 : 버튼 태그의 경우 필수 속성
data-toggle : 모달창 오픈
data-target : 모달의 id에 집중하게 함
data-target의 value : 버튼 클릭 시 모달로 띄우고자 하는 id값을 #을 붙여서 연결
data-toggle의 value : 모달기능을 수행함을 의미
data-dismiss : 모달을 닫게하는 기능
data-backdrop="static" : 배경을 클릭해도 모달이 닫히지 않게 함 

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript">
	 $(function() {
         $('.search_btn').click(function () {
             $.ajax({
                 url: "/choice/insert",
                 type: "POST",
                 data: {
                     "srch_gst_nm": encodeURIComponent($("#srch_gst_nm").val()),
                     "csrf_tk_nm": getCookie('csrf_ck_nm')
                 },
                 dataType: "html",
                 complete: function(xhr, textStatus) {
                     if (textStatus == 'success') {
                         if (xhr.responseText == 1000) {
                             alert('댓글 내용을 입력하세요.');
                         } else if (xhr.responseText == 2000) {
                             alert('다시 입력하세요.');
                         } else if (xhr.responseText == 9000) {
                             alert('로그인해야 합니다.');
                         } else {
                             //alert(xhr.responseText);
                             $("#list_table").html(xhr.responseText);
                         }
                     }
                 }
             });
         });
     });
     
     //main.php  부모창에서 레이어팝업에서의 값 반영
     function closeWin(gst_no, gst_nm) {
      document.getElementById("gst_no").value=gst_no;
      document.getElementById("gst_nm").value=gst_nm; 
         $('#modalclose').trigger('click');
     }
	</script> -->
</html>