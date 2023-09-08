package vo.chat;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class ChatMessage {
	private int idx;
	private String userId;
	private String roodIdx;
	private String content;
	private Date sDate;
	private int read;
	private String type;
	
	@Builder
	public ChatMessage(String userId, String roodIdx, String content, Date sDate, int read, String type) {
		this.userId = userId;
		this.roodIdx = roodIdx;
		this.content = content;
		this.sDate = sDate;
		this.read = read;
		this.type = type;
	}
	
	
}
