package mypocket.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import mypocket.dto.BudgetDTO;
import mypocket.dto.ExpenseDTO;

public interface MyPocketService {
	void update(int price,String kind, int schedule_no);
	boolean kindCheck(int schedule_no, String kind, int budget_flag);
	void delete(String kind, int schedule_no, int budget_flag);
	int insert(BudgetDTO budgetInfo);
	ArrayList<BudgetDTO> select(int schedule_no, int budget_flag);

	int insert(ExpenseDTO expenseInfo);
	ArrayList<ExpenseDTO> expenselist(int schedule_no, int budget_flag);
	ArrayList<ExpenseDTO> expenseAllList(int budget_flag, int schedule_no);
	void delete(int expense_no);
	ArrayList<ExpenseDTO> select(String days, int schedule_no, int budget_flag);
}
