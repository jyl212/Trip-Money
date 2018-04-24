package mypocket.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ExplenseViewServlet
 */
@WebServlet(name = "mypocket/expenseview", urlPatterns = { "/mypocket/expenseview.do" })
public class ExplenseViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");		
		
		long diff = 0;
		long days = 0;
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date beginDate = formatter.parse(start_date);
			Date endDate = formatter.parse(end_date);
			System.out.println(beginDate);
			System.out.println(endDate);
			
			diff = endDate.getTime() - beginDate.getTime();
			days = diff / (24 * 60 * 60 * 1000);

			System.out.println(days);

		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("viewpath", "/f_mypocket/layout_mypocket/expense_regi.jsp");
		request.setAttribute("menupath", "/f_mypocket/layout_mypocket/mypocket_menu.jsp");
		
		RequestDispatcher rd = request.getRequestDispatcher("/f_mypocket/layout_mypocket/mainLayout.jsp");
        rd.forward(request, response);
	}

}
