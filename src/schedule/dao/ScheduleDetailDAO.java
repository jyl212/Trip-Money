package schedule.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import schedule.dto.ScheduleDetailDTO;

public interface ScheduleDetailDAO {
	int insert(String[] mapx,String[] mapy,String[] title,String[] image,String[] contentid,String daysNo,int orderNo, Connection con) throws SQLException;
	int delete(String scheduleno,String day,String contentid, Connection con) throws SQLException;
	ArrayList<Vector<ScheduleDetailDTO>> select(String scheduleNo,int totaldays,Connection con) throws SQLException;
	int selectmaxorder(String daysNo,Connection con) throws SQLException;
}
