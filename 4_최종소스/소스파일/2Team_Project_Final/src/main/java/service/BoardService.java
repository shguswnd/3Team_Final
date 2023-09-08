package service;

import java.io.FileOutputStream;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import dao.NoticeDao;
import vo.Notice;

@Service
public class BoardService {

	@Autowired
	private SqlSession sqlsession;

	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	//글목록보기 서비스
	public List<Notice> notices(String p, String f, String q){
		
		//default 값 설정
		int page = 1;
		String field="TITLE";
		String query = "%%";
		
		if(p != null && ! p.equals("")) {
			page = Integer.parseInt(p);
		}
		
		if(f != null && f.equals("")) {
			field = f;
		}
		
		if(q != null && q.equals("")) {
			query = q;
		}
		List<Notice> list = null;
		
		try {
			NoticeDao noticedao = sqlsession.getMapper(NoticeDao.class);
			list = noticedao.getNotices(page, field, query);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}	

	
}
