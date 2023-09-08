package controller.user;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import service.ReviewService;
import service.user.UserSearchService;

@RestController
@RequestMapping("/item")
public class UserSearchController {
	
	@Autowired
	private ReviewService reviewservice;
	@Autowired
	private UserSearchService usersearchservice;

	
	@RequestMapping(value="", method=RequestMethod.GET)
	public ResponseEntity<?> itemDetail(@RequestParam Map<String, Object> map){
		String storeId = (String)map.get("storeId");
		String profilePath = "\\resources\\defaultProfile\\crown.png";
		Map<String, String> list = usersearchservice.shopOneDetail(storeId);
		String value = "";
		//PROFILE_PATH
		
		System.out.println(list.get("PROFILE_PATH"));
		if(list.get("PROFILE_PATH").equals("/")) {
			list.put("PROFILE_PATH", profilePath);
		}
			
		return new ResponseEntity<>(list, HttpStatus.OK); 
	}
	
	@GetMapping("information")
	public ResponseEntity<?> itemInformation(@RequestParam Map<String, Object> map){
		String storeId = (String)map.get("storeId");
		List<Map<String, String>> list = usersearchservice.shopDetail(storeId);
		System.out.println("userSearchController list : " + list);
		return new ResponseEntity<>(list, HttpStatus.OK); 
	}
	
	@GetMapping("review")
	public ResponseEntity<?> itemReview(@RequestParam Map<String, Object> map){
		String storeid = (String)map.get("storeId");
		System.out.println(storeid);
		List<Map<String, String>> list = reviewservice.getAllReviewList(storeid);
		
		return new ResponseEntity<>(list, HttpStatus.OK);
		
	}	
}
