package vo.admin;

import lombok.Data;

@Data
public class Email {
	private int emailIdx;			// 메일순번
	private String userId;		// 메일보내는 사람 아이디
	private String title;			// 메일제목
	private String content;		//  메일내용
	private String fromMail;	//	보내는사람 Mail
	private String[] toMail;		//  추가된 Mail 수신자
	private String[] ccMail;		//  추가된 참조 Mail 수신자
	
	
}
