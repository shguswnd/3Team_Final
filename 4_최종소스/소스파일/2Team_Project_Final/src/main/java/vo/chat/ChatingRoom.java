package vo.chat;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Objects;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.WebSocketSession;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
public class ChatingRoom {
	private String roomNumber;
	private LinkedList<String> users;
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ChatingRoom other = (ChatingRoom) obj;
		return Objects.equals(roomNumber, other.roomNumber);
	}
	@Override
	public int hashCode() {
		return Objects.hash(roomNumber);
	}
	
/*
 	빌더가 있다면 없어도 될듯?
	public ChatingRoom(String roomNumber, String roomName, LinkedList<String> users) {
		super();
		this.roomNumber = roomNumber;
		this.roomName = roomName;
		this.users = users;
	}
*/
	
}
