<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>HandsFree main</title>
	<!-- 수정 부분 -->
    <link rel="icon" href="${path}/resources/admin/img/loca3.png" /> 
	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Google fonts-->
	<link rel="preconnect" href="https://fonts.gstatic.com" />
	<link href="https://fonts.googleapis.com/css2?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,400;1,400&amp;display=swap" rel="stylesheet" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="${path}/resources/user/css/user_main.css" rel="stylesheet" />
	<link href="https://webfontworld.github.io/nyj/NYJGothic.css" rel="stylesheet">
	<!-- Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<script type="text/javascript">
		function activateTab(active) {
			let left = document.getElementById('leftTab');
			let right = document.getElementById('rightTab');
			if (active == 'left') {
				left.classList.add('active_user');
				right.classList.remove('active_user');
				$("#loginForm").attr("action", "/login?type=default");
			} else {
				left.classList.remove('active_user');
				right.classList.add('active_user');
				$("#loginForm").attr("action", "/login");
			}
		}
	</script>
<!-- Google tag (gtag.js) -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=G-R3NH3D2T1E"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'G-R3NH3D2T1E');
</script>
</head>
<body id="page-top" class="masthead">
		
	<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>

	<!-- 메인 -->
	<header>
		
		<div style="width: 520px; margin: 0 auto">
		
			<nav class="nav nav-pills nav-justified">
			  <a id="leftTab" class="nav-link active_user" aria-current="page" onclick="activateTab('left')">일반회원</a>
			  <a id="rightTab" class="nav-link" aria-current="page" onclick="activateTab('right')">개인사업자</a>
			</nav>
			
			<br>
			
			<div id="form-box" class="container" style="padding: 0px;">
			
				<form id="loginForm" action="${path}/login?type=default" method="post" data-sb-form-api-token="API_TOKEN">
				
					<!-- 이메일 -->
					<div class="row" style="height:58px; padding: 0px;">
						<div class="col">
							<input style="height: 51px;" class="form-control" name="username" id="email" type="email" placeholder="이메일" data-sb-validations="required,email" />
							<div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
							<div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
						</div>
					</div>
					
					<!-- 비밀번호 -->
					<div class="row" style="height: 58px; padding: 0px;">
						<div class="col">
							<input style="height: 51px;" class="form-control" name="password" id="password" type="password" placeholder="비밀번호" data-sb-validations="required" /> 
							<!-- <label for="password">password</label> -->
							<div class="invalid-feedback" data-sb-feedback="password:required">Password is required.</div>
						</div>
					</div>
					
					<!-- 제출 버튼 -->
					<div class="d-grid" style="margin-top: 30px;">
						<button class="btn btn-primary rounded-pill btn-lg"
							id="submitButton" type="submit">로그인</button>
					</div>
					
				</form>
			</div>
		
		</div>
	</header>

	<!-- Footer-->
<!-- 	<footer class="bg-black text-center py-5">
		<div class="container px-5">
			<div class="text-white-50 small">
				<div class="mb-2">&copy; Enjo2 2023. All Rights Reserved.</div>
				<span class="mx-1">&middot;</span> <a href="#!">Git</a> <span
					class="mx-1">&middot;</span>
			</div>
		</div>
	</footer> -->

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="${path}/resources/user/js/scripts.js"></script>
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>