package schedule.dto;

public class ScheduleDetailDTO {
	String mapx;
	String mapy;
	String title;
	String image;
	String contentid;
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public ScheduleDetailDTO(String mapx, String mapy, String title, String image, String contentid) {
		super();
		this.mapx = mapx;
		this.mapy = mapy;
		this.title = title;
		this.image = image;
		this.contentid = contentid;
	}
	public String getMapx() {
		return mapx;
	}
	public void setMapx(String mapx) {
		this.mapx = mapx;
	}
	public String getMapy() {
		return mapy;
	}
	public void setMapy(String mapy) {
		this.mapy = mapy;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
}
