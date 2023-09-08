package dao.admin;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.admin.Admin;
import vo.admin.AdminReview;
import vo.admin.CalendarInfo;
import vo.admin.RealReview;
import vo.admin.Store;
import vo.admin.StoreDetails;
import vo.admin.StoreKeeper;
import vo.user.Users;

public interface AdminDao {
	public int registerAdmin(Admin admin);
	public int registerStore(Store store);
	public int registerStoreKeeper(StoreKeeper keeper);
	public int registerStoreDetails(StoreDetails storeDetails);
	public Users findAdminUserByUserId(@Param("userid") String userId);
	public Store findStoreByStoreId(@Param("storeid") String storeId);
	public StoreDetails findStoreDetailsByStoreId(@Param("storeid") String storeId);
	public int updateAdminProfile(Users user);
	public int updateAdminPhone(Store store);
	public int updateAdminDetail(StoreDetails storeDetails);
	public List<CalendarInfo> getCalendarListByUserId(String userId);
	public List<AdminReview> getAdminReviewListByStoreId(String storeId);
	public int saveAdminReview(RealReview review);
	public int deleteAdminReview(int reviewIdx);
}
