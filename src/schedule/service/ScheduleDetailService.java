package schedule.service;

import java.util.ArrayList;
import java.util.Vector;

import schedule.dto.ScheduleDetailDTO;

public interface ScheduleDetailService {
	int insert(String[] mapx,String[] mapy,String[] title,String[] image,String[] contentid,String daysNo);
	int delete(String scheduleno,String day,String contentid);
	ArrayList<Vector<ScheduleDetailDTO>> select(String detailNo,int totaldays);
}
