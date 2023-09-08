package dao.admin;

import java.util.List;

import vo.admin.AdminReview;

public interface schedulerDao {
	public List<AdminReview> getReviewScheduler(String storeId);
	public void runStoredProcedure();
}
