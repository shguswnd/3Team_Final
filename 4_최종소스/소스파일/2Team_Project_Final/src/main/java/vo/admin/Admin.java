package vo.admin;

import lombok.Builder;
import lombok.Getter;

@Getter
public class Admin {
	private String userId;
	private String password;
	private String enabled;
	private String joinDate;
	private String firstName;
	private String lastName;
	private String mailReceptionStatus;
	private Integer accountType;
	private String profilePath;
	
	@Builder
	public Admin(String userId, String password, String enabled, String joinDate, String firstName, String lastName,
			String mailReceptionStatus, Integer accountType, String profilePath) {
		this.userId = userId;
		this.password = password;
		this.enabled = enabled;
		this.joinDate = joinDate;
		this.firstName = firstName;
		this.lastName = lastName;
		this.mailReceptionStatus = mailReceptionStatus;
		this.accountType = accountType;
		this.profilePath = profilePath;
	}
}
