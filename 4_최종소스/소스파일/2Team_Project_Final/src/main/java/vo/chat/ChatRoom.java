package vo.chat;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class ChatRoom {
	private String idx;
	private int status;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date sDate;
	private String lastSubJect;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date lastTime;
	
	@Builder
	public ChatRoom(String idx, int status, Date sDate, String lastSubJect, Date lastTime) {
		this.idx = idx;
		this.status = status;
		this.sDate = sDate;
		this.lastSubJect = lastSubJect;
		this.lastTime = lastTime;
	}
	
	
}
