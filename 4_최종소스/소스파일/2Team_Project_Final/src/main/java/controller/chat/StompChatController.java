package controller.chat;


import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import service.chat.ChatService;
import vo.chat.ChatJoin;
import vo.chat.ChatMessage;
import vo.chat.ChatRoom;
import vo.chat.ChatingRoom;
import vo.chat.Message;





@Controller
public class StompChatController {
	
	@Autowired
	private ChatService chatservice;
	
	//채팅방 목록
	//삽입삭제만 이루워지므로 링크드리스트씀
	public static LinkedList<ChatingRoom> chatingRoomList = new LinkedList<>();
	
	/*
	 Class ResponseEntity<T>
	 응답자체의 독립된 값이나 표현형태로, 사용자의 HttpRequest에 대한 응답 데이터를 포함하는 클래스이다.
	 따라서 HttpStatus, HttpHeaders, HttpBody를 포함한다.
	 
	 ResponseEntity란, httpentity를 상속받는, 결과 데이터와 HTTP 상태코드를 직접 제어할 수 있는 클래스이다.
	 ResponseEntity에는 사용자의 HttpRequest에 대한 응답 데이터가 포함된다.
	 에러 코드와 같은 Http 상태 코드를 전송하고 싶은 데이터와 함께 전송할 수 있기 때문에 좀 더 세밀한 제어가 필요한 경우 사용.
	 */
	//채팅방 초기화
	@GetMapping("/chatingRoomList")
	public ResponseEntity<?> chatingRoomList(Authentication auth){
		String nickname = auth.getName();
		return new ResponseEntity<LinkedList<ChatingRoom>>(chatingRoomList, HttpStatus.OK);
	}

	//방만들기
	@PostMapping("/chatingRoom")
	public ResponseEntity<?> chatingRoom(HttpServletResponse response, Authentication auth, String storeId){
//		System.out.println("ID정보 : " + auth.getName());
		String nickname = auth.getName();
		//SecurityContext context1 = SecurityContextHolder.getContext();
//		System.out.println(nickname);
		//방을 만들고 채팅방 목록에 추가
		String roomNumber = UUID.randomUUID().toString();
		ChatingRoom chatingRoom = ChatingRoom.builder()
				.roomNumber(roomNumber)
				.users(new LinkedList<>())
				.build();

		ChatRoom chatroom = ChatRoom.builder()
				.idx(roomNumber)
				.status(1)
				.sDate(new Date())
				.lastSubJect("")
				.lastTime(new Date())
				.build();
		
		ChatJoin chatjoin = ChatJoin.builder()
				.userId(nickname)
				.roodIdx(roomNumber)
				.build();
		
		ChatJoin chatjoinAdmin = ChatJoin.builder()
				.userId(storeId)
				.roodIdx(roomNumber)
				.build();

		//채팅룸 데이터 add 
		chatingRoomList.add(chatingRoom);
		
		//쿠키생성
		Cookie nameCookie = new Cookie("nickname", nickname);
		Cookie roomCookie = new Cookie("roomNumber", roomNumber);
		//단위 초 (7일 설정)
		int maxage = 60 * 60 * 24 * 7;
		nameCookie.setMaxAge(maxage);
		response.addCookie(nameCookie);
		
		// 방 입장
		if(chatingRoom == null) {
			deleteCookie();
			nameCookie = new Cookie("nickname", null);
			nameCookie.setMaxAge(0);
			response.addCookie(nameCookie);
		} else {
			LinkedList<String> users = chatingRoom.getUsers();
			users.add(nickname);
			roomCookie.setMaxAge(maxage);
			response.addCookie(roomCookie);
			//chatservice.insertAllChat(chatroom,chatjoin,chatjoinAdmin);
		}
		return new ResponseEntity<>(chatingRoom, HttpStatus.OK);
	}
	
	//방들어가기
	@GetMapping("/chatingRoom-enter")
	public ResponseEntity<?> EnterChatingRoom(HttpServletResponse response, String roomNumber, String nickname){
		//방번호 찾기
		ChatingRoom chatingRoom = findRoom(roomNumber);

		
		//쿠키생성
		Cookie nameCookie = new Cookie("nickname", nickname);
		Cookie roomCookie = new Cookie("roomNumber", roomNumber); 
		//단위 초 (7일 설정)
		int maxage = 60 * 60 * 24 * 7;
		nameCookie.setMaxAge(maxage);
		response.addCookie(nameCookie);
		
		// 방 입장
		if(chatingRoom == null) {
			nameCookie = new Cookie("nickname", null);
			nameCookie.setMaxAge(0);
			response.addCookie(nameCookie);
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		} else {
			LinkedList<String> users = chatingRoom.getUsers();
			users.add(nickname);
			roomCookie.setMaxAge(maxage);
			response.addCookie(roomCookie);
		}
		
		
		return new ResponseEntity<>(chatingRoom, HttpStatus.OK);
	}
	
