package tourist.dto;

public class KeywordSearchTourDTO {
	private String title;
	private String areacode;
	private String addr1;
	private String contentid;
	private String firstimage;
	private String mapx;
	private String mapy;
	
	public KeywordSearchTourDTO() {
		super();
	}

	public KeywordSearchTourDTO(String title, String areacode, String addr1, String contentid, String firstimage,
			String mapx, String mapy) {
		super();
		this.title = title;
		this.areacode = areacode;
		this.addr1 = addr1;
		this.contentid = contentid;
		this.firstimage = firstimage;
		this.mapx = mapx;
		this.mapy = mapy;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAreacode() {
		return areacode;
	}

	public void setAreacode(String areacode) {
		this.areacode = areacode;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getContentid() {
		return contentid;
	}

	public void setContentid(String contentid) {
		this.contentid = contentid;
	}

	public String getFirstimage() {
		return firstimage;
	}

	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
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

	
	
	
	
}


