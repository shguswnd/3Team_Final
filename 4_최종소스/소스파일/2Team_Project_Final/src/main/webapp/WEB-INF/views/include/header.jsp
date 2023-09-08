<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

 <link rel="icon" type="image/x-icon" href="${path}/resources/user/assets/favicon.ico" />
 <!-- Bootstrap icons-->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Google fonts-->
<link href="https://webfontworld.github.io/nyj/NYJGothic.css" rel="stylesheet">

<!-- Core theme CSS (includes Bootstrap)-->
 <link href="${path}/resources/user/css/header.css" rel="stylesheet" />
 <!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-R3NH3D2T1E"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-R3NH3D2T1E');
</script>
<body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm" id="mainNav">
            <div class="container px-5">
                <a class="navbar-brand fw-bold" href="/"><img
         src="${path}/resources/user/assets/img/userlogo.png" height="35px" width="150px"/></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="bi-list"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto me-4 my-3 my-lg-0">
                    </ul>
                    
                    
                   <se:authorize access="!hasRole('ROLE_USER')"> 
                   <button class="btn rounded-pill  px-3 mb-2 mb-lg-0" style="background-color: #2937F0; color:white;" onclick="location.href='/users/login'">
						<span class="d-flex align-items-center"> 
							<span class="small">로그인</span>
						</span>
					</button>
					</se:authorize>
					
						
					<se:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_USER')" ><!-- if문 -->
					<div class="dropdown" >
					  <button class="btn dropdown-toggle" style="background-color: #2937F0; color:white;" type="button" id="dropdownMenu2" data-bs-toggle="dropdown" aria-expanded="false">
					    <se:authentication property="name"/>
					  </button>
					  <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
					    <li><button class="dropdown-item" type="button" onclick="location.href='/users/userDetail'" >내 정보</button></li>
					    <li><button class="dropdown-item" type="button" onclick="location.href='/users/myreserve'">예약 내역</button></li>
					    <li><button class="dropdown-item" type="button" onclick="location.href='/logout'">로그아웃</button></li>
					  </ul>
					</div>
					</se:authorize>
					
					<se:authorize access="!hasRole('ROLE_USER')">		
					<button class="btn rounded-pill px-3 mb-2 mb-lg-0" style="background-color: #2937F0; color:white;" onclick="location.href='/users/register'">
						<span class="d-flex align-items-center"> 
							<span class="small">회원가입</span>
						</span>
					</button>
					</se:authorize>
					
                </div>
            </div>
        </nav>

