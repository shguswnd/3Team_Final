package dao.user;

import java.sql.SQLException;
import org.apache.ibatis.annotations.Param;
import vo.admin.Store;
import vo.user.Payment;

public interface PaymentDao {
	
	//결제
	public int insertPayment(Payment payment) throws ClassNotFoundException, SQLException;
	
	//상점정보가져오기
	public Store findStoreByStoreId(@Param("STOREID") String storeId);
}
