package schedule.dto;

public class ScheduleDTO {
	
	private int schedule_no;
	private String schedule_title;
	private String start_date;
	private String end_date;
	private int person;
	private String update_date ;
	private String schedule_share;
	private String mem_id;
	
	
	public ScheduleDTO() {
		super();
	}
	
	public ScheduleDTO(String schedule_title, String start_date, String end_date, int person, String update_date,
			String schedule_share, String mem_id) {
		super();
		this.schedule_title = schedule_title;
		this.start_date = start_date;
		this.end_date = end_date;
		this.person = person;
		this.update_date = update_date;
		this.schedule_share = schedule_share;
		this.mem_id = mem_id;
	}

	public ScheduleDTO(int schedule_no, String schedule_title, String start_date, String end_date, int person,
			String update_date, String schedule_share, String mem_id) {
		super();
		this.schedule_no = schedule_no;
		this.schedule_title = schedule_title;
		this.start_date = start_date;
		this.end_date = end_date;
		this.person = person;
		this.update_date = update_date;
		this.schedule_share = schedule_share;
		this.mem_id = mem_id;
	}

	public int getSchedule_no() {
		return schedule_no;
	}

	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}

	public String getSchedule_share() {
		return schedule_share;
	}

	public void setSchedule_share(String schedule_share) {
		this.schedule_share = schedule_share;
	}

	public String getSchedule_title() {
		return schedule_title;
	}

	public void setSchedule_title(String schedule_title) {
		this.schedule_title = schedule_title;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public int getPerson() {
		return person;
	}

	public void setPerson(int person) {
		this.person = person;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
}
