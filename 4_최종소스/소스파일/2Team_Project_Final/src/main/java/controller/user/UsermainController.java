package controller.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import service.user.UserSearchService;

@Controller
public class UsermainController {
	
	@Autowired
	private UserSearchService userSearchService;
	
	@GetMapping("search")
	public String home(HttpServletRequest httpServletRequest, Model model) {
		String destination = httpServletRequest.getParameter("destination");		
		String dropDate = httpServletRequest.getParameter("dropDate");
		String pickupDate = httpServletRequest.getParameter("pickupDate");
		String sDate = httpServletRequest.getParameter("sdate");
		String eDate = httpServletRequest.getParameter("edate");

		
		model.addAttribute("destination", destination);
		model.addAttribute("dropDate", dropDate);
		model.addAttribute("pickupDate", pickupDate);
		model.addAttribute("sDate", sDate);
		model.addAttribute("eDate", eDate);
		return "/user/search";
	}
	//	public ResponseEntity<?> getStore(@RequestParam Map<String, String> position){
	/*
	 		String latitude = position.get("latitude");
		String longitude = position.get("longitude");
		
		매퍼
				where
		<![CDATA[st.latitude <= #{latitude} and st.longitude <=  #{longitude}]]>

		
	 */
	@GetMapping("selectStore")
	public ResponseEntity<?> getStore(String storeId){
//		List<Map<String, String>> list =  userSearchService.getStore(latitude, longitude);
		List<Map<String, String>> list =  userSearchService.getStore(storeId);
		System.out.println(list);
		System.out.println(list.toString());
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
}
