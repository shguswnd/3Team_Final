package service.user;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import controller.user.dto.UserReviewDto;
import dao.user.UserMyinfoDao;
import vo.UserReservationJoinVo;
import vo.user.Users;

@Service
public class UserMyinfoService {
	
	@Autowired
	private SqlSession sqlsession;

	//내 정보 상세보기 서비스
	public Users userDetail(String userid) {
		Users users = null;
		try {
			 	UserMyinfoDao userdao = sqlsession.getMapper(UserMyinfoDao.class);
			 	users = userdao.userDetail(userid);
		} catch (ClassNotFoundException e) {
						e.printStackTrace();
		} catch (SQLException e) {
						e.printStackTrace();
		}
		return users;		
	}

	// 내 정보 수정하기 서비스
	public int userUpdate(Users users) { //userid 잘 넘어옴
		int result = 0;
		try {

			UserMyinfoDao usermyinfodao = sqlsession.getMapper(UserMyinfoDao.class);

			result = usermyinfodao.userUpdate(users);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 내 정보 삭제하기 서비스	
	public int userDelete(String userid) {
		int result = 0;
		UserMyinfoDao usermyinfodao = sqlsession.getMapper(UserMyinfoDao.class);
		try {
			result = usermyinfodao.userDelete(userid);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	//예약 내역 상세보기
	public List<Map<String, String>> reserveInfo(String userid) {
		List<Map<String, String>> list = null;

		try {
		 	UserMyinfoDao userdao = sqlsession.getMapper(UserMyinfoDao.class);
		 	list = userdao.reserveInfo(userid);
		} catch (ClassNotFoundException e) {
						e.printStackTrace();
		} catch (SQLException e) {
						e.printStackTrace();
		}
		System.out.println("myinfo서비스 list : " + list);

		return list;
		
	}

	// 사용자 예약 내역 가져오기
	public List<UserReservationJoinVo> getReservationList(String userId) {
		UserMyinfoDao dao = sqlsession.getMapper(UserMyinfoDao.class);
		return dao.getMyReservationListV2(userId);
	}
	
	// 사용자 리뷰 저장하기
	@Transactional
	public int saveUserReview(UserReviewDto dto, String userId) {
		UserMyinfoDao dao = sqlsession.getMapper(UserMyinfoDao.class);
		String userFullName = dao.getUserFullName(userId);
		System.out.println(userFullName);
		return dao.saveUserReview(dto.toUserReview(userFullName));
	}

	@Transactional
	public int deleteUserReview(int reviewIdx) {
		UserMyinfoDao dao = sqlsession.getMapper(UserMyinfoDao.class);
		return dao.deleteUserReview(reviewIdx);
	}
}
