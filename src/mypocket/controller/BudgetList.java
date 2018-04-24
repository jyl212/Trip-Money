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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import mypocket.dto.BudgetDTO;
import mypocket.service.MyPocketService;
import mypocket.service.MyPocketServiceImpl;


@WebServlet(name = "mypocket/budgetlist", urlPatterns = { "/mypocket/budgetlist.do" })
public class BudgetList extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		response.setHeader("cache-control", "no-cache,no-store");
		
		String kind = request.getParameter("kind");
		String schedule_no = request.getParameter("scheduleNo");
		String budget_flag = request.getParameter("budget_flag");
		
		if(kind!=""){
			MyPocketService service = new MyPocketServiceImpl();
			service.delete(kind, Integer.parseInt(schedule_no), Integer.parseInt(budget_flag));
		}		
		
		GetBudgetList list = new GetBudgetList();
		String budgetjson = list.getbudgetlist(Integer.parseInt(budget_flag), schedule_no);
		PrintWriter pw = response.getWriter();
		pw.print(budgetjson);
	}
}