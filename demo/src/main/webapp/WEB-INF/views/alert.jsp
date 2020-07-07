<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<html> 

<body> 
<script type="text/javascript"> 
    //alert('${msg}' );

    
    
swal({
  title: '로그인 정보를 다시 입력해주세요.',
  text: "",
  icon: 'error',
  showCancelButton: false,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33'
}).then((result) => {
    window.location.href="${pageContext.request.contextPath}/member/login" ;
   
  
})

    
     
    //jquery
    //window.location.href = '${url}'; 
</script>
</body>
</html> 