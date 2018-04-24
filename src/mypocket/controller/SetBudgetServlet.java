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
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import mypocket.dto.BudgetDTO;
import mypocket.service.MyPocketService;
import mypocket.service.MyPocketServiceImpl;

@WebServlet(name = "mypocket/setbudget", urlPatterns = { "/mypocket/setbudget.do" })
public class SetBudgetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		response.setHeader("cache-control", "no-cache,no-store");

		String kind = request.getParameter("kind");
		String budget_flag = request.getParameter("budget_flag");
		String price = request.getParameter("price");
		String schedule_no = request.getParameter("scheduleNo");
		
		BudgetDTO budgetInfo = new BudgetDTO(kind, Integer.parseInt(budget_flag), Integer.parseInt(price),Integer.parseInt(schedule_no));
		MyPocketService service = new MyPocketServiceImpl();
		
		boolean check = service.kindCheck(Integer.parseInt(schedule_no), kind, Integer.parseInt(budget_flag));
		
		if(check){
			service.update(Integer.parseInt(price), kind, Integer.parseInt(schedule_no));
		}else{
			int result = service.insert(budgetInfo);
		}		

		GetBudgetList list = new GetBudgetList();
		String budgetjson = list.getbudgetlist(Integer.parseInt(budget_flag), schedule_no);
		
		PrintWriter pw = response.getWriter();
		pw.print(budgetjson);
	}
}