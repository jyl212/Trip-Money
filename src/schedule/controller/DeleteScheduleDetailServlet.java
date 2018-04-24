package schedule.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import schedule.service.ScheduleDetailService;
import schedule.service.ScheduleDetailServiceImpl;

@WebServlet(name = "deletedetail", urlPatterns = { "/schedule/deletedetail.do" })
public class DeleteScheduleDetailServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setHeader("cache-control","no-cache,no-store");
		String scheduleday=request.getParameter("scheduleday");
		String contentid=request.getParameter("contentid");
		String scheduleno=request.getParameter("scheduleno");
		ScheduleDetailService service =new ScheduleDetailServiceImpl();
		int result=service.delete(scheduleno, scheduleday, contentid);
	}
}
