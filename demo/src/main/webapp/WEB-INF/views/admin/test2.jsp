<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매량 보기</title>
<%@include file="/WEB-INF/views/head.jsp"%>
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css"
	rel="stylesheet" />

<!-- 참고 : https://c3js.org/ -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.3/c3.min.css"
	rel="stylesheet" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.9.7/d3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.3/c3.min.js"></script>
</head>

<body>

<button type="button" class="btn btn-danger contact" id='tmp' data-toggle="modal" data-target="#exampleModal">문의하기</button>
	<div class="container">
		
	</div>
	 <!-- modal --> 
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel" style="font-family:'YDHB';">문의하기</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" style="font-family:aCinemaL;">
	     <h4>chart 표시</h4>
		<div class="chart1"></div>
	      </div>	      
	    </div>
	  </div>
	</div>
	<script type="text/javascript">
		//$(function(){
			//수정 버튼이 클릭되면
			let chart
			$('#tmp').click(function(){
				//class가 modal인 것을 찾아서 화면에 표시
				console.log('click')
				$.get('/rest/itemorder.json', function(data) {
					var cnt = data.x.length; //배열의 개수 구하기
					var member = [];
					var choice =[];
					const x = [];
					for (var i = 0; i < cnt; i++) {
						x.push(data.x[i])
						
					}
					for (var i = 0; i < cnt; i++) {
						member.push([data.member[i] ])
						
					}
					for (var i = 0; i < cnt; i++) {
						choice.push([data.choice[i] ])
						
					}
					console.log(x.toString().split(','));
	
					console.log(member);
					console.log(choice);
					chart = c3.generate({
						bindto : '.chart1',
						data : {
							    x : 'year',
								columns : [
										['year',...x ],
										['member', ...member],
										['choice', ...choice]
									]
					
	
						},
						axis: {
			                x: {
			                    type: 'category',
			                    
			                },
						}
					});

					$('#exampleModal').modal('show');
					setTimeout(()=>{
						console.log('이벤트')
						chart.resize();
					},500)
					
				}, 'json');
			})
			/* $('#exampleModal').on('shown.bs.modal', function (e) {
				console.log('이벤트')
			    chart.resize();
			}); */
				
				
			//}
		//)		
	</script>
	
	<script type="text/javascript">
		$(function() {
			

			//setTimeout  => 1번만
			//setInterval = > 주기적으로
			//	setInterval(function() {
			//	//restcontroller를 호출해서 값을 받음
			//$.get('/rest/itemorder.json', function(data) {

			//{"ret":"fefefefefefe", "Abc":12, "def":"asdf"}
			//		var tmp = eval(data.ret); //string을 object로 바꿔야함
			//	console.log(data.ret)
			//	console.log(typeof (tmp)) //string ->//

			//					chart.load({
			//					columns : [ tmp ]
			//			});
			//
			//			}, 'json');
			//
			//		}, 3000); //1초 단위로 동작함.

		});
	</script>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>