package schedule.service;

import static fw.DBUtil.close;
import static fw.DBUtil.getConnection;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import schedule.dao.ScheduleDetailDAO;
import schedule.dao.ScheduleDetailDAOImpl;
import schedule.dto.ScheduleDetailDTO;
public class ScheduleDetailServiceImpl implements ScheduleDetailService {
	@Override
	public int insert(String[] mapx, String[] mapy, String[] title, String[] image,String[] contentid,String daysNo) {
		int result = 0;
		int orderno=0;
		ScheduleDetailDAO dao=new ScheduleDetailDAOImpl();
		
		Connection con = null;
		try {
			con = getConnection();
			orderno=dao.selectmaxorder(daysNo, con);
			result = dao.insert(mapx, mapy, title, image, contentid,daysNo,orderno,con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(con);
		}
		
		return result;
	}

	@Override
	public int delete(String scheduleno,String day,String contentid) {
		int result = 0;
		ScheduleDetailDAO dao=new ScheduleDetailDAOImpl();
		
		Connection con = null;
		try {
			con = getConnection();
			result = dao.delete(scheduleno,day,contentid,con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(con);
		}
		
		return result;
	}

	@Override
	public ArrayList<Vector<ScheduleDetailDTO>> select(String detailNo, int totaldays) {
		ArrayList<Vector<ScheduleDetailDTO>> result=new ArrayList<Vector<ScheduleDetailDTO>>();
		ScheduleDetailDAO dao=new ScheduleDetailDAOImpl();
		
		Connection con = null;
		try {
			con = getConnection();
			result = dao.select(detailNo,totaldays,con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(con);
		}
		
		return result;
	}
}
