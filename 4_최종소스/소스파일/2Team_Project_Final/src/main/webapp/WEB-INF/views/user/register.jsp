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
	<link href="https://webfontworld.github.io/nyj/NYJGothic.css" rel="stylesheet">
	<link href="https://webfontworld.github.io/nyj/NYJGothic.css" rel="stylesheet">
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="${path}/resources/user/css/user_main.css" rel="stylesheet" />
	<!-- Jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- Google tag (gtag.js) -->
		<script async src="https://www.googletagmanager.com/gtag/js?id=G-R3NH3D2T1E"></script>
		<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());
		
		  gtag('config', 'G-R3NH3D2T1E');
		</script>
	<script type="text/javascript">
		function activateTab(active_user) {
			let left = document.getElementById('leftTab');
			let right = document.getElementById('rightTab');
			if (active_user == 'left') {
				left.classList.add('active_user');
				right.classList.remove('active_user');
				$("#userRegister").show();
				$("#storeRegister").hide();
			} else {
				left.classList.remove('active_user');
				right.classList.add('active_user');
				$("#userRegister").hide();
				$("#storeRegister").show();
			}
		}
		
		function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("address").value = addr;
	            }
	        }).open();
	    }
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
			
				<form id="userRegister" action="/users/register" method="post" data-sb-form-api-token="API_TOKEN">
					<!-- 이메일 -->
					<div class="row" style="height:58px; padding: 0px;">
						<div class="col">
							<input style="height: 51px;" class="form-control" name="userid" id="email" type="email" placeholder="이메일" data-sb-validations="required,email" />
							<div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
							<div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
						</div>
					</div>
					
					<!-- 비밀번호 -->
					<div class="row" style="height: 58px; padding: 0px;">
						<div class="col">
							<input style="height: 51px;" class="form-control" name="userpwd" id="password" type="password"
							placeholder="비밀번호" data-sb-validations="required" /> 
							<label for="password"></label>
							<div class="invalid-feedback"
								data-sb-feedback="password:required">Password is required.</div>
						</div>
					</div>
					
					<!-- 비밀번호 확인 -->
					<div class="row" style="height: 58px; padding: 0px;">
						<div class="col">
							<input style="height: 51px;" class="form-control" id="confirmPassword" type="password"
							placeholder="비밀번호 확인" data-sb-validations="required" /> 
							<label for="password"></label>
							<div class="invalid-feedback"
								data-sb-feedback="password:required">Password is required.</div>
						</div>
					</div>
					
					<!-- 이름 -->
					<div class="row" style="height: 58px; padding: 0px;">
						<div class="col-6">
							<input style="height: 51px;" class="form-control" name="first_name" id="firstName" type="text"
							placeholder="성" data-sb-validations="required" />
						</div>
						<div class="col-6">
							<input style="height: 51px;" class="form-control" name="last_name" id="lastName" type="text"
							placeholder="이름" data-sb-validations="required" />
						</div>
					</div>
					
					<!-- 제출 버튼 -->
					<div class="d-grid" style="margin-top: 30px;">
						<button class="btn btn-primary rounded-pill btn-lg"
							id="submitButton" type="submit">회원가입</button>
					</div>
				</form>
				
				<!-- 점주 회원 가입 -->
				<form id="storeRegister" style="display: none;" action="${path}/admin/register" method="post" enctype="multipart/form-data" data-sb-form-api-token="API_TOKEN">
					<!-- 이메일 -->
					<div class="row" style="height:58px; padding: 0px;">
						<div class="col">
							<input style="height: 51px;" class="form-control" name="email" id="email" type="email" placeholder="이메일" data-sb-validations="required,email" />
							<div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
							<div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
						</div>
					</div>
					
					<!-- 비밀번호 -->
					<div class="row" style="height: 58px; padding: 0px;">
						<div class="col">
							<input style="height: 51px;" class="form-control" name="password" id="password" type="password"
							placeholder="비밀번호" data-sb-validations="required" /> 
							<label for="password"></label>
							<div class="invalid-feedback"
								data-sb-feedback="password:required">Password is required.</div>
						</div>
					</div>
					
					<!-- 비밀번호 확인 -->
					<div class="row" style="height: 58px; padding: 0px;">
						<div class="col">
							<input style="height: 51px;" class="form-control" id="password" type="password"
							placeholder="비밀번호 확인" data-sb-validations="required" /> 
							<label for="password"></label>
							<div class="invalid-feedback" data-sb-feedback="password:required">Password is required.</div>
						</div>
					</div>
					
					<!-- 이름 -->
					<div class="row" style="height: 58px; padding: 0px;">
						<div class="col-6">
							<input style="height: 51px;" class="form-control" name="lastName" id="name" type="text"
							placeholder="성" data-sb-validations="required" />
						</div>
						<div class="col-6">
							<input style="height: 51px;" class="form-control" name="firstName" id="name" type="text"
							placeholder="이름" data-sb-validations="required" />
						</div>
					</div>
					
					<!-- 주소 ==> 좌표 -->
					<div class="row" style="height: 58px; width: 526px; padding: 0px;">
						<div class="col-10">
							<input style="height: 51px;" readonly class="form-control" name="address" id="address" type="text" placeholder="주소" data-sb-validations="required" />
						</div>
						<div class="col-2">
							<button style="width: 80px; height: 50px; 
								    padding: 0px;" type="button" class="btn btn-primary btn-sm"
								    onclick="execDaumPostcode()">
								    주소찾기
							</button>
						</div>
					</div>
					
					<!-- 상호 -->
					<div class="row" style="height: 58px; padding: 0px;">
						<div class="col">
							<input style="height: 51px;" class="form-control" name="storeName" id="name" type="text" placeholder="상호명" data-sb-validations="required" />
							<!-- <label for="password">password</label> -->
							<!-- <div class="invalid-feedback" data-sb-feedback="password:required">Password is required.</div> -->
						</div>
					</div>
					
					<!-- 전화번호 -->
					<div class="row" style="height: 58px; padding: 0px;">
						<div class="col">
							<input style="height: 51px;" class="form-control" name="phone" id="phone" type="text" placeholder="전화번호" data-sb-validations="required" />
							<!-- <label for="password">password</label> -->
							<!-- <div class="invalid-feedback" data-sb-feedback="password:required">Password is required.</div> -->
						</div>
					</div>
					
					<!-- 파일 업로드 -->
					<div style="margin-top: 15px;">
					  <label for="formFileLg" class="form-label">개인사업등록증</label>
					  <input class="form-control form-control-lg" name="file" id="formFileLg" type="file">
					</div>
					
					<!-- 제출 버튼 -->
					<div class="d-grid" style="margin-top: 30px;">
						<button class="btn btn-primary rounded-pill btn-lg" id="submitButton" type="submit">회원가입</button>
					</div>
				</form>
			</div>
		</div>
	</header>

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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>
