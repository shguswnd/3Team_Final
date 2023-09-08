package service.user;



import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.admin.ReservationDao;
import dao.user.PaymentDao;
import vo.admin.Store;
import vo.admin.StoreDetails;
import vo.user.Payment;

@Service
public class PaymentService {
	
private SqlSession sqlsession;
	
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	//결제
	public int insertPayment(Payment payment){
		int result = 0;
		System.out.println(payment.toString());
		PaymentDao dao = sqlsession.getMapper(PaymentDao.class);
		try {
			result = dao.insertPayment(payment);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//상점 상세보기
	public Store findStoreByUserId(String storeId) {
		PaymentDao dao = sqlsession.getMapper(PaymentDao.class);
		return dao.findStoreByStoreId(storeId);
	}
	
	//상점 시간
	public Map<String, String> findStoreTime(String storeId){
		Map<String, String> map = null;
		try {
			ReservationDao dao = sqlsession.getMapper(ReservationDao.class);
			map = dao.getManageTime(storeId);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
					e.printStackTrace();
		}
		
		return map; 
	}

}
