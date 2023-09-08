package service.admin;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.commons.io.IOUtils;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import vo.admin.Email;

@Service
public class MailService{
	
	private SqlSession sqlsession;

	@Autowired
	private JavaMailSender emailSender;
	
	
	@Autowired
	public MailService(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	
//	파일 첨부기능 있는 메일
	public void sendEmail(String fromAddress, Email email, MultipartFile file) throws MessagingException, IOException {
		MimeMessage message = emailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		helper.setFrom(new InternetAddress(fromAddress,"[Hands Free]")); //보낸이
		helper.setTo(email.getToMail()); //받는이
		helper.setCc(email.getCcMail()); //참조
		helper.setSubject(email.getTitle());
		helper.setText(email.getContent(), true);
		
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		helper.addAttachment(MimeUtility.encodeText(fileName, "UTF-8", "B"), new ByteArrayResource(IOUtils.toByteArray(file.getInputStream())));
		
		emailSender.send(message);
	}
	
	
	public void sendEmail(String fromAddress, String toAddress,
			String subject, String msgBody) throws MessagingException, IOException {
		
		MimeMessage message = emailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		//helper.setFrom(fromAddress); //蹂대궦�씠
		message.setFrom(new InternetAddress(fromAddress,"[Hands Free]")); //보내닝
		helper.setTo(toAddress); //받는이
		helper.setSubject(subject);
		helper.setText(msgBody, true);
		
		emailSender.send(message);
		
		}
		

	
}

