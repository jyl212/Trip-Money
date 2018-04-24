package mypocket.dto;

import java.sql.Date;

public class ExpenseDTO {
	private int expenseFlag;
	private String day;
	private int price;
	private int budgetPrice;
	private String note;
	private String xnode;
	private String ynode;
	private String img;
	private String kind;// Ç×¸ñ
	private int schedule_no;
	private String title;
	private int expense_no;

	public ExpenseDTO() {

	}
	
	public ExpenseDTO(int price, String note, String img, String title) {
		super();
		this.price = price;
		this.note = note;
		this.img = img;
		this.title = title;
	}

	//insert expense
	public ExpenseDTO(int expenseFlag, String day, int price, String note, String xnode, String ynode, String img,
			String kind, int schedule_no, String title) {
		super();
		this.expenseFlag = expenseFlag;
		this.day = day;
		this.price = price;
		this.note = note;
		this.xnode = xnode;
		this.ynode = ynode;
		this.img = img;
		this.kind = kind;
		this.schedule_no = schedule_no;
		this.title = title;
	}		
	//budget vs expense
	public ExpenseDTO(int price, int budgetPrice, String kind) {
		super();
		this.price = price;
		this.budgetPrice = budgetPrice;
		this.kind = kind;
	}
	//expenseList & marker Info
	public ExpenseDTO(String day, int price, String xnode, String ynode, String img, String kind, String title, int expense_no, String note) {
		super();
		this.day = day;
		this.price = price;
		this.xnode = xnode;
		this.ynode = ynode;
		this.img = img;
		this.kind = kind;
		this.title = title;
		this.expense_no = expense_no;
		this.note = note;
	}
	public ExpenseDTO(String day, int price, String xnode, String ynode, String img, String kind, String title,
			int expense_no) {
		super();
		this.day = day;
		this.price = price;
		this.xnode = xnode;
		this.ynode = ynode;
		this.img = img;
		this.kind = kind;
		this.title = title;
		this.expense_no = expense_no;
	}

	public int getExpense_no() {
		return expense_no;
	}
	public void setExpense_no(int expense_no) {
		this.expense_no = expense_no;
	}
	public int getBudgetPrice() {
		return budgetPrice;
	}
	public void setBudgetPrice(int budgetPrice) {
		this.budgetPrice = budgetPrice;
	}
	public int getExpenseFlag() {
		return expenseFlag;
	}
	public void setExpenseFlag(int expenseFlag) {
		this.expenseFlag = expenseFlag;
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
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getXnode() {
		return xnode;
	}
	public void setXnode(String xnode) {
		this.xnode = xnode;
	}
	public String getYnode() {
		return ynode;
	}
	public void setYnode(String ynode) {
		this.ynode = ynode;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getSchedule_no() {
		return schedule_no;
	}
	public void setSchedule_no(int schedule_no) {
		this.schedule_no = schedule_no;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "ExpenseDTO [expenseFlag=" + expenseFlag + ", day=" + day + ", price=" + price + ", budgetPrice="
				+ budgetPrice + ", note=" + note + ", xnode=" + xnode + ", ynode=" + ynode + ", img=" + img + ", kind="
				+ kind + ", schedule_no=" + schedule_no + "]";
	}

}