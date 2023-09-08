<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 경고창 이쁜거 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-R3NH3D2T1E"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-R3NH3D2T1E');
</script>

</head>
</html>
<%
  String msg = (String)request.getAttribute("msg");
  String url = (String)request.getAttribute("url");
  String icon = (String)request.getAttribute("icon");
  
  if(msg != null && url != null){
%>

<script>
   Swal.fire({
         title: '알림',
         text: '<%= msg %>',
         icon: '<%=icon%>'}).then(function(){
      location.href='<%=url%>';
   });
   
</script>
<%     
  }
%>