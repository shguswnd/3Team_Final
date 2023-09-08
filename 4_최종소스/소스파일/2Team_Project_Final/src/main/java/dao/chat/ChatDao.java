package dao.chat;

import java.awt.List;
import java.sql.SQLException;
import java.util.LinkedList;

import org.apache.ibatis.annotations.Param;

import vo.chat.ChatJoin;
import vo.chat.ChatMessage;
import vo.chat.ChatRoom;

public interface ChatDao {
	//채팅룸
	public int insertChatRoom(ChatRoom chatroom) throws ClassNotFoundException, SQLException;
	//채팅조인
	public int insertChatJoin(ChatJoin chatjoin) throws ClassNotFoundException, SQLException;
	//채팅 메세지
	public int insertChatMessage(ChatMessage chatmessage) throws ClassNotFoundException, SQLException;
	
	//채팅 룸 조회
	public LinkedList<ChatJoin> selectChat(@Param("userId") String userId) throws ClassNotFoundException, SQLException;
	
}
