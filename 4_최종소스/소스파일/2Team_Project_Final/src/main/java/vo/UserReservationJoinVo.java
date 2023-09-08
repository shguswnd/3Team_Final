package vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserReservationJoinVo {
	private int idx;
	private String storeName;
	private String userName;
	private int cnt;
	private int price;
	private String pdate;
	private String sdate;
	private String edate;
	private int reviewstatus;
	private String userContent;
	private String userDate;
	private String storeContent;
	private String storeDate;
	private int grade;
}
