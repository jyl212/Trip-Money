package mypocket.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import mypocket.dto.BudgetDTO;
import mypocket.dto.ExpenseDTO;

public interface MyPocketDAO {
	boolean kindCheck(int schedule_no, String kind, int budget_flag, Connection con) throws SQLException;
	void update(int price,String kind, int schedule_no, Connection con) throws SQLException;
	void delete(String kind, int schedule_no, int budget_flag, Connection con) throws SQLException;
	int insert(BudgetDTO budgetInfo, Connection con) throws SQLException;
	ArrayList<BudgetDTO> select(int schedule_no, int budget_flag , Connection con) throws SQLException;
	
	int insert(ExpenseDTO expenseInfo, Connection con) throws SQLException;
	ArrayList<ExpenseDTO> expenselist(int schedule_no, int budget_flag, Connection con) throws SQLException;
	ArrayList<ExpenseDTO> expenseAllList(int budget_flag, int schedule_no, Connection con)throws SQLException;
	void delete(int expense_no, Connection con)throws SQLException;
	ArrayList<ExpenseDTO> select(String days, int schedule_no, int budget_flag, Connection con)throws SQLException;
}
