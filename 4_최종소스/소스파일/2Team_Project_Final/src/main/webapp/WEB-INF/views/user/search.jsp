<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>Hands free Search</title>
   <link href="https://webfontworld.github.io/nyj/NYJGothic.css" rel="stylesheet">
   <!-- Font Awesome -->
   <link rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
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
      
   <!-- Google Fonts -->
   <link href="https://webfontworld.github.io/nyj/NYJGothic.css" rel="stylesheet">
   <!-- Custom styles -->
    <link href="${path}/resources/user/css/search.css" rel="stylesheet" /> 
    <link href="${path}/resources/user/css/customSearch.css" rel="stylesheet" />
   <link href="${path}/resources/user/css/chat.css" rel="stylesheet" />
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"
      integrity="sha512-d9xgZrVZpmmQlfonhQUvTR7lMPtO7NkZMkA0ABN3PHCbKA5nqylQ/yWlFAyY6hYgdF1Qh6nYiuADWwKB4C2WSw=="
      crossorigin="anonymous"></script>
      <!-- Google tag (gtag.js) -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-R3NH3D2T1E"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());
	
	  gtag('config', 'G-R3NH3D2T1E');
	</script>
   <!-- 아이콘 -->
   <script src="https://kit.fontawesome.com/418779817b.js" crossorigin="anonymous"></script>
   <!-- Bootstrap icons-->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
   <link href="https://webfontworld.github.io/nyj/NYJGothic.css" rel="stylesheet">
   <!-- sock js -->
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js"></script>
   <!-- STOMP -->
   <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
   <!-- 커스텀 js -->
   <script type="text/javascript" src="${path}/resources/user/js/search.js"></script>
   <!-- 파비콘 -->
   <link rel="icon" href="${path}/resources/admin/img/loca3.png" /> 
<style>
body{
   font-family:"맑은 고딕", "고딕", "굴림";
}
html, body {
margin: 0px; 
padding: 0px;
}
#wrapper{
   width: 1200px;
   margin: 0 auto;   
}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;margin:10px 0 30px 10px;padding:5px;}


#backBtn{
    font-size: 1.5rem;
    position: absolute;
    top: 0;
    left: 0;
    border: none;
    cursor: pointer;
    border-top-left-radius: 15px;
    margin: 5px;
    text-align: left;
}

</style>


