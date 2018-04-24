package tourist.dto;

public class TourInfoDTO {
	private String title;
	private String homepage;
	private String firstimage;
	private String firstimage2;
	private String mapx;
	private String mapy;
	private String overview;
	
	public TourInfoDTO() {
		super();
	}

	@Override
	public String toString() {
		return "TourInfoDTO [title=" + title + ", homepage=" + homepage + ", firstimage=" + firstimage
				+ ", firstimage2=" + firstimage2 + ", mapx=" + mapx + ", mapy=" + mapy + ", overview=" + overview + "]";
	}

	public TourInfoDTO(String title, String homepage, String firstimage, String firstimage2, String mapx, String mapy,
			String overview) {
		super();
		this.title = title;
		this.homepage = homepage;
		this.firstimage = firstimage;
		this.firstimage2 = firstimage2;
		this.mapx = mapx;
		this.mapy = mapy;
		this.overview = overview;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getFirstimage() {
		return firstimage;
	}

	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}

	public String getFirstimage2() {
		return firstimage2;
	}

	public void setFirstimage2(String firstimage2) {
		this.firstimage2 = firstimage2;
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

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}
	
	
}
