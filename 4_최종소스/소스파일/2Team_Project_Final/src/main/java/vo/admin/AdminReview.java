package vo.admin;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@AllArgsConstructor
@NoArgsConstructor
public class AdminReview {
	private String user_idx;
	private String reservation_idx;
	private String user_content;
	private String user_name;
	private Integer user_grade;
	private String user_date;
	private Integer store_idx;
	private String store_name;
	private String store_content;
	private String store_date;
}
