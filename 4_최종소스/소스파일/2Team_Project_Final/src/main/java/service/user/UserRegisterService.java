package service.user;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import dao.user.UserRegisterDao;
import vo.user.Users;

@Service
public class UserRegisterService {
	
	private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	//회원가입
	public void insert(Users users){
		UserRegisterDao dao = sqlsession.getMapper(UserRegisterDao.class);
		int result = dao.insertMember(users);
		if(result > 0){
			System.out.println("회원가입 성공");
		}else{
			System.out.println("회원가입 실패");
		}
	}
}
