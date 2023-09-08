package dao.admin;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSessionException;

import vo.Reservation;
import vo.admin.StoreDetails;

public interface ReservationDao {
	
	//예약 개수
	//int getReservationCount(String field, String query) throws ClassNotFoundException, SQLException;
	
	//전체 예약 개수
	List<Reservation> getReservations(@Param("userid") String userid) throws ClassNotFoundException, SqlSessionException;
	
	//유저 상세
	Reservation getReservation(int idx) throws ClassNotFoundException, SQLException;
	
	//점주시간
	Map<String, String> getManageTime(@Param("STOREID") String storeId) throws ClassNotFoundException, SQLException;
	
}
