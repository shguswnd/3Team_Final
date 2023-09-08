package controller.admin.dto;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import vo.admin.Store;
import vo.admin.StoreDetails;
import vo.user.Users;

@Getter
@AllArgsConstructor
public class StoreInfoUpdateDto {
	private String phone;
	private int storeCnt;
	private String weekStart;
	private String weekEnd;
	private String satStart;
	private String satEnd;
	private String sunStart;
	private String sunEnd;
	private String notice;
	private MultipartFile file;
	private String profile_path;
	
	public void setProfilePath(HttpServletRequest request) {
		this.profile_path = request.getServletContext().getRealPath("/files/upload/profile/");
	}
	
	public Users toUser(String userId) {
		return Users.builder()
				.userid(userId)
				.realFilePath("\\files\\upload\\profile\\" + userId + "\\" + file.getOriginalFilename())
				.build();
	}
	
	public StoreDetails toStoreDetail(String storeId) {
		return StoreDetails.builder()
				.storeId(storeId)
				.notice(notice)
				.storeCnt(storeCnt)
				.manageWeekTime(makeTime(weekStart) + "~" + makeTime(weekEnd))
				.manageSatTime(makeTime(satStart) + "~" + makeTime(satEnd))
				.manageSunTime(makeTime(sunStart) + "~" + makeTime(sunEnd))
				.build();
	}
	
	public Store toStore(String storeId) {
		return Store.builder()
				.storeId(storeId)
				.phone(phone)
				.build();
	}
	
	private String makeTime(String time) {
		int hour = Integer.parseInt(time.substring(0, 2));
		String result = "";
		if (hour > 12) {
			result += "오후";
			hour -= 12;
			result += (hour - 12 < 10 ? "0" + hour : "" + hour);
			result += time.substring(2);
		} else {
			result = "오전" + time;
		}
		return result;
	}
}
