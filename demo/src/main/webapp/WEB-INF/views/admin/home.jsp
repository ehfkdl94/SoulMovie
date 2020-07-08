<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.0.1">
    <title>Soul Movie Admin Page</title>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.3/c3.min.css"
	rel="stylesheet" />
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.9.7/d3.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.3/c3.min.js"></script>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/cover/">
	<link href="${pageContext.request.contextPath}/resources/day/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .modal {
        text-align: center;
}
 
.modal-dialog.modal-fullsize {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}
.modal-content.modal-fullsize {
  height: auto;
  min-height: 100%;
  border-radius: 0; 
}



    </style>
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/cover.css" rel="stylesheet">
  </head>
  <body>
    <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
  <header class="masthead mb-auto">
    <div class="inner">
      <a href="${pageContext.request.contextPath}/admin/home"><img src="${pageContext.request.contextPath}/resources/img/logo4.png" alt=""></a>
      <nav class="nav nav-masthead justify-content-center">
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/home">Home</a>
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/member">Member</a>
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/movie">Movie</a>
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/board">Board</a>
        <a class="nav-link" href="${pageContext.request.contextPath}/admin/contact">Contact</a>
      </nav>
    </div>
  </header>

  <main role="main" class="inner cover text-center">
    <h1 class="cover-heading">Soul Movie</h1>
    <p class="lead">Admin Page</p>
    <button type="button" class="btn btn-danger contact" id='tmp' data-toggle="modal" data-target="#exampleModal">일자별 현황</button>
    <!-- modal --> 
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content"  ">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel" style="font-family:'YDHB'; color:black;">차트</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" style="font-family:aCinemaL; color:black;">
	     <h4>가입일자별 멤버/리뷰 현황</h4>
		<div class="chart1"></div>
	      </div>	      
	    </div>
	  </div>
	</div>
	<!-- modal end -->
	<script type="text/javascript">
		//$(function(){
			//수정 버튼이 클릭되면
			let chart
			$('#tmp').click(function(){
				//class가 modal인 것을 찾아서 화면에 표시
				console.log('click')
				$.get('${pageContext.request.contextPath}/rest/itemorder.json', function(data) {
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
  </main>

  <footer class="mastfoot mt-auto text-center">
    <div class="inner">
      <p>Cover template for <a href="https://getbootstrap.com/">Bootstrap</a>, by <a href="https://twitter.com/mdo">@mdo</a>.</p>
    </div>
  </footer>
</div>
<!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath}/resources/day/assets/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/day/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/day/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/day/assets/vendor/php-email-form/validate.js"></script>
  <script src="${pageContext.request.contextPath}/resources/day/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/day/assets/vendor/venobox/venobox.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/day/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/day/assets/vendor/aos/aos.js"></script>
</body>
</html>
