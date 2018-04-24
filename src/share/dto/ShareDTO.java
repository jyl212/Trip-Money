package share.dto;

public class ShareDTO {
	private String img;
	private String schedule_title;
	private String note;
	private String start_date;
	private String end_date;
	private String like_count;
	private String update_date;
	private String mem_id;
	private String schedule_share;
	private String schedule_no;
	private String nickname;
	
	
	
	public ShareDTO(String img, String schedule_title, String note, String start_date, String end_date,
			String like_count, String update_date, String mem_id, String schedule_share, String schedule_no,
			String nickname) {
		super();
		this.img = img;
		this.schedule_title = schedule_title;
		this.note = note;
		this.start_date = start_date;
		this.end_date = end_date;
		this.like_count = like_count;
		this.update_date = update_date;
		this.mem_id = mem_id;
		this.schedule_share = schedule_share;
		this.schedule_no = schedule_no;
		this.nickname = nickname;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getSchedule_no() {
		return schedule_no;
	}

	public void setSchedule_no(String schedule_no) {
		this.schedule_no = schedule_no;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getSchedule_title() {
		return schedule_title;
	}

	public void setSchedule_title(String schedule_title) {
		this.schedule_title = schedule_title;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
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

	public String getLike_count() {
		return like_count;
	}

	public void setLike_count(String like_count) {
		this.like_count = like_count;
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

	public String getSchedule_share() {
		return schedule_share;
	}

	public void setSchedule_share(String schedule_share) {
		this.schedule_share = schedule_share;
	}
	
	
	
}



