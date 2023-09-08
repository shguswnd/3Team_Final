package controller.user.dto;

import javax.servlet.http.HttpServletRequest;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;
import vo.user.UserReview;

@Getter
@AllArgsConstructor
@ToString
public class UserReviewDto {
	private int idx;
	private String content;
	private int grade;
	
	public UserReviewDto(HttpServletRequest request) {
		try {
			// web.xml에 필터로 utf-8이 걸려 있는데 한글이 깨져 들어와
			// 임시 방편으로 처리함
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			e.getStackTrace();
		}
		this.idx = Integer.parseInt(request.getParameter("idx"));
		this.content = request.getParameter("content");
		this.grade = Integer.parseInt(request.getParameter("grade"));
	}
	
	public UserReview toUserReview(String userName) {
		return UserReview.builder()
				.rs_idx(idx)
				.content(content)
				.grade(grade)
				.name(userName)
				.status(1)
				.build();
	}
}
