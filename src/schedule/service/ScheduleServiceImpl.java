package schedule.service;

import static fw.DBUtil.close;
import static fw.DBUtil.getConnection;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import schedule.dao.ScheduleDAO;
import schedule.dao.ScheduleDAOImpl;
import schedule.dto.ScheduleDTO;

public class ScheduleServiceImpl implements ScheduleService{

	@Override
	public int deleteSchedule(int schedule_no) {
		int result = 0;
		ScheduleDAO dao = new ScheduleDAOImpl();
		
		Connection con = null;
		con = getConnection();
		try {
			con = getConnection();
			result = dao.deleteSchedule(schedule_no, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(con);
		}
		
		return result;
	}

	@Override
	public ScheduleDTO selectSchedule(int schedule_no) {
		ScheduleDTO scheduledata = null;
		
		ScheduleDAO dao = new ScheduleDAOImpl();
		
		Connection con = null;
		con = getConnection();
		try {
			con = getConnection();
			scheduledata = dao.selectSchedule(schedule_no, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(con);
		}
		
		return scheduledata;
	}

	@Override
	public int updateShare(String schedule_share, String note, int schedule_no) {
		int result = 0;
		ScheduleDAO dao = new ScheduleDAOImpl();
		
		Connection con = null;
		con = getConnection();
		try {
			con = getConnection();
			result = dao.updateShare(schedule_share, note, schedule_no, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(con);
		}
		
		return result;
	}

	@Override
	public int makeSchedule(ScheduleDTO makeScheduledto) {

		int result = 0;
		
		ScheduleDAO dao = new ScheduleDAOImpl();
		
		Connection con = null;
		con = getConnection();
		boolean state = false;
		try {
			con = getConnection();
			con.setAutoCommit(false);
			
			dao.makeSchedule(makeScheduledto, con);
			int schedule_no = dao.last_Schedule_no(con);
			String start = makeScheduledto.getStart_date();
			start = start.split("/")[0]+start.split("/")[1]+start.split("/")[2];
			System.out.println(start+" start");
			String end = makeScheduledto.getEnd_date();
			end = end.split("/")[0]+end.split("/")[1]+end.split("/")[2];
			String schedule_days_no = schedule_no+"-";
			System.out.println(schedule_days_no);
			long diff = 0;
		    long detaildays = 0;
		    try {
		        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		        Date beginDate = formatter.parse(start);
		        System.out.println(beginDate+" beginDate");
		        Date endDate = formatter.parse(end);
		         
		        diff = endDate.getTime() - beginDate.getTime();
		        detaildays = diff / (24 * 60 * 60 * 1000)+1;
		         
		    } catch (ParseException e) {
		        e.printStackTrace();
		    }
		    
		    for(int i=1; i<=detaildays;i++){
		    	schedule_days_no = schedule_no+"-"+i;
		    	dao.makeScheduleDays(schedule_days_no, schedule_no, con);
		    }
		    state = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
				try{
					if(state){
						con.commit();
					}else{
						con.rollback();
					}
				}catch(SQLException e){
					
				}
				
			close(con);
		}
		
		return result;
	}
	
	@Override
	public ArrayList<ScheduleDTO> listSchedule(String mem_id) {
		ArrayList<ScheduleDTO> schedulelist = null;
		
		ScheduleDAO dao = new ScheduleDAOImpl();
		
		Connection con = null;
		con = getConnection();
		try {
			con = getConnection();
			schedulelist = dao.listSchedule(mem_id, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(con);
		}
		
		return schedulelist;
	}
	
	

}
