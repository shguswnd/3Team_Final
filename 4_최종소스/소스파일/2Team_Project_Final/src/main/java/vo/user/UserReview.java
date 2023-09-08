package vo.user;

import lombok.Builder;
import lombok.Getter;

@Getter
public class UserReview {
	private Integer idx;
	private Integer rs_idx;
	private Integer parent;
	private String name;
	private String content;
	private Integer grade;
	private String edate;
	private Integer status;
	
	@Builder
	public UserReview(Integer idx, Integer rs_idx, Integer parent, String name, String content, Integer grade,
			String edate, Integer status) {
		this.idx = idx;
		this.rs_idx = rs_idx;
		this.parent = parent;
		this.name = name;
		this.content = content;
		this.grade = grade;
		this.edate = edate;
		this.status = status;
	}
}
