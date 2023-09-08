package service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.admin.ReviewDao;
import vo.Review;

@Service
public class ReviewService {

	private SqlSession sqlsession;
	
	@Autowired
	public ReviewService(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	//점주쪽에서 리뷰 가져오기
	public List<Review> getReviewList(String userId){
		ReviewDao reviewDao = sqlsession.getMapper(ReviewDao.class);
		List<Review> reviewList=null;
		try {
			reviewList = reviewDao.getReviews(userId);
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		return reviewList;
	}
	
	//사용자쪽에서 리뷰 가져오기
	public List<Map<String, String>> getReviewListUser(String storeId){
		ReviewDao reviewDao = sqlsession.getMapper(ReviewDao.class);
		List<Map<String, String>> userReviewList=null;
		try {
			userReviewList = reviewDao.getReviewListUser(storeId);
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		System.out.println("reviewService userReviewList : " + userReviewList);
		return userReviewList;
	}

	
	public List<Map<String, String>> getAllReviewList(String storeId){
		ReviewDao reviewDao = sqlsession.getMapper(ReviewDao.class);
		List<Map<String, String>> userReviewList=null;
		try {
			userReviewList = reviewDao.getAllReviewList(storeId);
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		System.out.println("reviewService userReviewList : " + userReviewList);
		return userReviewList;
	}
	
	
}
