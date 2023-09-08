<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-R3NH3D2T1E"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-R3NH3D2T1E');
</script>

<c:set var="path" value="${pageContext.request.contextPath}"/>


<!-- 헤더 -->
<!-- Navbar -->
<nav id="main-navbar"
   class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
   <!-- Container wrapper -->
   <div class="container-fluid">
      <!-- Toggle button -->
      <button class="navbar-toggler" type="button"
         data-mdb-toggle="collapse" data-mdb-target="#sidebarMenu"
         aria-controls="sidebarMenu" aria-expanded="false"
         aria-label="Toggle navigation">
         <i class="fas fa-bars"></i>
      </button>


      <!-- Brand -->
      <a class="navbar-brand" href="/admin"> <img
         src="${path}/resources/admin/img/logo6.png" height="30" /> 
      </a>

      <!-- Right links -->
      <ul class="navbar-nav ms-auto d-flex flex-row">
         <!-- 사용자페이지 이동 -->
         <li class="nav-item"><a class="nav-link me-3 me-lg-0" href="${path}/" style="color: cornflowerblue;">메인홈페이지</a>
         </li>

         <!-- [이름] 점주님 -->
          <se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')" >
         <li class="nav-item dropdown"><a
            class="nav-link dropdown-toggle hidden-arrow d-flex align-items-center"
            href="#" id="navbarDropdownMenuLink" role="button" 
            data-mdb-toggle="dropdown" aria-expanded="false">
                [<se:authentication property="name"/>]</a>
            <ul class="dropdown-menu dropdown-menu-end"
               aria-labelledby="navbarDropdownMenuLink">
               <li><a class="dropdown-item" href="/users/userDetail">마이페이지</a></li>
               <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
            </ul></li>
            </se:authorize>
      </ul>
   </div>
   <!-- Container wrapper -->
</nav>
<!-- Navbar -->
</header>
<!--Main Navigation-->