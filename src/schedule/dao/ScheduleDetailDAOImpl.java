package schedule.dao;

import static fw.DBUtil.close;
import static schedule.query.ScheduleDetailQuery.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import schedule.dto.ScheduleDTO;
import schedule.dto.ScheduleDetailDTO;

public class ScheduleDetailDAOImpl implements ScheduleDetailDAO {

	@Override
	public int insert(String[] mapx, String[] mapy, String[] title, String[] image,String[] contentid,String daysNo, int orderNo,Connection con) throws SQLException {
		int result = 0;
		PreparedStatement ptmt = null;
		for(int i=0;i<mapx.length;i++){
			ptmt=con.prepareStatement(insert);
			
			ptmt.setString(1, title[i]);
			if(orderNo>0){
				ptmt.setInt(2, (orderNo+i+1));
			}else{
				ptmt.setInt(2, (i+1));
			}
			ptmt.setString(3, mapx[i]);
			ptmt.setString(4, mapy[i]);
			ptmt.setString(5, image[i]);
			ptmt.setString(6, daysNo);
			ptmt.setString(7, contentid[i]);
			
			result = ptmt.executeUpdate();
			close(ptmt);
		}
		
		return result;
	}

	@Override
	public int delete(String scheduleno,String day,String contentid, Connection con) throws SQLException {
		int result = 0;
		PreparedStatement ptmt = null;
		String dayNO=scheduleno+"-"+day;
		ptmt=con.prepareStatement(delete);
		System.out.println(contentid);
		ptmt.setString(1, dayNO);
		System.out.println(dayNO);
		ptmt.setString(2,contentid);
		
		result = ptmt.executeUpdate();
		System.out.println(result);
		close(ptmt);
		
		return result;
	}

	@Override
	public ArrayList<Vector<ScheduleDetailDTO>> select(String scheduleNo,int totaldays,Connection con) throws SQLException {
		ArrayList<Vector<ScheduleDetailDTO>> result=new ArrayList<Vector<ScheduleDetailDTO>>();
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		for(int i=1;i<=totaldays;i++){
			String dayNO=scheduleNo+"-"+i;
			ptmt = con.prepareStatement(select);
			ptmt.setString(1, dayNO);
			rs = ptmt.executeQuery();
			Vector<ScheduleDetailDTO> daydata=new Vector<ScheduleDetailDTO>();
			while(rs.next()){
				ScheduleDetailDTO dto=new ScheduleDetailDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5));
				daydata.add(dto);
			}
			result.add(daydata);
			close(rs);
			close(ptmt);
		}
		return result;
	}

	@Override
	public int selectmaxorder(String daysNo,Connection con) throws SQLException {
		int orderno=0;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		
		ptmt = con.prepareStatement(selectmaxorder);
		ptmt.setString(1, daysNo);
		rs = ptmt.executeQuery();
		if(rs.next()){
			orderno=rs.getInt(1);
		}
		close(rs);
		close(ptmt);
		
		return orderno;
	}

}
