package service.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.admin.ChartDao;
import vo.admin.Chart;

@Service
public class ChartService {
	
	private SqlSession sqlsession;
	
	@Autowired
	public ChartService(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}

	public Chart getChartCount(String storeId){
		ChartDao chartDao = sqlsession.getMapper(ChartDao.class);
		return chartDao.getChartCount(storeId);
	}
	public Chart getChartSales(String storeId){
		ChartDao chartDao = sqlsession.getMapper(ChartDao.class);
		return chartDao.getChartSales(storeId);
	}
	
}
