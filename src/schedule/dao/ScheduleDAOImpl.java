package schedule.dao;

import static fw.DBUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import schedule.dto.ScheduleDTO;
import static schedule.query.ScheduleQuery.*;
import static fw.DBUtil.*;
public class ScheduleDAOImpl implements ScheduleDAO{

	@Override
	public ScheduleDTO selectSchedule(int schedule_no, Connection con) throws SQLException {
		ScheduleDTO scheduledata = null;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		ptmt = con.prepareStatement(Select_Schedule);
		
		ptmt.setInt(1, schedule_no);

		rs = ptmt.executeQuery();

		while(rs.next()){
			scheduledata = new ScheduleDTO(
									rs.getInt(1), 
									rs.getString(2), 
									rs.getString(3), 
									rs.getString(4),
									rs.getInt(5),
									rs.getString(6),
									rs.getString(7),
									rs.getString(8));
		}
		
		close(rs);
		close(ptmt);

		return scheduledata;
	}

	@Override
	public int updateShare(String schedule_share, String note, int schedule_no, Connection con) throws SQLException {
		int result = 0;
		PreparedStatement ptmt = null;
		
		ptmt=con.prepareStatement(Update_Scheule);
		
		ptmt.setString(1, schedule_share);
		ptmt.setString(2, note);
		ptmt.setInt(3, schedule_no);
		
		result = ptmt.executeUpdate();
		close(ptmt);
		
		return result;
	}

	@Override
	public int deleteSchedule(int schedule_no, Connection con) throws SQLException {
		
		int result = 0;
		PreparedStatement ptmt = null;
		
		ptmt=con.prepareStatement(Delete_Schedule);
		
		ptmt.setInt(1, schedule_no);
		
		result = ptmt.executeUpdate();
		close(ptmt);
		
		return result;
	}

	@Override
	public int makeSchedule(ScheduleDTO makeScheduledto, Connection con) throws SQLException {
		
		int result = 0;
		PreparedStatement ptmt = null;
		
		ptmt = con.prepareStatement(Make_Schedule);
		
		ptmt.setString(1, makeScheduledto.getSchedule_title());
		ptmt.setString(2, makeScheduledto.getStart_date());
		ptmt.setString(3, makeScheduledto.getEnd_date());
		ptmt.setInt(4, makeScheduledto.getPerson());
		ptmt.setString(5, makeScheduledto.getUpdate_date());
		ptmt.setString(6, makeScheduledto.getSchedule_share());
		ptmt.setString(7, makeScheduledto.getMem_id());
		
		//sql½ÇÇà
		result = ptmt.executeUpdate();
		close(ptmt);
		
		return result;
	}
	
	@Override
	public int makeScheduleDays(String schedule_days_no, int schedule_no, Connection con) throws SQLException {
		
		int result = 0;
		PreparedStatement ptmt = null;
		ptmt = con.prepareStatement(Make_schedule_days);
		
		ptmt.setString(1, schedule_days_no);
		ptmt.setInt(2, schedule_no);
		
		result = ptmt.executeUpdate();
		close(ptmt);
		
		return result;
	}
	

	@Override
	public int last_Schedule_no(Connection con) throws SQLException {
		int schedule_no = 0;
		
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		ptmt = con.prepareStatement(Select_Last_Schedule_no);
		rs = ptmt.executeQuery();
		
		while(rs.next()){
			schedule_no = rs.getInt(1);
		}
		
		close(ptmt);
		
		
		return schedule_no;
	}

	@Override
	public ArrayList<ScheduleDTO> listSchedule(String mem_id, Connection con) throws SQLException {
		
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		ArrayList<ScheduleDTO> list = new ArrayList<>();
		
		ptmt = con.prepareStatement(List_Schedule);
		ptmt.setString(1, mem_id);

		rs = ptmt.executeQuery();

		while(rs.next()){
			ScheduleDTO dto = new ScheduleDTO(
									rs.getInt(1), 
									rs.getString(2), 
									rs.getString(3), 
									rs.getString(4),
									rs.getInt(5),
									rs.getString(6),
									rs.getString(7),
									rs.getString(8));
			list.add(dto);
		}
		
		close(rs);
		close(ptmt);
		
		
		return list;
	}
	
	

	
	
	

}
