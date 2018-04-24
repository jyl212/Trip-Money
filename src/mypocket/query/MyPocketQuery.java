package mypocket.query;

public class MyPocketQuery {	
	
	//BUDGET관련==================================================================================================================
	public static String BUDGET_INSERT = "insert into BUDGET values(?,?,sysdate,?,?)";
	
	public static String BUDGET_KINDCHECK = "select * from budget where schedule_no=? and kind=? and budget_flag=?";
	
	public static String BUDGET_UPDATE = "update budget set price = price+? where kind=? and schedule_no=?";
	
	public static String BUDGET_DELETE ="delete from budget where kind=? and schedule_no=? and budget_flag=?";
	
	public static String BUDGET_LIST = "select b.kind, b.price from budget b, schedule s where b.schedule_no=s.schedule_no and"
										+" s.schedule_no=? and b.budget_flag=?";
	
	//EXPENSE관련==================================================================================================================
	public static String EXPENSE_INSERT = "insert into EXPENSE values(?,?,?,?,?,?,?,?,?,?,expense_seq.nextval)";
	
	public static String BUDGET_AND_EXPENSE= "select b.kind, b.price bprice, sum(e.price) eprice from budget b, expense e"
											 +" where b.kind = e.kind and b.schedule_no=? and b.budget_flag=? group by b.kind, b.price";
	
	public static String EXPENSE_LIST_AND_MARK = "select kind, price, day, img, xnode, ynode, title, expense_no, note from expense where expense_flag=? and schedule_no=?";
	
	public static String EXPENSE_DELETE = "delete from expense where expense_no=?";
	
	public static String EXPENSE_SELECT_DAY = "select kind, price, day, img, xnode, ynode, title, expense_no from expense where day=? and schedule_no=? and expense_flag=?";
}
