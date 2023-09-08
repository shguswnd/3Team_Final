package vo.admin;

import lombok.Builder;
import lombok.Getter;

@Getter
public class StoreDetails {
	private String storeId;			//아이디
	private String notice;			//가게내용
	private String status;			//가게상태
	private String wayToFind;		//찾아오는길
	private String manageWeekTime;	//운영시간 평일
	private String manageSatTime;	//운영시간 토요일
	private String manageSunTime;	//운영시간 일요일
	private int storeCnt;			//보관수
	private String certificatePath;	//등록증

	@Builder
	public StoreDetails(String storeId, String notice, String status, String wayToFind, String manageWeekTime,
			String manageSatTime, String manageSunTime, int storeCnt, String certificatePath) {
		this.storeId = storeId;
		this.notice = notice;
		this.status = status;
		this.wayToFind = wayToFind;
		this.manageWeekTime = manageWeekTime;
		this.manageSatTime = manageSatTime;
		this.manageSunTime = manageSunTime;
		this.storeCnt = storeCnt;
		this.certificatePath = certificatePath;
	}
}
