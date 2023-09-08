package dao.user;


import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface UserSearchDao {
	//가게 검색
//	List<Map<String, String>> selectStore(@Param("latitude")String latitude, @Param("longitude") String longitude) throws ClassNotFoundException, SQLException;

	//검색버튼 눌렀을 때 띄우는거
	List<Map<String, String>> selectStore() throws ClassNotFoundException, SQLException;
	
	//상세정보 눌렀을 때 띄우는거
	List<Map<String, String>> shopDetail(@Param("storeid") String storeId) throws ClassNotFoundException, SQLException;

	//상세정보 눌렀을 때 하나만
	Map<String, String> shopOneDetail(@Param("storeid") String storeId) throws ClassNotFoundException, SQLException;
	
}
