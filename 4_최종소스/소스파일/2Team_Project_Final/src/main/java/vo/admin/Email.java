package vo.admin;

import lombok.Data;

@Data
public class Email {
	private int emailIdx;			// ���ϼ���
	private String userId;		// ���Ϻ����� ��� ���̵�
	private String title;			// ��������
	private String content;		//  ���ϳ���
	private String fromMail;	//	�����»�� Mail
	private String[] toMail;		//  �߰��� Mail ������
	private String[] ccMail;		//  �߰��� ���� Mail ������
	
	
}