	//방나기기
	//리소스의 일부만 업데이트 하기 위해
	@PatchMapping("/chatingRoom-exit")
	public ResponseEntity<?> ExitChatingRoom(){
			
		Map<String, String> map = findCookie();
			
		if(map == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		
		String roomNumber = map.get("roomNumber");
		String nickname = map.get("nickname");
		
		// 방목록에서 방번호에 맞는 유저목록 가져오기
		ChatingRoom chatingRoom = findRoom(roomNumber);
		List<String> users = chatingRoom.getUsers();
		
		// 닉네임 삭제
		users.remove(nickname);
		
		// 쿠키에서 닉네임과 방번호 삭제
		deleteCookie();
		
		// 유저가 한명도 없다면 방 삭제
		if(users.size() == 0) {
			chatingRoomList.remove(chatingRoom);
		}
		
		return new ResponseEntity<>(chatingRoom, HttpStatus.OK);
	}
	
	//채팅 입/퇴장 메세지 보내기
	@MessageMapping("/socket/notification/{roomNumber}")
	@SendTo("/topic/notification/{roomNumber}")
	public Map<String, Object> notification(@DestinationVariable String roomNumber, Map<String, Object> chatingRoom){
		return chatingRoom;
	}
	
	//채팅메세지 보내기
	@MessageMapping("/socket/sendMessage/{roomNumber}")
	@SendTo("/topic/message/{roomNumber}")
	public ChatMessage sendMessage(@DestinationVariable String roomNumber, Authentication auth, Map<String, Object> messageVal) {
		String nickname = auth.getName();
		String roodIdx = "";
		
		String messageData = (String) messageVal.get("message");
		
		ChatMessage message = ChatMessage.builder()
				.userId(nickname)
				.roodIdx(roodIdx)
				.content(messageData)
				.sDate(new Date())
				.read(1)
				.type("입장")
				.build();
		
		//chatservice.insertChatMessage(message);
		
		System.out.println(message.toString());
		

		return message;
	}
	
	public ChatingRoom findRoom(String roomNumber) {
		ChatingRoom room = ChatingRoom.builder().roomNumber(roomNumber).build();
		int index = chatingRoomList.indexOf(room);
		
		//값이 있다면?
		if(chatingRoomList.contains(room)) {
			room = chatingRoomList.get(index);
		}
		return room;
	}
	
	// 쿠키에서 방번호, 닉네임 찾기
	public Map<String, String> findCookie() {
		//Spring 에서 전역으로 request에 대한 정보를 가져옴.
		//request Param, UserAgent 등의 매번 method의 call param으로 넘기기각 애매할때 주로 쓰임
		// RequestContextHolder 언제 생성되는지, 어디서 호출하던 관계없이 Request 정보를 얻을 수 있는지 알아봄.
		
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = attr.getRequest();
		Map<String, String> map = new HashMap<>();
		Cookie[] cookies = request.getCookies();
		
		String roomNumber = "";
		String nickname= "";
		
		if(cookies == null) {
			return null;
		}

		if(cookies != null) {
			for(int i = 0 ; i < cookies.length; i++) {
				if("roomNumber".equals(cookies[i].getName())) {
					roomNumber = cookies[i].getValue();
				}
				if("nickname".equals(cookies[i].getName())) {
					nickname = cookies[i].getValue();
							
				}
			}
		}
		
		if(!roomNumber.equals("") && !nickname.equals("")) {
			map.put("nickname", nickname);
			map.put("roomNumber", roomNumber);
		}
		
		return map;
	}
	
	//방번호, 닉네임 쿠키 삭제
	public void deleteCookie() {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		HttpServletResponse response = attr.getResponse();
		
		Cookie roomCookie = new Cookie("roomNumber", null);
		Cookie nicknameCookie = new Cookie("nickname",null);
		
		roomCookie.setMaxAge(0);
		nicknameCookie.setMaxAge(0);
		
		response.addCookie(nicknameCookie);
		response.addCookie(roomCookie);
	}
}
