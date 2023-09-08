package service.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.user.UserSearchDao;

@Service
public class UserSearchService {
	@Autowired
	private SqlSession sqlsession;
	
	
	public List<Map<String, String>> getStore(String storeId){
		List<Map<String, String>> list = null;
		try {
			UserSearchDao userSearchDao = sqlsession.getMapper(UserSearchDao.class);
			list = userSearchDao.selectStore();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("getStore list 프로필 경로 있는지 : " + list);
		return list;
	}

	public List<Map<String, String>> shopDetail(String storeId){
		List<Map<String, String>> list = null;
		try {
			UserSearchDao userSearchDao = sqlsession.getMapper(UserSearchDao.class);
			list = userSearchDao.shopDetail(storeId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("shopDetail list : " + list);
		return list;
	}
	
	public Map<String, String> shopOneDetail(String storeId){
		Map<String, String> list = null;
		try {
			UserSearchDao userSearchDao = sqlsession.getMapper(UserSearchDao.class);
			list = userSearchDao.shopOneDetail(storeId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("shopDetail list : " + list);
		return list;
	}	
	
}
