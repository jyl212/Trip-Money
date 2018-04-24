package mypocket.dto;

public class BudgetDTO {
	private String kind;
	private int budget_flag;
	private String day;
	private int price;
	private int schedule_no;
	
	public BudgetDTO(){
		
	}	
	//insert¿ë
	public BudgetDTO(String kind, int budget_flag, int price, int schedule_no) {
		super();
		this.kind = kind;
		this.budget_flag = budget_flag;
		this.price = price;
		this.schedule_no = schedule_no;
	}
	
	//select¿ë
	public BudgetDTO(String kind, int price) {
		super();
		this.kind = kind;
		this.price = price;
	}
	
	public BudgetDTO(String kind, int budget_flag, int schedule_no) {
		super();
		this.kind = kind;
		this.budget_flag = budget_flag;
		this.schedule_no = schedule_no;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getBudget_flag() {
		return budget_flag;
	}
	public void setBudget_flag(int budget_flag) {
		this.budget_flag = budget_flag;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	@Override
	public String toString() {
		return "BudgetDTO [kind=" + kind + ", budget_flag=" + budget_flag + ", day=" + day + ", price=" + price
				+ ", schedule_no=" + schedule_no + "]";
	}
	
}
