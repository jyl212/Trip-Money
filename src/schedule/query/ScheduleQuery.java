package schedule.query;

public class ScheduleQuery {	
	public static String Make_Schedule = 
			"insert into schedule values(schedule_no_seq.nextval,?,?,?,?,?,?,0,?,'')";
	
	public static String Make_schedule_days = 
			"insert into schedule_days values(?,?)";
	
	public static String Select_Last_Schedule_no =
			"SELECT schedule_no FROM schedule WHERE ROWNUM = 1 ORDER BY schedule_no DESC";
	
	public static String List_Schedule = 
			"select * from schedule where mem_id = ? order by schedule_no desc";
	
	public static String Update_Scheule =
			"update schedule set schedule_share = ?, note = ? where schedule_no = ?";
	
	public static String Select_Schedule = 
			"select * from schedule where schedule_no = ?";
	
	public static String Delete_Schedule =
			"delete from schedule where schedule_no = ?";
	
	/*public static String Select_Share = 
			"select s.schedule_title, s.start_title, s.end_title, s.like_count, "
			+ "s.mem_id, s.note, "
	*/
	
	
}
