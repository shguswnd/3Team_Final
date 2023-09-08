package vo.chat;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class ChatJoin {
	private String userId;
	private String roodIdx;

	
	@Builder
	public ChatJoin(String userId, String roodIdx) {
		this.userId = userId;
		this.roodIdx = roodIdx;
	}	
}
