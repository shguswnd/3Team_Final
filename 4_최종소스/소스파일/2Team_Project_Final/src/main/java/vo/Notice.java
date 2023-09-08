package vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;



public class Notice {
	private String seq;
	private String title;
	private String writer;
	private String content;
	private Date regdate;
	private int hit;
	private String fileSrc;
	
	private List<CommonsMultipartFile> files;
	



}
