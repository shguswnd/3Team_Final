<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en-US" dir="ltr" style="-height-screen: 1185px;">
<head>
	<link href="${path}/resources/user/css/myinfo.css" rel="stylesheet" /> 
	<link href="https://webfontworld.github.io/nyj/NYJGothic.css" rel="stylesheet">
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
		crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
    <!-- 파비콘 -->
    <link rel="icon" href="${path}/resources/admin/img/loca3.png" /> 
    <!-- Google tag (gtag.js) -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-R3NH3D2T1E"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'G-R3NH3D2T1E');
	</script>
<title>내 정보</title>
<meta data-n-head="ssr" charset="utf-8">

<body class=" ">
	

	<%
		pageContext.include("/WEB-INF/views/include/header.jsp");
	%>

	
		<div class="loading-block">
			<div id="loading-screen" class="inner-overlay overlay-black"
				style="display: none;">
				<div class="inner-overlay-content">
					<div class="spinner" data-v-e045c1ca="">
						<div class="rect1" data-v-e045c1ca=""></div>
						<div class="rect2" data-v-e045c1ca=""></div>
						<div class="rect3" data-v-e045c1ca=""></div>
						<div class="rect4" data-v-e045c1ca=""></div>
						<div class="rect5" data-v-e045c1ca=""></div>
					</div>
				</div>
			</div>
		</div>
		<div id="__layout">
			<div class="position-relative tunnel-layout" data-v-55ac5990="">
				<div data-v-55ac5990="" class="content-row account-container">
					<div class="mt-md-5 mt-3 content">
						<div class="wrap">
							<div class="row">
								<div class="col-md-8 col-lg-9 col-12 mx-auto account desktop">
									<h3 class="page-title color-nanny-dark">내 정보 👤</h3>

									<form name="myinfo" action="${path}/userUpdate" method="post"
										enctype="multipart/form-data" autocomplete="off">
										<div class="row">
											<div class="col-md-12 col-lg-8">
												<div class="row">
													<div class="col-md-6 pr-md-1">
														<label class="form-label">성</label> <input name="first_name"
															type="text" aria-describedby="first_name"
															class="form-style" value=${users.first_name}>
														<div class="text-left" style="display: none;">
														</div>
													</div>
													<div class="col-md-6 pl-md-1 mt-2 mt-md-0">
														<label class="form-label">이름</label> <input
															name="last_name" type="text" aria-describedby="last_name"
															class="form-style" value=${users.last_name}>
														<div class="text-left" style="display: none;">
														</div>
													</div>
													<div class="col-md-12 mt-2">
														<p>예약시 예약자 명에 입력하신 성과 이름으로 표시가 됩니다.</p>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12 form-item">
														<label for="email" class="form-label" >이메일 주소</label> <input
															id="email" name="userid " type="email"
															aria-describedby="email" class="form-style" value=${users.userid} readonly>
													</div>
													<div class="col-md-12 mt-2">
														<p>이메일은 수정이 불가능합니다.</p>
													</div>

													<div class="row">
													<div class="col-md-6 pr-md-1">
														<label class="form-label">새 비밀번호</label> <input name="userpwd"
															type="text" aria-describedby="userpwd"
															class="form-style">
														<div class="text-left" style="display: none;">
														</div>
													</div>
													<div class="col-md-6 pl-md-1 mt-2 mt-md-0">
														<label class="form-label">새 비밀번호 확인</label> <input
															name="userpwd2" type="text" aria-describedby="userpwd2"
															class="form-style">
														<div class="text-left" style="display: none;">
														</div>
													</div>
												</div>
													<!-- 
													<div class="col-md-5 form-item">
														<label for="formFileLg" class="form-label">프로필 사진</label>
														<input class="form-control form-control-lg" name="file"
															id="formFileLg" type="file">
														<br>
													</div>
													 -->
												</div>
											</div>
											<div class="col-md-12 col-lg-4 mt-3 mt-md-0">
												<aside>
													<div class="right-account-container card-rework">
														<p class="title">내 정보가 제3자와 공유되나요?</p>
														<p class="info-content">Hands free는 예약이 확정된 후에만 귀하가
															선택한 보관소에게 귀하의 세부 정보를 전달합니다.</p>
													</div>
												</aside>
											</div>
											<div class="col-12 form-item">
												<button type="submit" id="submit" class="nanny-button rework" onclick="checkPwd()">
													저장 
												</button>
											</div>
							
										</div>
									</form>
									
									<form name="userDelete" action="${path}/userDelete"
										method="post">
									
											<button type="submit" id="submit" class="nanny-button2 rework">
												회원 탈퇴</button>
										
									</form>
							</div>
							</div>
						</div>
					</div>					
				</div>
			</div>

		<iframe name="_hjRemoteVarsFrame" title="_hjRemoteVarsFrame"
		tabindex="-1" aria-hidden="true" id="_hjRemoteVarsFrame"
		src="https://vars.hotjar.com/box-e031119f9e9e307a08fa610f85dbfb52.html"
		style="display: none !important; width: 1px !important; height: 1px !important; opacity: 0 !important; pointer-events: none !important;"></iframe>
</body>
​
</html>