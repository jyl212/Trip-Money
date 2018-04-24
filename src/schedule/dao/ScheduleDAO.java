package schedule.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import schedule.dto.ScheduleDTO;

public interface ScheduleDAO {
	
	//일정만들기
	int makeSchedule (ScheduleDTO makeScheduledto, Connection con) throws SQLException;
	
	//일정_DAYS 만들기
	int makeScheduleDays (String schedule_days_no, int schedule_no, Connection con) throws SQLException;
	
	//마지막 schedule_no 가져오기
	int last_Schedule_no(Connection con) throws SQLException;
	
	//일정리스트 가져오기
	ArrayList<ScheduleDTO> listSchedule (String mem_id, Connection con) throws SQLException;
	
	//일정가져오기
	ScheduleDTO selectSchedule(int schedule_no, Connection con) throws SQLException;
	
	//공유 업데이트하기
	int updateShare (String schedule_share, String note, int schedule_no, Connection con) throws SQLException;
	
	//일정 지우기
	int deleteSchedule (int schedule_no, Connection con) throws SQLException;
	
	

}
