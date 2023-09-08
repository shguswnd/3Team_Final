package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.admin.ReservationDao;
import vo.Reservation;

@Service
public class ReservationService {

	private SqlSession sqlsession;
	
	@Autowired
	public ReservationService(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	public List<Reservation> getReservationList(String userid){
		ReservationDao reservationDao = sqlsession.getMapper(ReservationDao.class);
		List<Reservation> list = null;
		try {
			list = reservationDao.getReservations(userid);
		} catch (Exception e) {
			e.getStackTrace();
		}
		return list;
	}
	
	public Reservation userDetail(int idx) {
		Reservation reservation = null;
		ReservationDao reservationDao = sqlsession.getMapper(ReservationDao.class);
		try {
			reservation = reservationDao.getReservation(idx);
		} catch (Exception e) {
			e.getStackTrace();
		}
		return reservation;
	}
	
}
