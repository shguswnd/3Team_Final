package vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {
	private String userName;
	private Date userEdate;
	private int star;
	private String userContent;
	private Date storeEdate;
	private String storeContent;
}