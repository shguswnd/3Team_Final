package vo.admin;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class RealReview {
	// 실제 Review Table에 있는 컬럼에
	// 대응하는 iv를 만듦
	private Integer idx;
	private Integer reservationIdx;
	private Integer parent;
	private String name;
	private String content;
	private Integer grade;
	private String edate;
	private Integer status;
	
	@Builder
	public RealReview(Integer idx, Integer reservationIdx, Integer parent, String name, String content, Integer grade,
			String edate, Integer status) {
		this.idx = idx;
		this.reservationIdx = reservationIdx;
		this.parent = parent;
		this.name = name;
		this.content = content;
		this.grade = grade;
		this.edate = edate;
		this.status = status;
	}
}
