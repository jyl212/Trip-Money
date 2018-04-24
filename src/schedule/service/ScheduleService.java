package schedule.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import schedule.dto.ScheduleDTO;

public interface ScheduleService {
	
	int makeSchedule (ScheduleDTO makeScheduledto);
	ArrayList<ScheduleDTO> listSchedule (String mem_id);
	int updateShare (String schedule_share, String note, int schedule_no);
	ScheduleDTO selectSchedule(int schedule_no);
	int deleteSchedule (int schedule_no);
	
}
