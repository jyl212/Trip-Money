package share.dao;

import static fw.DBUtil.close;
import static schedule.query.ScheduleQuery.Delete_Schedule;
import static schedule.query.ScheduleQuery.Update_Scheule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import share.dto.ShareDTO;
import static fw.DBUtil.*;
import static share.query.ShareQuery.*;

public class ShareDAOImpl implements ShareDAO{

	@Override
	public int thumbUp(String mem_id, String schedule_no, Connection con) throws SQLException {
		
		int result = 0;
		PreparedStatement ptmt = null;
		
		ptmt=con.prepareStatement(Thumb_Up);
		
		ptmt.setString(1, mem_id);
		ptmt.setString(2, schedule_no);
		
		result = ptmt.executeUpdate();
		close(ptmt);
		
		return result;
	}

	@Override
	public int thumbDown(String schedule_no, Connection con) throws SQLException {
		int result = 0;
		PreparedStatement ptmt = null;
		
		ptmt=con.prepareStatement(Thumb_Down);
		
		ptmt.setString(1, schedule_no);
		
		result = ptmt.executeUpdate();
		close(ptmt);
		
		return result;
	}

	@Override
	public int LikeCountUp(String schedule_no, Connection con) throws SQLException {
		
		int result = 0;
		PreparedStatement ptmt = null;
		
		ptmt=con.prepareStatement(Like_Count_Up);
		
		ptmt.setString(1, schedule_no);
		ptmt.setString(2, schedule_no);
		
		result = ptmt.executeUpdate();
		close(ptmt);
		
		return result;
	}

	@Override
	public int LikeCountDown(String schedule_no, Connection con) throws SQLException {
		
		int result = 0;
		PreparedStatement ptmt = null;
		
		ptmt=con.prepareStatement(Like_Count_Down);
		
		ptmt.setString(1, schedule_no);
		ptmt.setString(2, schedule_no);
		
		result = ptmt.executeUpdate();
		close(ptmt);
		
		return result;
	}

	@Override
	public ArrayList<ShareDTO> listALL(Connection con) throws SQLException {
		
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		ArrayList<ShareDTO> list = new ArrayList<>();
		
		ptmt = con.prepareStatement(Share_Select);

		rs = ptmt.executeQuery();

		while(rs.next()){
			ShareDTO dto = new ShareDTO(
									rs.getString(1), //img
									rs.getString(2), 
									rs.getString(3), 
									rs.getString(4),
									rs.getString(5),
									rs.getString(6),
									rs.getString(7),
									rs.getString(8),
									rs.getString(9),
									rs.getString(10),
									rs.getString(11)
									);
			list.add(dto);
		}
		
		close(rs);
		close(ptmt);
		
		
		return list;
	}

	@Override
	public ArrayList<ShareDTO> searchList(String keyword, Connection con) throws SQLException {
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		ArrayList<ShareDTO> list = new ArrayList<>();
		
		ptmt = con.prepareStatement(Share_Select_Search);
		ptmt.setString(1, "%"+keyword+"%");

		rs = ptmt.executeQuery();

		while(rs.next()){
			ShareDTO dto = new ShareDTO(
									rs.getString(1), //img
									rs.getString(2), 
									rs.getString(3), 
									rs.getString(4),
									rs.getString(5),
									rs.getString(6),
									rs.getString(7),
									rs.getString(8),
									rs.getString(9),
									rs.getString(10),
									rs.getString(11)
									);
			list.add(dto);
		}
		
		close(rs);
		close(ptmt);
		
		
		return list;
	}

	@Override
	public int SelectThumb(String mem_id, String schedule_no, Connection con) throws SQLException {
		
		int result = 0;
		PreparedStatement ptmt = null;
		
		ptmt=con.prepareStatement(Select_Thumb);
		
		ptmt.setString(1, mem_id);
		ptmt.setString(2, schedule_no);
		
		result = ptmt.executeUpdate();
		close(ptmt);
		
		return result;
	}

	
}
