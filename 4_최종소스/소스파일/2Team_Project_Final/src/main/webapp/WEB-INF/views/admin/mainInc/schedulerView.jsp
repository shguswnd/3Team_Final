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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

</head>
<script type="text/javascript">
	$(document).ready(function(){
		$(document).on("click", "#removeBtn" ,function(){
			swal({
				text: "강제로 스케줄링 돌리실껀가요?",
				buttons: ["취소", "확인"],
				closeOnClickOutside : false
			}).then(function(value){
				if(value){
					$.ajax({
						url : "/OracleData/scheduler",
						type : "GET",
						success : function(data){
						     $("tbody").empty();
						        // 새로운 내용 그리기
						        $.each(data, function(index, list) {
						            $("tbody").append(
						                '<tr>' +
						                '<td style="vertical-align: middle;">' + list.user_name + '</td>' +
						                '<td style="vertical-align: middle;">' + list.user_content + '</td>' +
						                '<td style="vertical-align: middle;">' + list.user_date + '</td>' +
						                '<td style="vertical-align: middle;">' + list.user_grade + '</td>' +
						                '</tr>'
						            );
						        });
						},
						error:function (request, status, error){
			                   console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
			            }
					});
				}
			})
			
		})
		
	})
</script>
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
				class="list-group-item list-group-item-action py-2 ripple"
				data-toggle="pill"><i class="fas fa-envelope-square fa-fw me-3"></i><span>메일서비스</span></a>
			<a href="javascript:;" onclick="location.href='/admin/calendar'"
				class="list-group-item list-group-item-action py-2 ripple"
				data-toggle="pill"><i class="fas fa-calendar-alt fa-fw me-3"></i><span>일정관리</span></a>
			<a href="javascript:;" onclick="location.href='/admin/chart'"
				class="list-group-item list-group-item-action py-2 ripple"
				data-toggle="pill"><i class="fas fa-chart-bar fa-fw me-3"></i><span>통계</span></a>
			<a href="javascript:;" onclick="location.href='/OracleData/schedulerView'"
				class="list-group-item list-group-item-action py-2 ripple active"
				data-toggle="pill"><i class="fas fa-clock fa-fw me-3"></i><span>삭제 리뷰관리</span></a>
		</div>
	</div>
	</nav> <!-- Sidebar --> <jsp:include
		page="/WEB-INF/views/admin/inc/header.jsp" /> <!--Main layout--> <main
		style="margin-top: 58px">
	<div class="container pt-4">
		<section class="mb-4">
		<div class="card">
			<div class="card-header py-3">
				<h5 class="mb-0 text-left">
					<strong>[Hands Free] ${storeName}</strong>
				</h5>
				<br />
				<div style="color: #ff6e6e; font-size: x-small">*이 페이지는 삭제된 리뷰를 관리하는 페이지 입니다.
				<br/>
				(삭제된 리뷰는 매일 자정 0시 완전 삭제 처리됩니다.)</div>
			</div>
			<div class="card-body">
				<br />
				<h2 style="text-align: center">삭제된 리뷰</h2>
				<br />
				<p style="text-align: right">
					<button id ="removeBtn" class="btn btn-outline-primary">즉시 삭제</button>
				</p>
				<table class="table table" style="text-align: center">
					<thead class="table-primary">
						<tr>
							<tr>
								<td>작성자</td>
								<td>리뷰내용</td>
								<td>리뷰날짜</td>
								<td>평점</td>
							</tr>
						</tr>
					</thead>


					<tbody style="text-align: center;">
						<c:forEach var="list" items="${list}"
							varStatus="status">
							<tr>
								<td style="vertical-align: middle;">${list.user_name}</td>
								<td style="vertical-align: middle;">${list.user_content}</td>
								<td style="vertical-align: middle;">${list.user_date}</td>
								<td style="vertical-align: middle;">${list.user_grade}</td>
							</tr>
						</c:forEach>


					</tbody>
				</table>

				<nav aria-label="..." style="text-align: center">
				<ul class="pagination">
				</ul>
				</nav>



				<canvas class="my-4 w-100" height="30"></canvas>
			</div>
		</div>
		</section>
	</div>
	</main> <!--Main layout-->
</body>

<!-- MDB -->
<script type="text/javascript"
	src="${path}/resources/admin/js/mdb.min.js"></script>
<!-- Custom scripts -->
<%-- <script type="text/javascript" src="${path}/resources/admin/js/admin.js"></script> --%>
</html>



