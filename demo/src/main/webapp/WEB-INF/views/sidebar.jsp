<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<aside>
<div id="wrapper" class="active" style="font-family:'PlayfairB';">
     
      <div id="sidebar-wrapper">
      <ul id="sidebar_menu" class="sidebar-nav" style="font-family:'PlayfairB';">
           <li class="sidebar-brand"><a id="menu-toggle" href="#">Menu<span id="main_icon" class="glyphicon glyphicon-align-justify"></span></a></li>
      </ul>
        <ul id="sidebar" class="sidebar-nav" style="font-family:'PlayfairB';">     
          <li><a href="${pageContext.request.contextPath}/member/mypage">My Info<span class="sub_icon glyphicon glyphicon-link"></span></a></li>
          <li><a href="${pageContext.request.contextPath}/choice/list">My SoulMovie<span class="sub_icon glyphicon glyphicon-link"></span></a></li>
        </ul>
      </div>           
 </div>
 </aside>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript">
	$(function(){			
		$("#menu-toggle").click(function(e) {
	        e.preventDefault();
	        $("#wrapper").toggleClass("active");
		});
	}); 
	</script>
