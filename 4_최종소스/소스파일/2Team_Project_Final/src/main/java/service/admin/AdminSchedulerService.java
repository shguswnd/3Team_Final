package service.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.admin.schedulerDao;
import vo.admin.AdminReview;

@Service
public class AdminSchedulerService {

	@Autowired
	private SqlSession sqlsession;
	
	public List<AdminReview> getReviewScheduler(String storeId){
		schedulerDao dao = sqlsession.getMapper(schedulerDao.class);
		return dao.getReviewScheduler(storeId);
	}
	
	public void runStoredProcedure() {
		schedulerDao dao = sqlsession.getMapper(schedulerDao.class);
		dao.runStoredProcedure();
//		sqlsession.selectOne("call_delete_review_data");
	}
}
