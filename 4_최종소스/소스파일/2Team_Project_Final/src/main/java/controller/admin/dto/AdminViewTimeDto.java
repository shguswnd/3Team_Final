package controller.admin.dto;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import vo.admin.StoreDetails;

@Getter
public class AdminViewTimeDto {
	List<String> times;

	public AdminViewTimeDto(StoreDetails storeDetails) {
		this.times = new ArrayList<String>();
		addTimes(storeDetails.getManageWeekTime().split("~")[0]);
		addTimes(storeDetails.getManageWeekTime().split("~")[1]);
		addTimes(storeDetails.getManageSatTime().split("~")[0]);
		addTimes(storeDetails.getManageSatTime().split("~")[1]);
		addTimes(storeDetails.getManageSunTime().split("~")[0]);
		addTimes(storeDetails.getManageSunTime().split("~")[1]);
	}
	
	private void addTimes(String time) {
		String prev = time.substring(0, 2);
		Integer hour = Integer.parseInt(time.substring(2, 4));
		String minutes = time.substring(4);
		if (prev.equals("오후") && hour < 12) {
			hour += 12;
		}
		times.add((hour < 10 ? "0" + hour : "" + hour) + minutes);
	}
}
