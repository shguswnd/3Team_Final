<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
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

<!-- 풀캘린더 -->
<link href="${path}/resources/fullCalendar/main.css" rel="stylesheet" />
<script src="${path}/resources/fullCalendar/main.js"></script>

<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-R3NH3D2T1E"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-R3NH3D2T1E');
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
				class="list-group-item list-group-item-action py-2 ripple"
				data-toggle="pill"><i class="fas fa-envelope-square fa-fw me-3"></i><span>메일서비스</span></a>
			<a href="javascript:;" onclick="location.href='/admin/calendar'"
				class="list-group-item list-group-item-action py-2 ripple active"
				data-toggle="pill"><i class="fas fa-calendar-alt fa-fw me-3"></i><span>일정관리</span></a>
			<a href="javascript:;" onclick="location.href='/admin/chart'"
				class="list-group-item list-group-item-action py-2 ripple"
				data-toggle="pill"><i class="fas fa-chart-bar fa-fw me-3"></i><span>통계</span></a>
			<a href="javascript:;" onclick="location.href='/OracleData/schedulerView'"
				class="list-group-item list-group-item-action py-2 ripple"
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
				<div style="color: #ff6e6e; font-size: x-small">*이 페이지는 일정관리를 볼 수 있는 페이지 입니다.</div>
			</div>
			<div class="card-body">
				<div id="calendar"></div>
				<canvas class="my-4 w-100" height="30"></canvas>
			</div>
		</div>
		</section>
	</div>
	</main>
</body>

<script>
  let calendarList = [];
  let calendar;
  function getCalendarList() {
    $.ajax({
      type: "GET",
      url: "/api/admin/calendar",
      async: false,
      success: function (response) {
        calendarList = response.list;
      },
      error: function (a, b, c) {
        console.log("실패!");
        console.log(a);
        console.log(b);
        console.log(c);
      },
    });
  }

  window.onload = function () {
    var calendarEl = document.getElementById("calendar");
    calendar = new FullCalendar.Calendar(calendarEl, {
      // Tool Bar 목록 document : https://fullcalendar.io/docs/toolbar
      headerToolbar: {
        left: "prevYear,prev,next,nextYear today",
        center: "title",
        right: "dayGridMonth,dayGridWeek,dayGridDay",
      },

      locale: "ko",
      selectable: true,
      selectMirror: true,

      navLinks: true, // can click day/week names to navigate views
      editable: false,
      // Create new event
      select: function (arg) {
        Swal.fire({
          html: "<div class='mb-7'>Create new event?</div><div class='fw-bold mb-5'>Event Name:</div><input type='text' class='form-control' name='event_name' />",
          icon: "info",
          showCancelButton: true,
          buttonsStyling: false,
          confirmButtonText: "Yes, create it!",
          cancelButtonText: "No, return",
          customClass: {
            confirmButton: "btn btn-primary",
            cancelButton: "btn btn-active-light",
          },
        }).then(function (result) {
          if (result.value) {
            var title = document.querySelector(
              "input[name=;event_name']"
            ).value;
            if (title) {
              calendar.addEvent({
                title: title,
                start: arg.start,
                end: arg.end,
                allDay: arg.allDay,
              });
            }
            calendar.unselect();
          } else if (result.dismiss === "cancel") {
            Swal.fire({
              text: "Event creation was declined!.",
              icon: "error",
              buttonsStyling: false,
              confirmButtonText: "Ok, got it!",
              customClass: {
                confirmButton: "btn btn-danger",
              },
            });
          }
        });
      },

      // Delete event
      eventClick: function (arg) {
        Swal.fire({
          text: "Are you sure you want to delete this event?",
          icon: "warning",
          showCancelButton: true,
          buttonsStyling: false,
          confirmButtonText: "Yes, delete it!",
          cancelButtonText: "No, return",
          customClass: {
            confirmButton: "btn btn-primary",
            cancelButton: "btn btn-active-light",
          },
        }).then(function (result) {
          if (result.value) {
            arg.event.remove();
          } else if (result.dismiss === "cancel") {
            Swal.fire({
              text: "Event was not deleted!.",
              icon: "error",
              buttonsStyling: false,
              confirmButtonText: "Ok, got it!",
              customClass: {
                confirmButton: "btn btn-primary",
              },
            });
          }
        });
      },
      dayMaxEvents: true, // allow "more" link when too many events
      // 이벤트 객체 필드 document : https://fullcalendar.io/docs/event-object
      events: calendarList,
    });

    calendar.render();
  };

  document.addEventListener("DOMContentLoaded", function () {
    getCalendarList();
    //calendar.render();
  });
</script>


<!-- MDB -->
<script type="text/javascript" src="${path}/resources/admin/js/mdb.min.js"></script>
<!-- Custom scripts -->
<%-- <script type="text/javascript" src="${path}/resources/admin/js/admin.js"></script> --%>

</html>



