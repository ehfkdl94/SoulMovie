<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
</head>

<body>
	<form action= "${pageContext.request.contextPath}/member/join" method="post">
                              <!--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> -->
                              <div class="fields">
                                 <div class="field half">
                                    <label for="username">ID</label>
                                    <input type="text" style="color:#ffffff" name="username" id="username" value="" placeholder="ID" /><p id="chk"></p>
                                    <input type="button" id="btn" value="중복확인" />
                        
                                 </div>
                                 <br />
                                 <div class="field half">
                                    <label for="password">PASSWORD</label>
                                    <input type="password" style="color:#ffffff" name="password" id="password" value="" placeholder="password" />
                                 </div>
                                 <div class="field half">
                                    <label for="userrname">NAME</label>
                                    <input type="text" style="color:#ffffff" name="userrname" id="userrname" value="" placeholder="name" />
                                 </div>
                                 
                                 

                                 
                              
                                 
                                 <div class="field half">
                                    <label for="usergender" >GENDER</label>
                                        <select name= "usergender" style="color:#ffffff" >
                                          <option id="demo-priority-male" value="male">MALE</option>
                                          <option id="demo-priority-female" value="female">FEMALE</option>
                                  
                                    </select>
                                 </div>
                                 
                                 
                                 
                                 
                                 
                                 
                                 <div class="field half">
                                    <label for="usernick">NICKNAME</label>
                                    <input type="text" style="color:#ffffff" name="usernick" id="usernick" value="" placeholder="nickname" /><p id="chk2"></p>
                                    
                                 </div>


                                 
                                 <div class="field half" >
                                    <label for="userage">AGE</label>
                                    <select name= "userage" style="color:#ffffff">
                                          <option id="userage" value="10대">10-19</option>
                                          <option id="userage" value="20대">20-29</option>
                                          <option id="userage" value="30대">30-39</option>
                                          <option id="userage" value="40대">40-49</option>
                                          <option id="userage" value="50대">50-59</option>
                                          <option id="userage" value="60대이상">60 over</option>
                                    </select>
                                 </div>
                              

                                    <div class="field">
                                       <label for="useremail">E-MAIL</label>
                                       <input type="email" style="color:#ffffff" name="useremail" id="useremail" value="" placeholder="e-mail">
                                    </div>
                                    
                                          
                              </div>
                              <ul class="actions">
                                 <li><input type="submit" value="JOIN IN" class="primary"></li>
                                 <li><input type="reset" value="RESET"></li>
                              </ul>
                              

                
                </form>
	
	
	
	
	<script type="text/javascript" 
		src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
	<script>


	

				$(function(){
					//id가 userid인 tag의 키보드가 up되면
					$('#usernick').bind('keyup',function(){
						var unick = $('#usernick').val(); //입력했던 값을 받아와서 uid변수에 보관
			
						//restcontroller를 호출해서 값을 받아옴
						$.get('/member/rest/membernickcheck.json?usernick=' + unick,function(data){
							console.log("GET", data);
							//console.log("GET", data);  {"ret":1}  or {"ret":0}
							if(data.ret == 1){
								$('#chk2').text('중복된 닉네임이 있습니다.');
							}
							else if(data.ret == 0){
								$('#chk2').text('사용가능');
							}
						}, 'json');
						
						/*
						$.post('/rest/memberidcheck.json', {id:'a'}, function(data){
							console.log("POST", data);
						}, 'json');
						*/
					});
				});
			





	
		$(function(){
			//id가 userid인 tag의 키보드가 up되면
			$('#btn').bind('click',function(){
				var uid = $('#username').val(); //입력했던 값을 받아와서 uid변수에 보관

				if (uid.length >= 2){
				//restcontroller를 호출해서 값을 받아옴
				$.get('/member/rest/memberidcheck.json?username=' + uid,function(data){
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