</head>
   <!-- 지도 -->
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f8465e5d46edf4274cf5a48ed2ce318&libraries=services"></script>
      <script type="text/javascript">
      var lat='';
      var lon='';

      $(document).ready(function(){
    	  
    	  
         
         //소켓 연결
         //webSocket 대신 SockJS을 사용하므로 Stomp.client() 가 아닌 Stomp.over()를 사용한다
         //const socket = new SockJS('http://localhost:8090/websocket');
         const socket = new SockJS('http://54.250.19.196:8080/websocket');
         const stomp = Stomp.over(socket);
         stomp.debug = null; //stomp 콘솔출력 X
         //구독 아이디 저장
         const subscribe = [];
         
         //   connect(header, connectCallback(연결에 성공하면 실행되는 메소드 ))
         stomp.connect({}, function(){
            //main();
         });
         
         
         // ***************** 카카오API *****************
         // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
         var infowindow = new kakao.maps.InfoWindow({zIndex:1});
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
             mapOption = {
                 center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                 level: 3 // 지도의 확대 레벨
             };
         
         // 지도를 생성합니다    
         var map = new kakao.maps.Map(mapContainer, mapOption); 

         // 장소 검색 객체를 생성합니다
         var ps = new kakao.maps.services.Places(); 
         
         if("${destination}" == ""){
            if (navigator.geolocation) {
                 navigator.geolocation.getCurrentPosition(function(position) {
                       lat = position.coords.latitude; // 위도
                       lon = position.coords.longitude; // 경도
                       var locPosition = new kakao.maps.LatLng(lat, lon);
                       var bounds = new kakao.maps.LatLngBounds();
                      var marker = new kakao.maps.Marker({position: locPosition});
                      marker.setMap(map);
                      bounds.extend(locPosition);
                      map.setBounds(bounds);
                      map.setLevel(4);
                      
                      circle(lat, lon);
                      
                 });
            }
         }else{
            // 키워드로 장소를 검색합니다
            ps.keywordSearch('<c:out value="${destination}" />', placesSearchCB);
         }
      
            function createList(data){
               const str = data.ADDRESS;
               var address = '';
               if(str.length >= 5){
                  address = str.substr(0,9) + "...";
               }
               const itemList = `
               <div class="shopList">
               
                  <img class="shop_img" alt="없음"
                     src=\${data.PROFILE_PATH }>
                  <div class="shop_info">
                        보관소 🏠<br>
                     <h4>\${data.NAME}</h4>
                        \${address}<br>
                     
                  </div>
                  <div class="list_button" data-obj=\${data.STOREID}>
                     <button type="button" class="btn btn-primary" id="detailBtn"
                        style="margin-bottom: 15px; width: 80px; height: 30px; font-size: small;">상세보기</button>
                     <br>														
                     <button style="margin-bottom: 15px; width: 80px; height: 30px; font-size: small;" type="button" class="btn btn-primary" onclick="location.href='/users/userBook?STOREID=' + '\${data.STOREID}' + '&sDate=' + '${sDate}' + '&eDate=' + '${eDate}'">예약하기</button>
                  </div>
               </div>
               `;
               $('#listGroup').append(itemList);
            }
         // 키워드 검색 완료 시 호출되는 콜백함수 입니다
         function placesSearchCB (data, status, pagination) {
             if (status === kakao.maps.services.Status.OK) {
                 // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                 // LatLngBounds 객체에 좌표를 추가합니다
                 var bounds = new kakao.maps.LatLngBounds();

                 for (var i=0; i<data.length; i++) {
                     bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
                 }
                 
                 // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다lat1
                 map.setBounds(bounds);
                 map.setLevel(4);
               //현재 맵의 중심좌표 
               var lating = map.getCenter();
               var lat = lating.getLat(); //위도
               var lon = lating.getLng(); //경도
               var itemList = radiusItemList();
               $.each(itemList, function(index, obj){
                  var marketCheck = getDistance(obj.LATITUDE, obj.LONGITUDE, lat, lon, obj.NAME);
                  if(marketCheck)
                  {
                     displayMarker(obj);
                     
                     createList(obj);
                  }
               })
               
                                 
               circle(lat, lon);
             } 
         }
         
         // 지도에 마커를 표시하는 함수입니다
         function displayMarker(place) {
             // 마커를 생성하고 지도에 표시합니다
             var marker = new kakao.maps.Marker({
                 map: map,
                 position: new kakao.maps.LatLng(place.LATITUDE, place.LONGITUDE) 
             });
             // 마커에 클릭이벤트를 등록합니다
             kakao.maps.event.addListener(marker, 'click', function() {
                 // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
                 infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.NAME + '</div>');
                 infowindow.open(map, marker);
             });
         }
         
         //지도 원의 반경
         function getDistance(lat1,lng1,lat2,lng2, place_name) {
             function deg2rad(deg) {
                 return deg * (Math.PI/180)
             }
         
             var R = 6371; // Radius of the earth in km
             var dLat = deg2rad(lat2-lat1);  // deg2rad below
             var dLon = deg2rad(lng2-lng1);
             var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
             var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
             var d = R * c; // Distance in km
             var m = d * 500;
             if(m <= 500){
                return true;
             }else{
                return false;   
             }
             
         }
         //반경 1000미터 원
         function circle(lat, lon){
            //테스트 원값
            var circle = new kakao.maps.Circle({
                center : new kakao.maps.LatLng(lat, lon),  // 원의 중심좌표 입니다 
                radius: 550, // 미터 단위의 원의 반지름입니다 
                strokeWeight: 5, // 선의 두께입니다 
                strokeColor: '#75B8FA', // 선의 색깔입니다
                strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                strokeStyle: 'dashed', // 선의 스타일 입니다
                fillColor: '#CFE7FF', // 채우기 색깔입니다
                fillOpacity: 0.7  // 채우기 불투명도 입니다   
            }); 
            // 지도에 원을 표시합니다 
            circle.setMap(map); 

         }
         
         
         
         //지도 띄우기 전에 리스트 먼저 띄움
         function radiusItemList(){
            var retval
            $.ajax({
               type : "get",
               url : '/selectStore',
               async :false,
               success : function(data){
                  retval = data;
               },
               error:function(request, status, error){
                  console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
               }
            });
            return retval;
         }

         
/*          $.ajax({
            type : "get",
            url : '/selectStore',
            success : function(data){
               $('#listGroup').empty();
               $.each(data, function(index, obj){
                  createList(obj)
               })
            },
            error:function(request, status, error){
               console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
         })    */
         
         //지도끝
         

         
         
         /*  채팅   */
         
         $(document).on("click", "#chatBtn", function(){
           const storeId = $('#chatBtn').data('obj');
            createRoom(storeId);
         })
         
                  //채팅 버튼 클릭 및 엔터
         $(".chat_button_area button").click(function(){
            console.log("메세지 클릭");
            console.log(subscribe.length);
            sendMessage();
            $(".chat_input_area textarea").focus();
         })
         
         $(".chat_input_area textarea").keypress(function(event){
            console.log("메세지 엔터");
            console.log(subscribe.length);
            if(event.keyCode == 13){
               if(!event.shiftKey){
                  event.preventDefault();
                  sendMessage();
               }
            }
         })
         
         
         
         
         
         /* 채팅  */
         
         //채팅 만들기
         function createRoom(storeId){
            //var test = $('#dropdownMenu2').attr('value');
            //var test = $('#dropdownMenu2').text();
            
            var nickname = $('#dropdownMenu2').text().trim();
         console.log(storeId);
         var data = {
               storeId : storeId
         }
            $.ajax({
               url : "/chatingRoom",
               type :  "POST",
               data : data,
               success : function(data){
                  //data값 기준으로 채팅창 페이지 만들다.
                  /* console.log(data); */
                  var roomData = data;
                  $.each(data.users, function(index, obj){
                     if(obj === nickname)
                     {
                        initRoom(roomData, nickname);
                     }      
                  })
                  
               },
                  error:function (request, status, error){
                      console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
                  }
            })
         }
         
         //메세지 보낼때      
         function sendMessage(){
            const message = $(".chat_input_area textarea");
            
            if(message.val() == "")
               return
            
            const roomNumber = info.getRoomNumber();
            const nickname = info.getNickname();
            
            const data = {
                  message : message.val()
            }

            stomp.send("/socket/sendMessage/" + roomNumber, {}, JSON.stringify(data));
            message.val("");
         }
         
         //채팅 구독.!!
         function chatingConnect(roomNumber){
            //메세지 받을 경로
            const id1 = stomp.subscribe("/topic/message/" + roomNumber, function(result){
               const message = JSON.parse(result.body);
               //채팅 그리기
               chating(message);
            })
            // 입장,퇴장 알림을 받을 경로
            const id2 = stomp.subscribe("/topic/notification/" + roomNumber, function(result){
               const room = JSON.parse(result.body);
               const message = room.message;
               userList(room.users);
               const chatHtml = `
                    <li>
                    </li>`;
               
/*                $(".chat ul.chat_list").append(chatHtml); */
               $(".chat ul").scrollTop($(".chat ul")[0].scrollHeight);
            })
         }
         
         //에러메세지
         function errorMSG(result){
            if(result.status == 404){
               alert("종료되었거나 없는 방입니다.");
            }else{
               alert("에러가 발생했습니다.");
            }
            location.href="${pageContext.request.contextPath}/websocket";
         }
         
         
         /*함수*/
         
         
         /*셋팅 데이터*/
         
         
         /* 추후 세션 값 받고 없앨꺼임*/
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
         /* 추후 세션 값 받고 없앨꺼임*/
         
         function initRoom(roomData, nickname){
            /* $("main").hide(); */
            info.setNickname(nickname);
            info.setRoomNumber(roomData.roomNumber);

            $(".chat").show();
            /* $(".chat .chat_title").text(roomData.roomName); */
            chatingConnect(roomData.roomNumber);
            
            $(".chat_input_area textarea").focus();
            
         }
         
         function userList(users){
            $(".chat .chat_users .user").text(users.length + "명");
            
            let userHtml = "";
            for(let i=0;i<users.length;i++){
               userHtml += `
                  <li>\${users[i]}</li>`;
            }
            
            $(".chat .chat_nickname ul").html(userHtml);
         }
         /*셋팅 데이터*/
         
         
         /* 뷰페이지 그리기 */
         
         function listHtml(roomList){
            let listHtml = "";
            
            for(let i=0; i<roomList.length; i++){
               listHtml += `
                  <li data-room_number=\${roomList[i].roomNumber}>
                     <span class="chat_title">\${roomList[i].roomName}</span>
                     <span class="chat_count">\${roomList[i].users.length}명</span>
                  </li>`;
            }
            $("main ul").html(listHtml);
         }
         

         
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
             $(".chat ul.chat_list").append(chatHtml);
             $(".chat ul").scrollTop($(".chat ul")[0].scrollHeight);
         
          }
         
         /* 뷰페이지 그리기 */
   })
   </script>   

