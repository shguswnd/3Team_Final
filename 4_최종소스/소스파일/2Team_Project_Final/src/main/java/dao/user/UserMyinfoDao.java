package dao.user;

import java.sql.SQLException;
import java.util.List;

import vo.UserReservationJoinVo;
import vo.user.UserReview;
import java.util.Map;

import vo.user.Users;

public interface UserMyinfoDao {
	//내 정보 상세
	Users userDetail(String userid) throws ClassNotFoundException, SQLException;
	
	//내 정보 수정
	int userUpdate(Users users) throws ClassNotFoundException, SQLException;

	//내 정보 삭제
	int  userDelete(String userid) throws ClassNotFoundException, SQLException;
	
	//예약 내역 상세
	List<Map<String, String>> reserveInfo(String userid) throws ClassNotFoundException, SQLException;
	
	// 내 예약 정보 조회
	public List<UserReservationJoinVo> getMyReservationList(String userid);
	
	// 사용자 full Name 얻기
	public String getUserFullName(String userId);
	
	// 사용자 review 저장 하기
	public int saveUserReview(UserReview review);

	// 내 예약 정보 조회 V2
	public List<UserReservationJoinVo> getMyReservationListV2(String userid);

	// 내 예약 후기 삭제
	public int deleteUserReview(int reviewIdx);
}
