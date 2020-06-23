<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
</head>

<body>
	<form action="/member/join" method="post">
		아이디 : <input type="text" name="username" id="username" /><p id="chk">중복확인</p>
		<input type="button" id="btn" value="중복확인" />
		<br />
		암호 : <input type="password" name="password" /><br />
		이름 : <input type="text"  name="userrname"/><br />
		나이 : <input type="text"  name="userage"/><br />
		<input type="submit" value="회원가입" />
	</form>
	
	<script type="text/javascript" 
		src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
	<script>
		$(function(){
			//id가 userid인 tag의 키보드가 up되면
			$('#btn').bind('click',function(){
				var uid = $('#username').val(); //입력했던 값을 받아와서 uid변수에 보관

				if (uid.length >= 2){
				//restcontroller를 호출해서 값을 받아옴
				$.get('/member/rest/memberidcheck.json?id=' + uid,function(data){
					console.log("GET", data);
					//console.log("GET", data);  {"ret":1}  or {"ret":0}
					if(data.ret == 1){
						$('#chk').text('사용불가');
						alert('사용불가');
					}
					else if(data.ret == 0){
						$('#chk').text('사용가능');
						alert('사용가능');
					}
				}, 'json');
				}
				else{
					alert('아이디를 N자 이상으로 설정해주세요.');
					}
				
				/*
				$.post('/rest/memberidcheck.json', {id:'a'}, function(data){
					console.log("POST", data);
				}, 'json');
				*/
			});
		});
	</script>	
</body>
</html>