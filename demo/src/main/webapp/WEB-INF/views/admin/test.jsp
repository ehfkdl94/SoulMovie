
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매량 보기</title>
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
	<div class="container">
		<h4>chart 표시</h4>
		<div class="chart1"></div>
	</div>

	<script type="text/javascript">
		$(function() {
			$.get('/rest/itemorder.json', function(data) {
				var cnt = data.ret.length; //배열의 개수 구하기
				var tmp = [];
				var tmp1 =[];
				var tmp3 = [];
				for (var i = 0; i < cnt; i++) {
					tmp3.push(data.ret[i].joindate.replace('/', '').replace('/', ''))
					
				}
				for (var i = 0; i < cnt; i++) {
					tmp.push([data.ret[i].count ])
					
				}
				for (var i = 0; i < cnt; i++) {
					tmp1.push([data.ret1[i].count ])
					
				}
				console.log(tmp3);
				var chart = c3.generate({
					bindto : '.chart1',
					data : {
						    x : 'tmp3',
							columns : [
									['tmp3', tmp3[0], tmp3[1], tmp3[2], tmp3[3]],
									['member', tmp[0], tmp[1], tmp[2], tmp[3]],
									['choice', tmp1[0], tmp1[1], tmp1[2], tmp1[3]]
								]
				

					},
				});
			}, 'json');

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
</body>
</html>