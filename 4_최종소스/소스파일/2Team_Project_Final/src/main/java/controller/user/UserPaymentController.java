package controller.user;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import service.user.PaymentService;
import service.user.UserMyinfoService;
import vo.admin.Store;
import vo.admin.StoreDetails;
import vo.user.Payment;
import vo.user.Users;

@Controller
public class UserPaymentController {
	
	@Autowired
	private PaymentService paymentservice;
	
	@Autowired
	private UserMyinfoService usermyinfoservice;
	
	@GetMapping("/users/userBook")
	public String userBook(Model model, 
						   @RequestParam("STOREID") String storeId, @RequestParam("sDate") String sDate, @RequestParam("eDate") String eDate,
						   Authentication auth) throws ParseException{
		
		String userId = auth.getName();
		Store store = paymentservice.findStoreByUserId(storeId);
		Map<String, String> listTime = paymentservice.findStoreTime(storeId);
		
		String[] timeString = listTime.get("MANAGE_WEEK_TIME").split("~");
		String startTime = timeString[0].replace("오전", "").replace("오후", "");
		String endTime = timeString[1].replace("오전", "").replace("오후", "");

		String[] startSplit = startTime.split(":");
		int startHour = Integer.parseInt(startSplit[0]);
		int startMinute = Integer.parseInt(startSplit[1].substring(0,2));
		
		
		String[] endSplit = endTime.split(":");
		int endHour = Integer.parseInt(endSplit[0]) + 12;
		int endMinute = Integer.parseInt(endSplit[1].substring(0,2));

		List<String> timeList = new ArrayList<String>();
		for(int data = startHour; data<= endHour ; data++) {
			String tmp = Integer.toString(data) + ":00 ~ " + Integer.toString(data+1) + ":00";
			timeList.add(tmp);
		}

		model.addAttribute("userId", userId);
		model.addAttribute("storeName", store.getName());
		model.addAttribute("address", store.getAddress());
		model.addAttribute("phone", store.getPhone());
		model.addAttribute("storeId", storeId);
		model.addAttribute("sDate", sDate);
		model.addAttribute("eDate", eDate);
		model.addAttribute("timeList", timeList);
		
		
		
		return "user/book";
	}
	
	
	//결제 데이터 처리
	@RequestMapping("/users/paymentData")
	public void paymentData(@RequestParam Map<String, Object> map, Principal pri) throws ParseException {
		
		System.out.println(map.toString());
		String name = (String) map.get("name");
		String storeidData = (String)map.get("storeid");
		String storeid = storeidData.substring(6);

		String ori_sDate = (String) map.get("sTime");	
		String new_sDate = " " + ori_sDate.substring(0,5)+":00";
		
		String ori_eDate = (String) map.get("eTime");
		String new_eDate = " " + ori_eDate.substring(8,13)+":00";
		
				
		
		//처음날짜시간sDate
		String sDate = (String) map.get("sDate") + new_sDate;
		
		System.out.println(sDate);
		
		SimpleDateFormat sformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date sdate = sformat.parse(sDate);
		
		System.out.println(sdate);
		
		SimpleDateFormat soutputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sformaString = soutputFormat.format(sdate);
		
		System.out.println(sformaString);
		
		
		//마지막날짜
		String eDate = (String) map.get("eDate") + new_eDate;
		SimpleDateFormat eformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date edate = eformat.parse(eDate);
		
		System.out.println(edate);
		
		SimpleDateFormat eoutputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String eformaString = eoutputFormat.format(edate);
		
		
		System.out.println(eformaString);
		
		long diffInMillies = edate.getTime() - sdate.getTime();
		// 시간 차이를 밀리초로 계산

		long diffInSeconds = diffInMillies / 1000;
		// 시간 차이를 초로 변환

		long diffInMinutes = diffInSeconds / 60;
		// 시간 차이를 분으로 변환

		long diffInHours = diffInMinutes / 60;
		// 시간 차이를 시간으로 변환
		
		int price = (int)(diffInHours) * 2000;
		
		
		if(name.equals(""))
		{
			String userid = pri.getName();
			Users users =  usermyinfoservice.userDetail(userid);
			
			String lastname = users.getLast_name(); //이름
			String firstname = users.getFirst_name(); //성
			name = firstname + lastname; //풀네임	
		}
		Payment payment = Payment.builder()
				.userid((String)map.get("userId"))
				.storeid(storeid)
				.name(name)
				.cnt(1)
				.price(price)
				.payment_method("toss")
				.payment_date(new Date())
				.sdate(sdate)
				.edate(edate)
				.status(1)
				.build();
		
		paymentservice.insertPayment(payment);
		
		
	}
	//결제 처리
	@RequestMapping("/users/paymentreserve") 
	public String userBook (@RequestParam Map<String, Object> map, Principal pri,
							Model model) {
		
		String userid = pri.getName();
		int result = 10;

		
		String icon = "";
		String msg = "";
		String url = "";
		
		
		//결제 됐는지 확인
	      if (result < 1) {
	         icon = "error";
	         msg = "결제 실패 ㅠㅠ";
	         url = "/";
	      } else {
	         icon = "success";
	         msg = "결제 성공!";
	         url = "/users/myreserve";
	      }
	      
	      //model.addAttribute("name", fullname);	    
  
	      model.addAttribute("msg", msg);
	      model.addAttribute("url", url);
	      model.addAttribute("icon", icon);
	      



		return "common/redirect"; 
	}
}
