package controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import service.user.UserRegisterService;
import vo.user.Users;

@Controller
public class UserSecurityController {
	
	@Autowired
	private UserRegisterService registerservice;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	//POST 요청	**회원가입 처리**
	@PostMapping("/users/register")
	public String join(HttpServletRequest request) {
		
		Users users = new Users(request);
		
		String rawPwd = users.getUserpwd();
		String encodedPwd = bCryptPasswordEncoder.encode(rawPwd);

		users.setUserpwd(encodedPwd);
		registerservice.insert(users);
		
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
    }
	
	//GET 요청
	//user/register.jsp 회원가입 페이지로 이동
	@GetMapping("/users/register")
	public String getRegisterView() {
		return "user/register";
	}
	
	
	////////////////////// 로그인 //////////////////////
	

	//GET요청
	//login.jsp **로그인 페이지로 이동**
	@GetMapping("/users/login")
	public String login() {
		return "user/login";
	}


}
