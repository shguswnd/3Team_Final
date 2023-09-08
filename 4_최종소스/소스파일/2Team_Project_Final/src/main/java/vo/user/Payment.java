package vo.user;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Payment {
	private int idx;
	private String userid;
	private String storeid;
	private String name;
	private int cnt;
	private int price;
	private String payment_method;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date payment_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date sdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date edate;
	private int status;
	
	@Builder
	public Payment(String userid,String storeid, String name, int cnt,
					int price, String payment_method, Date payment_date, Date sdate
					, Date edate, int status) {
		this.userid = userid;
		this.storeid = storeid;
		this.name = name;
		this.cnt = cnt;
		this.price = price;
		this.payment_method = payment_method;
		this.payment_date = payment_date;
		this.sdate = sdate;
		this.edate = edate;
		this.status = status;
	}
}
