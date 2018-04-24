package mypocket.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypocket.dto.ExpenseDTO;
import mypocket.service.MyPocketService;
import mypocket.service.MyPocketServiceImpl;


@WebServlet(name = "mypocket/expense/list", urlPatterns = { "/mypocket/expense/list.do" })
public class ExpenseListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		response.setHeader("cache-control", "no-cache,no-store");
		
		String schedule_no = request.getParameter("scheduleNo");
		String budget_flag = request.getParameter("budget_flag");
		String days = request.getParameter("days");
		
		GetExpenseList list = new GetExpenseList();
		String expensejson = list.getexpenselist(days ,Integer.parseInt(budget_flag), Integer.parseInt(schedule_no));
		//System.out.println(expensejson);
		PrintWriter pw = response.getWriter();
		pw.print(expensejson);
	}
}
