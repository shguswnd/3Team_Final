package service.chat;

import java.sql.SQLException;
import java.util.LinkedList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.chat.ChatDao;
import vo.chat.ChatJoin;
import vo.chat.ChatMessage;
import vo.chat.ChatRoom;

@Service
@Transactional(readOnly = true)
public class ChatService {
	/*
	@Autowired	
	private SqlSession sqlsession;
	
	
	@Transactional
	public void insertAllChat(ChatRoom chatroom, ChatJoin chatjoin, ChatJoin chatjoinAdmin) {
		try {
			ChatDao chatDao = sqlsession.getMapper(ChatDao.class);
			chatDao.insertChatRoom(chatroom);
			chatDao.insertChatJoin(chatjoin);
			chatDao.insertChatJoin(chatjoinAdmin);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void insertChatMessage(ChatMessage message) {
		try {
			ChatDao chatDao = sqlsession.getMapper(ChatDao.class);
			chatDao.insertChatMessage(message);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public LinkedList<ChatJoin> selectChat(String userId) {
		LinkedList<ChatJoin> chatJoin = null;
		try {
			ChatDao chatDao = sqlsession.getMapper(ChatDao.class);
			chatJoin = chatDao.selectChat(userId);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return chatJoin;
	}
*/
	
}
