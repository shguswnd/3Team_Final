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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- sock js -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
	<!-- STOMP -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<!-- Google tag (gtag.js) -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=G-R3NH3D2T1E"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-R3NH3D2T1E');
</script>
<link href="${path}/resources/user/css/chat.css" rel="stylesheet" />
</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var str = $('#navbarDropdownMenuLink').text().trim(); // 계정의 정보
			var nickname = str.match(/\[(.*)\]/)[1];
			console.log(nickname)
			//소켓 연결
			//webSocket 대신 SockJS을 사용하므로 Stomp.client() 가 아닌 Stomp.over()를 사용한다
			//const socket = new SockJS('http://localhost:8090/websocket');
			const socket = new SockJS('http://54.250.19.196:8080/websocket');
			const stomp = Stomp.over(socket);
			stomp.debug = null; //stomp 콘솔출력 X
			//구독 아이디 저장
			const subscribe = [];
			
			//	connect(header, connectCallback(연결에 성공하면 실행되는 메소드 ))
			stomp.connect({}, function(){
				const subscribeId = stomp.subscribe("topic/roomList",function(){
					console.log("방생기고 새롭게 호출될경우");
					chatingRoomList();
				});
				//채팅방 초기화면
				chatingRoomList();
			});
			
			
			//채팅 리스트 불러오기
			function chatingRoomList(){
				$.ajax({
					url: "/chatingRoomList",
					type: "GET"
				})
				.then(function(data){
					listHtml(data)
				})
				.fail(function(){
					alert("에러가 발생했습니다.")
				})
			}
			
			function initRoom(roomData, nickname){
				//채팅 리스트 보내기 아직까지 필요없어보임
				//stomp.send("/socket/roomList");
				
				info.setNickname(nickname);
				info.setRoomNumber(roomData.roomNumber);
				
				$(".chat").show();
				$(".chat .chat_title").text(roomData.roomName);
				chatingConnect(roomData.roomNumber);
				
				$(".chat_input_area textarea").focus();
				
			}
			//채팅 구독.!!
			function chatingConnect(roomNumber){
				
				console.log("채팅");
				console.log(subscribe.length);
				//메세지 받을 경로
				const id1 = stomp.subscribe("/topic/message/" + roomNumber, function(result){
					const message = JSON.parse(result.body);
					console.log("메세지 구독")
					console.log(result);
					console.log(message);
					//채팅 그리기
					chating(message);
				})
				// 입장,퇴장 알림을 받을 경로
			const id2 = stomp.subscribe("/topic/notification/" + roomNumber, function(result){
				console.log(result);
				const room = JSON.parse(result.body);
				const message = room.message;
				console.log("5 접근");
			
				const chatHtml = `
			        <li>
			        	<div class="notification">
		            		
		            	</div>
			        </li>`;
				
				$(".adminChat ul.chat_list").append(chatHtml);
				$(".adminChat ul").scrollTop($(".adminChat ul")[0].scrollHeight);
			})
				
			}
			
			//메세지 보낼때		
			function sendMessage(){
				console.log("메세지보낼때");
				console.log(subscribe.length);
				
				const message = $(".chat_input_area textarea");
				
				if(message.val() == "")
					return
				
				const roomNumber = info.getRoomNumber();
				const nickname = info.getNickname();
				
				const data = {
						message : message.val(),
						nickname : nickname
				}
				console.log(roomNumber);
				console.log(nickname);
				console.log(data);
				stomp.send("/socket/sendMessage/" + roomNumber, {}, JSON.stringify(data));
				message.val("");
			}
			
			const info = (function(){
				let nickname = "";
				let roomNumber = "";
				
				const getNickname = function() {
					return nickname;
				}
				
				const setNickname = function(set){
					nickname = set;
				}
				
				const getRoomNumber = function() {
					return roomNumber;
				}
				
				const setRoomNumber = function(set) {
					roomNumber = set;
				}
				return {
					getNickname : getNickname,
					setNickname : setNickname,
					getRoomNumber : getRoomNumber,
					setRoomNumber : setRoomNumber,
				}
			})();
			
			
			$(document).on("click", ".chat_button_area button", function(){
				console.log("메세지 클릭");
				console.log(subscribe.length);
				sendMessage();
				$(".chat_input_area textarea").focus();				
			})

			$(document).on("keypress", ".chat_input_area textarea", function(event){
				console.log("메세지 엔터");
				console.log(subscribe.length);
				if(event.keyCode == 13){
					if(!event.shiftKey){
						event.preventDefault();
						sendMessage();
					}
				}
			})
				

			
			$(document).on("click", "#chatBtn", function(){
				var obj = $(this).closest('tr').data('obj');
				var roomNumber = obj.roomNumber
				
				if(nickname){
					const data = {
							roomNumber : roomNumber,
							nickname : nickname
					}
					console.log("data");
					console.log(data);
					$.ajax({
						url : "/chatingRoom-enter",
						type : "GET",
						data : data,
						success : function(room){
							chatingView();
							initRoom(room, nickname);
							stomp.send(
									"/socket/notification/" + roomNumber, {}, 
									JSON.stringify(room));
						},
						error:function (request, status, error){
			                   console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
			            }
						
					})
				}
			})
			
			
			/* 뷰페이지 그리기 */
			
			// 메세지 그리기
			function chating(messageInfo){
	        	 console.log(messageInfo);
	             let nickname = messageInfo.userId;
	             let message = messageInfo.content;
	             
	             message = message.replaceAll("\n", "<br>").replaceAll(" ", "&nbsp");
	             
	             
	             const date = messageInfo.sdate;
	             const d = new Date(date);
	             const time = String(d.getHours()).padStart(2, "0") 
	            + ":" 
	            + String(d.getMinutes()).padStart(2, "0");
	             
	             let sender ="";
	             
	             if(info.getNickname() == nickname) {
	                sender = "chat_me";
	                nickname = "";
	             } else {
	                sender=  "chat_other";
	             }
	             
	             const chatHtml = `
	                  <li>
	                      <div class=\${sender}>
	                         <div>
	                            <div class="nickname">\${nickname}</div>
	                            <div class="message">
	                                <span class=chat_in_time>\${time }</span>
	                                <span class="chat_content">\${message}</span>
	                             <span>
	                          </div>
	                      </div>
	                  </li>`;
	             $(".adminChat ul.chat_list").append(chatHtml);
	             $(".adminChat ul").scrollTop($(".adminChat ul")[0].scrollHeight);
	         
	          }
			
			function listHtml(roomList){
				console.log("페이지 그림?");
				let listHtml = "";
				
				$.each(roomList, function(index, obj){
					console.log(obj);
					console.log(obj.users[0])
					if(obj.users[0] !== nickname){
						listHtml += `
							<tr data-obj=\${JSON.stringify(obj)}>
								<td>\${obj.users[0]}</td>
								<td>안녕하세요 예약문의...</td>
								<td>
									<button type="button" id="chatBtn" class="btn btn-info">입장</button>
								</td>
							</tr>`;	
					}
				})
				$("#chatList").append(listHtml);
			}
			
			function chatingView(){
				var chatView = `
					<div id="menu_wrap" class="adminChat table" draggable="true">
					<div>
						<div id="chat_body" class="chat_body">
							<h2 class="chat_title"></h2>
							<button class="chat_back">◀</button>

							<ul class="chat_list">
								<li></li>
							</ul>

							<div class="chat_input">
								<div class="chat_input_area">
									<textarea class="textareaF"></textarea>
								</div>

								<div class="chat_button_area">
									<button>전송</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				`;
				$(".adminChat").css('display', 'inline-block');
				$("#togleView").children().hide();
				$("#togleView").append(chatView);
				$("#togleView").find("menu_wrap").show();
			}
			
			
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
				class="list-group-item list-group-item-action py-2 ripple active"
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
				class="list-group-item list-group-item-action py-2 ripple"
				data-toggle="pill"><i class="fas fa-clock fa-fw me-3"></i><span>삭제 리뷰관리</span></a>
		</div>
	</div>
	</nav> <!-- Sidebar --> <jsp:include
		page="/WEB-INF/views/admin/inc/header.jsp" /> <!--Main layout--> <main
		style="margin-top: 58px">
	<div id="viewMain" class="container pt-4">
		<section class="mb-4">
		<div class="card">
			<div class="card-header py-3">
				<h5 class="mb-0 text-left">
					<strong>[Hands Free] ${storeName}</strong>
				</h5>
				<br />
				<div style="color: #ff6e6e; font-size: x-small">*이 페이지는 채팅관리을
					볼 수 있는 페이지 입니다.</div>
			</div>
			<div class="card-body">
				<br />
				<h2 style="text-align: center">채팅관리</h2>
				<br />
				<br />
				<div id="togleView">
				<table class="table" style="text-align: center">
					<thead class="table-primary">
						<tr>
							<th scope="col">예약자명</th>
							<th scope="col">채팅내용</th>
							<th scope="col">채팅방</th>
						</tr>
					</thead>
					<tbody id="chatList">
					<!-- 채팅 리스트 -->
					</tbody>
				</table>
				</div>
				<nav aria-label="..." style="text-align: center">
				<ul class="pagination">

				</ul>
				</nav>
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



