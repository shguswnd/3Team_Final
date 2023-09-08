package vo.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Users {
	private String userid;
	private String userpwd;
	//private char enabled;
	//private Date joindate;
	private String first_name;
	private String last_name;
	//private String mail_accept;
	private MultipartFile profile_path;
	private String realFilePath;
	
	@Builder
	public Users(String userid, String userpwd, String first_name, String last_name, MultipartFile profile_path,
			String realFilePath) {
		this.userid = userid;
		this.userpwd = userpwd;
		this.first_name = first_name;
		this.last_name = last_name;
		this.profile_path = profile_path;
		this.realFilePath = realFilePath;
	}

	public Users(HttpServletRequest request) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			e.getStackTrace();
		}
		
		this.userid = request.getParameter("userid");
		this.userpwd = request.getParameter("userpwd");
		this.first_name = request.getParameter("first_name");
		this.last_name = request.getParameter("last_name");
		this.profile_path = null;
		this.realFilePath = "/";
	}
}
