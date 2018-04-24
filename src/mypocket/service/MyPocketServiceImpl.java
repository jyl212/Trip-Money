package mypocket.service;

import static fw.DBUtil.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import mypocket.dao.MyPocketDAO;
import mypocket.dao.MyPocketDAOImpl;
import mypocket.dto.BudgetDTO;
import mypocket.dto.ExpenseDTO;


public class MyPocketServiceImpl implements MyPocketService{

	@Override
	public int insert(ExpenseDTO expenseInfo) {
		//System.out.println("MyPocketServiceImpl : insert(����)");
		int result = 0;
		MyPocketDAO dao = new MyPocketDAOImpl();
		Connection con = null;
		try {
			con = getConnection();
			result = dao.insert(expenseInfo, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		return result;
	}

	@Override
	public int insert(BudgetDTO budgetInfo) {
		//System.out.println("MyPocketServiceImpl : insert(����)");
		int result = 0;
		MyPocketDAO dao = new MyPocketDAOImpl();
		Connection con = null;
		try {
			con = getConnection();
			result = dao.insert(budgetInfo, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		return result;
	}

	@Override
	public ArrayList<BudgetDTO> select(int schedule_no,int budget_flag) {
		//System.out.println("MyPocketServiceImpl : select(����)");
		ArrayList<BudgetDTO> list = new  ArrayList<BudgetDTO>();
		MyPocketDAO dao = new MyPocketDAOImpl();
		//Ʈ����� ������ �ϱ� ���ؼ� Connection�� ���񽺴ܿ��� ���� �ѱ��.
		Connection con = null;
		try {
			con = getConnection();
			list = dao.select(schedule_no, budget_flag , con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		return list;
	}

	@Override
	public boolean kindCheck(int schedule_no, String kind, int budget_flag) {
		//System.out.println("MyPocketServiceImpl : kindCheck(����)");
		Connection con = null;
		boolean check = false;
		MyPocketDAO dao = new MyPocketDAOImpl();
		try {
			con = getConnection();
			check = dao.kindCheck(schedule_no, kind, budget_flag, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		
		return check;
	}

	@Override
	public void update(int price, String kind, int schedule_no) {
		//System.out.println("MyPocketServiceImpl : update(����)");
		Connection con = null;
		MyPocketDAO dao = new MyPocketDAOImpl();
		try {
			con = getConnection();
			dao.update(price, kind, schedule_no, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
	}

	@Override
	public void delete(String kind, int schedule_no, int budget_flag) {
		//System.out.println("MyPocketServiceImpl : delete(����)");
		Connection con = null;
		MyPocketDAO dao = new MyPocketDAOImpl();
		try {
			con = getConnection();
			dao.delete(kind, schedule_no, budget_flag, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		
	}

	@Override
	public ArrayList<ExpenseDTO> expenselist(int schedule_no, int budget_flag) {
		//System.out.println("MyPocketServiceImpl : select(���� �� ���⳻�� ��)");
		ArrayList<ExpenseDTO> list = new  ArrayList<ExpenseDTO>();
		MyPocketDAO dao = new MyPocketDAOImpl();
		Connection con = null;
		try {
			con = getConnection();
			list = dao.expenselist(schedule_no, budget_flag, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		return list;
	}

	@Override
	public ArrayList<ExpenseDTO> expenseAllList(int budget_flag, int schedule_no) {
		//System.out.println("MyPocketServiceImpl : select(���⳻��)");
		ArrayList<ExpenseDTO> list = new  ArrayList<ExpenseDTO>();
		MyPocketDAO dao = new MyPocketDAOImpl();
		Connection con = null;
		try {
			con = getConnection();
			list = dao.expenseAllList(budget_flag, schedule_no, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		return list;
	}

	//expense delete
	@Override
	public void delete(int expense_no) {
		//System.out.println("MyPocketServiceImpl : delete(����)");
		Connection con = null;
		MyPocketDAO dao = new MyPocketDAOImpl();
		try {
			con = getConnection();
			dao.delete(expense_no, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
		}	
	}

	//expense selectdays
	@Override
	public ArrayList<ExpenseDTO> select(String days, int schedule_no, int budget_flag) {
		//System.out.println("MyPocketServiceImpl : select(���⳻��)");
		ArrayList<ExpenseDTO> list = new  ArrayList<ExpenseDTO>();
		MyPocketDAO dao = new MyPocketDAOImpl();
		Connection con = null;
		try {
			con = getConnection();
			list = dao.select(days, schedule_no, budget_flag, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		return list;
	}
}