<body>
   <!--Main Navigation-->

      <!-- 좌측 사이드바 -->
      <!-- Sidebar -->
      <nav style="background-color: #f8f8fb" id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white">
         <div class="position-sticky">
            <div id="listGroup" class="list-group list-group-flush mx-2 mt-4">
            </div>
            
         </div>
      </nav>

      <%
         pageContext.include("/WEB-INF/views/include/header.jsp");
      %>
      <!--Main layout-->
      <main style="margin-top: 58px">
         <div class="container pt-4">
            <section class="mb-4">
               <div class="card">
                  
                  <div id="map" class="card-body">
                     <canvas class="my-4 w-100" height="500"></canvas>                     
                  </div>
                  <div id="menu_wrap" class="chat" draggable="true">
                     <div>
                        <div id="chat_body" class="chat_body">
                           <h2 class="chat_title"></h2>
                           <button class="chat_back"><i class="bi bi-caret-left"></i></button>
   
                           <ul class="chat_list">
                              <li></li>
                           </ul>
   
                           <div class="chat_input">
                              <div class="chat_input_area">
                                 <textarea class="textareaF"></textarea>
                              </div>
   
                              <div class="chat_button_area">
                                 <button>✉️</button>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </section>
         </div>
      </main>
      
      
</body>
</html>