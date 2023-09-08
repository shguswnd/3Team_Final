package dao.admin;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSessionException;

import vo.admin.Chart;

public interface ChartDao {
	public Chart getChartCount(@Param("storeid") String storeId);
	public Chart getChartSales(@Param("storeid") String storeId);
}
