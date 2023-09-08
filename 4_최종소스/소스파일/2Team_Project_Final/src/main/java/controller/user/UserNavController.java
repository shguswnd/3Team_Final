package controller.user;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import controller.user.dto.UserReviewDto;
import service.admin.AdminService;
import service.user.UserMyinfoService;
import vo.UserReservationJoinVo;
import vo.user.Users;

@Controller
public class UserNavController {
	
	@Autowired
	private UserMyinfoService usermyinfoservice;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	//내 정보 상세보기
	@GetMapping("/users/userDetail")
	public String userDetail(Principal pri, Model model) {
		String userid = pri.getName();
		Users users = usermyinfoservice.userDetail(userid);
		model.addAttribute("users", users);
		
		return "user/myinfo";
	}
	
	//내 정보 수정하기
	@PostMapping("userUpdate")
	public String userUpdate(Model model, Users users) {	
		int result = 0;
		String icon = "";
		String msg = "";
		String url = "";
 
		String rawPwd = users.getUserpwd();
		String encodedPwd = bCryptPasswordEncoder.encode(rawPwd);
		
		users.setUserpwd(encodedPwd);
		result = usermyinfoservice.userUpdate(users);
		
		//내 정보 수정이 제대로 되었는지 확인
	      if (result < 1) {
	         icon = "error";
	         msg = "내 정보 수정에 실패했습니다 :(";
	         url = "/users/userDetail";
	      } else {
	         icon = "success";
	         msg = "내 정보가 수정되었습니다:)";
	         url = "/users/userDetail";
	      }

	      model.addAttribute("msg", msg);
	      model.addAttribute("url", url);
	      model.addAttribute("icon", icon);
		
		return "common/redirect"; 
	}
	
	//내 정보에서 탈퇴하기
	@PostMapping("userDelete")
	public String userDelete(Principal pri, Model model) {
		int result = 0;
		String icon = "";
		String msg = "";
		String url = "";
		
		String userid = pri.getName();
		result = usermyinfoservice.userDelete(userid);
		
		//내 정보 수정이 제대로 되었는지 확인
	      if (result == 1) {
	         icon = "success";
	         msg = "회원 탈퇴 성공. 이용해주셔서 감사합니다:(";
	         url = "/";
	         SecurityContextHolder.clearContext(); //회원 탈퇴 시 자동 로그아웃
	      } else {
	    	  
	         icon = "error";
	         msg = "회원 탈퇴에 실패했습니다 :(";
	         url = "/users/userDetail";
	      }
	      
	      model.addAttribute("msg", msg);
	      model.addAttribute("url", url);
	      model.addAttribute("icon", icon);

		return "common/redirect";
	}
	
	@GetMapping("/users/myreserve")
	public String myreserve(Model model, Principal principal) {
		String userId = principal.getName();
		List<UserReservationJoinVo> list = usermyinfoservice.getReservationList(userId);
		model.addAttribute("list", list);
		System.out.println(list);
		return "user/myreserve";
	}
	
	@PostMapping("users/reviews")
	public String saveReview(HttpServletRequest request, Principal principal) {
		UserReviewDto dto = new UserReviewDto(request);
		usermyinfoservice.saveUserReview(dto, principal.getName());
		return "redirect:/users/myreserve";
	}
	
	@PostMapping("/users/reviews/{reviewIdx}")
	public String deleteUserReview(@PathVariable int reviewIdx) {
		usermyinfoservice.deleteUserReview(reviewIdx);
		return "redirect:/users/myreserve";
	}
	
	@GetMapping("/users/shopregister")
	public String shopregister() {
		return "user/shopregister";
	}
	
}
