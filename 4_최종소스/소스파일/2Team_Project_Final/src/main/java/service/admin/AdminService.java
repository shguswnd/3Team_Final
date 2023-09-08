package service.admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.admin.AdminDao;
import vo.admin.Admin;
import vo.admin.AdminReview;
import vo.admin.CalendarInfo;
import vo.admin.RealReview;
import vo.admin.Store;
import vo.admin.StoreDetails;
import vo.admin.StoreKeeper;
import vo.user.Users;

@Service
@Transactional(readOnly = true)
public class AdminService {

	@Autowired
	private SqlSession sqlsession;

	@Transactional
	public int registerAdmin(Admin admin, StoreKeeper storeKepper, Store store, StoreDetails storeDetails) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		dao.registerAdmin(admin);
		dao.registerStoreKeeper(storeKepper);
		dao.registerStore(store);
		return dao.registerStoreDetails(storeDetails);
	}
	
	public Users findAdminUserByUserId(String userId) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		return dao.findAdminUserByUserId(userId);
	}
	
	public Store findStoreByUserId(String userId) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		return dao.findStoreByStoreId(userId);
	}
	
	public StoreDetails findStoreDetailsByUserId(String userId) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		return dao.findStoreDetailsByStoreId(userId);
	}
	
	@Transactional
	public int updateStoreInfo(Users user, Store store, StoreDetails storeDetails) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		// Users 프로필 필드 update
		dao.updateAdminProfile(user);
		// Store 대표 번호 update
		dao.updateAdminPhone(store);
		// storeDetail cnt, week, sat, sun, notice update
		return dao.updateAdminDetail(storeDetails);
	}
	
	public List<CalendarInfo> getCalendarList(String userId) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		return dao.getCalendarListByUserId(userId);
	}
	
	public List<AdminReview> getAdminReviewListByStoreId(String storeId) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		return dao.getAdminReviewListByStoreId(storeId);
	}
	
	@Transactional
	public int saveAdminReview(RealReview review) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		return dao.saveAdminReview(review);
	}

	@Transactional
	public int deleteAdminReview(int reviewIdx) {
		AdminDao dao = sqlsession.getMapper(AdminDao.class);
		return dao.deleteAdminReview(reviewIdx);
	}
}
