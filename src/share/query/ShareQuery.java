package share.query;

public class ShareQuery {	
	public static String Share_Select = 
			"select sd.img, s.schedule_title, s.note, s.start_date, s.end_date, "
			+ "s.like_count, s.update_date, s.mem_id, "
			+ " s.schedule_share, s.schedule_no, m.nickname "
			+ "from schedule s,schedule_detail sd, schedule_days sdd, member m "
			+ "where s.schedule_no = sdd.schedule_no and "
			+ "sdd.schedule_days_no = sd.schedule_days_no "
			+ "and s.mem_id = m.mem_id "
			+ "and schedule_share = 'Y' "
			+ "and sd.schedule_order=1 and "
			+ "substr( sd.schedule_days_no,instr(sd.schedule_days_no,'-')+1,1)=1";
			

	public static String Share_Select_Search = 
			"select sd.img, s.schedule_title, s.note, s.start_date, s.end_date, "
			+ "s.like_count, s.update_date, s.mem_id, "
			+ " s.schedule_share, s.schedule_no, m.nickname "
			+ "from schedule s,schedule_detail sd, schedule_days sdd, member m "
			+ "where s.schedule_no = sdd.schedule_no and "
			+ "sdd.schedule_days_no = sd.schedule_days_no "
			+ "and s.mem_id = m.mem_id "
			+ "and schedule_share = 'Y' "
			+ "and sd.schedule_order=1 and "
			+ "substr( sd.schedule_days_no,instr(sd.schedule_days_no,'-')+1,1)=1"
			+ "and s.schedule_title like ?";
	
	public static String Thumb_Up =
			"insert into thumb values(?,?)";
	
	public static String Thumb_Down =
			"delete from thumb where schedule_no = ?";	
	
	public static String Like_Count_Up = 
			"update schedule set "
			+ "like_count = "
			+ "(select (like_count)+1 "
			+ "from schedule "
			+ "where schedule_no = ?)"
			+ "where schedule_no = ?";
	
	public static String Like_Count_Down = 
			"update schedule set "
			+ "like_count = "
			+ "(select (like_count)-1 "
			+ "	from schedule "
			+ "where schedule_no = ?)"
			+ "where schedule_no = ?";
	
	public static String Select_Thumb=
			"Select * from thumb where mem_id =? and schedule_no = ? ";
	
	
}
