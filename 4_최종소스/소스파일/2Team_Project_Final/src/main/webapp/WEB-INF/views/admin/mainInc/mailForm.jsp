<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Hands Free 점주님 페이지</title>
<!-- 파비콘 -->
<link rel="icon" href="${path}/resources/admin/img/crown.png" />
<!-- 4.6 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<!-- 구글 폰트 JalpullineunHaru -->
<link
	href="https://webfontworld.github.io/Jalpullineun/JalpullineunHaru.css"
	rel="stylesheet" />
<!-- CSS -->
<link href="${path}/resources/admin/css/mdb.min.css" rel="stylesheet" />
<link href="${path}/resources/admin/css/admin.css" rel="stylesheet" />

<!-- Jquery & Ajax -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-R3NH3D2T1E"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-R3NH3D2T1E');
</script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			$('#emailBtn').click(function(){
				var formData = new FormData($('#fileForm')[0]);
				$.ajax({
					type: "post",
					enctype: 'multipart/form-data', //필수
					processData: false,
 				    contentType: false,
 				    data: formData,
 				    url : "mailForm",
 				    cache: false,
					success : function(data){
						swal("", "메일이 발송 되었습니다.", "success");
					},
					error: function(request, status, error){
	     			      //alert("loading error:" + request.status);
	     			      console.log("code : " +  request.statusText  + "\r\nmessage : " + request.responseText);
	     			   
	     			 }
				});
	
				$('#joinSubmit').attr("disabled",false);
			});
			
			
			/* 비동기로 메일 수신인 추가 */
			$('#addMail').click(function(){
				const box = this.parentElement.parentElement;  
				const newP = document.createElement("tr");
				newP.innerHTML = "<tr class='form-group'><td></td><td><input type='text' class='form-control' name='toMail' ></td><td><input type='button' id='removeBtn' class='form-control' value='삭제' ></td></tr>";
				box.parentNode.insertBefore(newP, box.nextSibling);
			});
			
			$('#addccMail').click(function(){
				const box = this.parentElement.parentElement;  
				const newP = document.createElement("tr");
				newP.innerHTML = "<tr class='form-group'><td></td><td><input type='text' class='form-control' name='toMail' ></td><td><input type='button' id='removeBtn' class='form-control' value='삭제'></td></tr>";
				box.parentNode.insertBefore(newP, box.nextSibling);
			});
			
			$(document).on("click","#removeBtn", function(){
				$(this).parent().parent().remove();
				console.log($(this).parent());
			})
			$('#removeBtn').click(function(){
				alert("asd");
				console.log($(this));
				$(this).removeChild;
			});
			
			
			
		});
	</script>

</head>
<body>
	<!--Main Navigation-->
	<header> <!-- 좌측 사이드바 --> <!-- Sidebar --> <nav
		id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white">
	<div class="position-sticky">

		<!-- data-toggle="pill"  -->

		<div class="list-group list-group-flush mx-2 mt-4">
			<a href="javascript:;" onclick="location.href='/admin'"
				class="list-group-item list-group-item-action py-2 ripple"
				data-toggle="pill" aria-current="true"> <i
				class="fas fa-home fa-fw me-3"></i> <span>기본정보</span>
			</a> <a href="javascript:;" onclick="location.href='/admin/reserve'"
				class="list-group-item list-group-item-action py-2 ripple"
				data-toggle="pill"><i class="fas fa-tasks fa-fw me-3"></i><span>예약현황</span></a>
			<a href="javascript:;" onclick="location.href='/admin/chatting'"
				class="list-group-item list-group-item-action py-2 ripple"
				data-toggle="pill"><i class="fas fa-comments fa-fw me-3"></i><span>채팅관리</span></a>
			<a href="javascript:;" onclick="location.href='/admin/review'"
				class="list-group-item list-group-item-action py-2 ripple"
				data-toggle="pill"> <i class="fas fa-edit fa-fw me-3"></i><span>리뷰관리</span>
			</a> <a href="javascript:;" onclick="location.href='/admin/mail'"
				class="list-group-item list-group-item-action py-2 ripple active"
				data-toggle="pill"><i class="fas fa-envelope-square fa-fw me-3"></i><span>메일서비스</span></a>
			<a href="javascript:;" onclick="location.href='/admin/calendar'"
				class="list-group-item list-group-item-action py-2 ripple"
				data-toggle="pill"><i class="fas fa-calendar-alt fa-fw me-3"></i><span>일정관리</span></a>
			<a href="javascript:;" onclick="location.href='/admin/chart'"
				class="list-group-item list-group-item-action py-2 ripple"
				data-toggle="pill"><i class="fas fa-chart-bar fa-fw me-3"></i><span>통계</span></a>
		</div>
	</div>
	</nav> <!-- Sidebar --> <jsp:include
		page="/WEB-INF/views/admin/inc/header.jsp" /> <main
		style="margin-top: 58px">
	<div class="container pt-4">
		<section class="mb-4">
		<div class="card">
			<div class="card-header py-3">
				<h5 class="mb-0 text-left">
					<strong>[Hands Free] </strong>
				</h5>
				<br />
				<div style="color: #ff6e6e; font-size: x-small">*이 페이지는 메일서비스를
					볼 수 있는 페이지 입니다.</div>
			</div>
			<div class="card-body">
				<br />
				<h2 style="text-align: center">메일보내기</h2>
				<br />
				<div class="container">
					<div style="width: 100%;">
						<form id="fileForm" action="" method="post"
							enctype="multipart/form-data">
							<!-- 인코딩 타입으로 이미지, 파일 서버로 전송할 경우 사용  -->
							<table>
								<tr id="box" class="form-group">
									<td>받는 사람</td>
									<td><input type="text" class="form-control" name="toMail" value="${reservation.userid}"
										placeholder="이메일 주소를 입력하세요" readonly></td>
									<td><input type="button" id="addMail"
										class="form-control btn-outline-primary" value="추가"></td>
								</tr>
								<tr id="box2" class="form-group">
									<td>참조 메일 주소</td>
									<td><input type="text" class="form-control" name="ccMail"
										placeholder="참조 수신인을 입력하세요"></td>
									<td><input type="button" id="addccMail"
										class="form-control btn-outline-primary" value="추가"></td>
								</tr>
								<tr class="form-group">
									<td>제목</td>
									<td><input type="text" class="form-control" name="title"
										placeholder="제목을 입력하세요"></td>
								</tr>
								<tr class="form-group">
									<td>내용</td>
									<td><textarea class="form-control" name="content"
											name="editor1" placeholder="보낼 내용을 입력하세요"> </textarea></td>
								</tr>
								<tr class="form-group">
									<td>첨부 파일</td>
									<td><input type="file" name="file" class="file-input" />
									</td>
								</tr>
							</table>
							<br>
							<button id="emailBtn" type="button"
								class="btn btn-default btn-info">발송</button>
						</form>
					</div>
				</div>
				<canvas class="my-4 w-100" height="30"></canvas>
			</div>
		</div>
		</section>
	</div>
	</main>
</body>

<!-- MDB -->
<script type="text/javascript"
	src="${path}/resources/admin/js/mdb.min.js"></script>
<!-- Custom scripts -->
<%-- <script type="text/javascript" src="${path}/resources/admin/js/admin.js"></script> --%>

</html>



