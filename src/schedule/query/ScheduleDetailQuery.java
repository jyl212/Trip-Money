package schedule.query;

public class ScheduleDetailQuery {
	public static String insert="insert into SCHEDULE_DETAIL values(?,?,?,?,?,?,?)";
	public static String select="select mapx,mapy,schedule_title,img,contentid from schedule_detail where schedule_days_no=? order by schedule_order";
	public static String delete="delete SCHEDULE_DETAIL where schedule_days_no=? and contentid=?";
	public static String selectmaxorder="select max(schedule_order) from schedule_detail where schedule_days_no=?";
}
