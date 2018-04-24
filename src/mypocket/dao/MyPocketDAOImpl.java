package mypocket.dao;

import static fw.DBUtil.*;
import static mypocket.query.MyPocketQuery.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mypocket.dto.BudgetDTO;
import mypocket.dto.ExpenseDTO;

public class MyPocketDAOImpl implements MyPocketDAO {
	@Override
	public int insert(BudgetDTO budgetInfo, Connection con) throws SQLException {
		String sql = BUDGET_INSERT;
		PreparedStatement ptmt = null;
		int result = 0;

		ptmt = con.prepareStatement(sql);
		ptmt.setString(1, budgetInfo.getKind());
		ptmt.setInt(2, budgetInfo.getBudget_flag());
		ptmt.setInt(3, budgetInfo.getPrice());
		ptmt.setInt(4, budgetInfo.getSchedule_no());

		result = ptmt.executeUpdate();

		close(ptmt);
		return result;
	}

	@Override
	public ArrayList<BudgetDTO> select(int schedule_no, int budget_flag, Connection con) throws SQLException {
		String sql = BUDGET_LIST;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		ArrayList<BudgetDTO> list = new ArrayList<BudgetDTO>();
		BudgetDTO dto = null;

		ptmt = con.prepareStatement(sql);
		ptmt.setInt(1, schedule_no);
		ptmt.setInt(2, budget_flag);
		rs = ptmt.executeQuery();
		while (rs.next()) {
			dto = new BudgetDTO(rs.getString(1), rs.getInt(2));
			list.add(dto);
		}
		close(rs);
		close(ptmt);

		return list;
	}

	@Override
	public boolean kindCheck(int schedule_no, String kind, int budget_flag, Connection con) throws SQLException {
		String sql = BUDGET_KINDCHECK;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		boolean check = false;

		ptmt = con.prepareStatement(sql);
		ptmt.setInt(1, schedule_no);
		ptmt.setString(2, kind);
		ptmt.setInt(3, budget_flag);
		rs = ptmt.executeQuery();

		if (rs.next()) {
			check = true;
		}

		close(rs);
		close(ptmt);
		return check;
	}

	@Override
	public void update(int price, String kind, int schedule_no, Connection con) throws SQLException {
		String sql = BUDGET_UPDATE;
		PreparedStatement ptmt = null;
		ptmt = con.prepareStatement(sql);

		ptmt.setInt(1, price);
		ptmt.setString(2, kind);
		ptmt.setInt(3, schedule_no);

		ptmt.executeUpdate();

		close(ptmt);
	}

	@Override
	public void delete(String kind, int schedule_no, int budget_flag, Connection con) throws SQLException {
		String sql = BUDGET_DELETE;
		PreparedStatement ptmt = null;
		ptmt = con.prepareStatement(sql);

		ptmt.setString(1, kind);
		ptmt.setInt(2, schedule_no);
		ptmt.setInt(3, budget_flag);
		
		ptmt.executeUpdate();

		close(ptmt);		
	}

	@Override
	public ArrayList<ExpenseDTO> expenselist(int schedule_no, int budget_flag, Connection con) throws SQLException {
		String sql = BUDGET_AND_EXPENSE;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		ArrayList<ExpenseDTO> list = new ArrayList<ExpenseDTO>();
		ExpenseDTO dto = null;
		
		ptmt = con.prepareStatement(sql);
		ptmt.setInt(1, schedule_no);
		ptmt.setInt(2, budget_flag);
		rs = ptmt.executeQuery();
		while (rs.next()) {
			dto = new ExpenseDTO(rs.getInt(3), rs.getInt(2), rs.getString(1));
			list.add(dto);
		}
		close(rs);
		close(ptmt);
		
		return list;
	}


	@Override
	public int insert(ExpenseDTO expenseInfo, Connection con) throws SQLException {
		String sql = EXPENSE_INSERT;
		PreparedStatement ptmt = null;
		int result = 0;

		ptmt = con.prepareStatement(sql);
		ptmt.setInt(1, expenseInfo.getExpenseFlag());
		ptmt.setString(2, expenseInfo.getDay());
		ptmt.setInt(3, expenseInfo.getPrice());
		ptmt.setString(4, expenseInfo.getNote());
		ptmt.setString(5, expenseInfo.getXnode());
		ptmt.setString(6, expenseInfo.getYnode());
		ptmt.setString(7, expenseInfo.getImg());
		ptmt.setString(8, expenseInfo.getKind());
		ptmt.setInt(9, expenseInfo.getSchedule_no());
		ptmt.setString(10, expenseInfo.getTitle());
		
		result = ptmt.executeUpdate();

		close(ptmt);
		return result;
	}

	@Override
	public ArrayList<ExpenseDTO> expenseAllList(int budget_flag, int schedule_no, Connection con) throws SQLException {
		String sql = EXPENSE_LIST_AND_MARK;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		ArrayList<ExpenseDTO> list = new ArrayList<ExpenseDTO>();
		ExpenseDTO dto = null;
		
		ptmt = con.prepareStatement(sql);
		ptmt.setInt(1, budget_flag);
		ptmt.setInt(2, schedule_no);
		rs = ptmt.executeQuery();
		
		while (rs.next()) {
			dto = new ExpenseDTO(rs.getString(3), rs.getInt(2), rs.getString(5), rs.getString(6), rs.getString(4), rs.getString(1), rs.getString(7), rs.getInt(8), rs.getString(9));
			list.add(dto);
		}
		close(rs);
		close(ptmt);
		
		return list;
	}

	//expense delete
	@Override
	public void delete(int expense_no, Connection con) throws SQLException {
		String sql = EXPENSE_DELETE;
		PreparedStatement ptmt = null;
		ptmt = con.prepareStatement(sql);

		ptmt.setInt(1, expense_no);
		
		ptmt.executeUpdate();

		close(ptmt);		
	}

	//expense select
	@Override
	public ArrayList<ExpenseDTO> select(String days, int schedule_no, int budget_flag, Connection con) throws SQLException {
		String sql = EXPENSE_SELECT_DAY;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		ArrayList<ExpenseDTO> list = new ArrayList<ExpenseDTO>();
		ExpenseDTO dto = null;
		
		ptmt = con.prepareStatement(sql);
		ptmt.setString(1, days);
		ptmt.setInt(2, schedule_no);
		ptmt.setInt(3, budget_flag);
		rs = ptmt.executeQuery();
		
		while (rs.next()) {
			dto = new ExpenseDTO(rs.getString(3), rs.getInt(2), rs.getString(5), rs.getString(6), rs.getString(4), rs.getString(1), rs.getString(7), rs.getInt(8));
			list.add(dto);
		}
		close(rs);
		close(ptmt);
		
		return list;
		
	}
}