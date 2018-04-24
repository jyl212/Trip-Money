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
import tourist.dto.TourInfoDTO;

/**
 * Servlet implementation class PopUpServlet
 */
@WebServlet(name = "mypocket/pop", urlPatterns = { "/mypocket/pop.do" })
public class PopUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		
		String img = request.getParameter("img");
		String title = request.getParameter("title");
		String price = request.getParameter("price");
		String note = request.getParameter("note");
		
		ExpenseDTO expenseInfo = new ExpenseDTO(Integer.parseInt(price), note, img, title);
		
		request.setAttribute("expenseInfo", expenseInfo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/f_mypocket/layout_mypocket/expense_detail.jsp");
		rd.forward(request, response);
	}

}
