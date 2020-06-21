<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 수정</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"	rel="stylesheet"/>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>	
</head>
<body>
	<div class="container">
		<form action="${pageContext.request.contextPath}/board/update" method="post"  enctype="multipart/form-data">
			<input type="text" class="form-control" name="brdno" value="${vo.brdno}" readonly />
			<input type="text" class="form-control" name="brdtitle" value="${vo.brdtitle}" />
			<textarea id="content" class="form-control" name="brdcontent">${vo.brdcontent}</textarea>
			<input type="text" class="form-control" name="brdid" value="${vo.brdid}" readonly />
			<img style="cursor:pointer;" id="imgpreview" src="${pageContext.request.contextPath}/board/getimg?no=${vo.brdno}" width="100px" height="100px" />
			<input type="file" name="img" id="img" style="display:none;"/>
			<hr />
			<input type="submit" class="btn btn-success" value="글수정 " />
			<a href="${pageContext.request.contextPath}/board/list" class="btn btn-success">글목록</a>
		</form>
	</div>
	
	<script>
		$(function(){ //jQuery 문법 상용

			$('#imgpreview').click(function(){
				$('#img').click();
			})
			
			//태그중에서 id="img" 인것을 찾아 변경이 되면 반응
			$('#img').on('change', function(){
				var img = this; //읽은 이미지를 img변수에 보관함
				if(img.files && img.files[0]) { //img변수에 이미지가 있다면
					var reader = new FileReader();
					reader.onload = function(e){
						//이미지를 읽어서 id="imgpreview" 인곳의 src를 읽은 이미지로 변경
						$('#imgpreview').attr('src', e.target.result);
					}
					reader.readAsDataURL(img.files[0]);
				}
			});

	
			
		}) //jquer문법 종료
	</script>
</body>
</html>
