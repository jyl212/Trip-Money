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

@WebServlet(name = "mypocket/expenselist", urlPatterns = { "/mypocket/expenselist.do" })
public class ExpenseListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		String scheduleInfo = request.getParameter("scheduleInfo");
		String schedule_no = scheduleInfo.split("_")[0];
	 	String start_date = scheduleInfo.split("_")[1];
	    String end_date = scheduleInfo.split("_")[2];
		
		long diff = 0;
		long days = 0;
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date beginDate = formatter.parse(start_date);
			Date endDate = formatter.parse(end_date);
			
			diff = endDate.getTime() - beginDate.getTime();
			days = diff / (24 * 60 * 60 * 1000)+1;
		} catch (ParseException e) {
			e.printStackTrace();
		}

		HttpSession ses = request.getSession();
		ses.setAttribute("scheduleNo", schedule_no);
		ses.setAttribute("start_date", start_date);
		ses.setAttribute("end_date", end_date);
		ses.setAttribute("days", days);
		
		request.setAttribute("viewpath", "/f_mypocket/layout_mypocket/expense_list.jsp");
		request.setAttribute("menupath", "/f_mypocket/layout_mypocket/mypocket_menu.jsp");
		
		RequestDispatcher rd = request.getRequestDispatcher("/f_mypocket/layout_mypocket/mainLayout.jsp");
        rd.forward(request, response);
	}
}