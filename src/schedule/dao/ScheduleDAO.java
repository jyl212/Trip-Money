package schedule.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import schedule.dto.ScheduleDTO;

public interface ScheduleDAO {
	
	//���������
	int makeSchedule (ScheduleDTO makeScheduledto, Connection con) throws SQLException;
	
	//����_DAYS �����
	int makeScheduleDays (String schedule_days_no, int schedule_no, Connection con) throws SQLException;
	
	//������ schedule_no ��������
	int last_Schedule_no(Connection con) throws SQLException;
	
	//��������Ʈ ��������
	ArrayList<ScheduleDTO> listSchedule (String mem_id, Connection con) throws SQLException;
	
	//������������
	ScheduleDTO selectSchedule(int schedule_no, Connection con) throws SQLException;
	
	//���� ������Ʈ�ϱ�
	int updateShare (String schedule_share, String note, int schedule_no, Connection con) throws SQLException;
	
	//���� �����
	int deleteSchedule (int schedule_no, Connection con) throws SQLException;
	
	

}
