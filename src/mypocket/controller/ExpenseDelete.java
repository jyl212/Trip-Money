package mypocket.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypocket.service.MyPocketService;
import mypocket.service.MyPocketServiceImpl;

@WebServlet(name = "mypocket/expense/delete", urlPatterns = { "/mypocket/expense/delete.do" })
public class ExpenseDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String expense_no = request.getParameter("expense_no");
		
		MyPocketService service = new MyPocketServiceImpl();
		service.delete(Integer.parseInt(expense_no));
		
		
		request.setAttribute("viewpath", "/f_mypocket/layout_mypocket/expense_list.jsp");
		request.setAttribute("menupath", "/f_mypocket/layout_mypocket/mypocket_menu.jsp");
		
		RequestDispatcher rd = request.getRequestDispatcher("/f_mypocket/layout_mypocket/mainLayout.jsp");
        rd.forward(request, response);
	}
}