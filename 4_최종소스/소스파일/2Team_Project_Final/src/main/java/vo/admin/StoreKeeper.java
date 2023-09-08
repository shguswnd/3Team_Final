package vo.admin;

import lombok.Builder;
import lombok.Getter;

@Getter
public class StoreKeeper {
	private String storeId;
	private String standbyStatus;
	
	@Builder
	public StoreKeeper(String storeId, String standbyStatus) {
		this.storeId = storeId;
		this.standbyStatus = standbyStatus;
	}
}
