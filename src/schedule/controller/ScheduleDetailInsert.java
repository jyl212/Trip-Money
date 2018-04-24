package schedule.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "schedule/detail/insert", urlPatterns = { "/schedule/detail/insert.do" })
public class ScheduleDetailInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String data=request.getParameter("daydata");
		int detaildays=Integer.parseInt(request.getParameter("detaildays"));
		String scheduleid=request.getParameter("scheduleid");
		InsertDataParser logic=new InsertDataParser();
		logic.insert(data,detaildays,scheduleid);
		String mem_id=request.getParameter("mem_id");
		response.sendRedirect("/webProject/loginfilter/schedule/listSchedule.do?mem_id="+mem_id+"&STATE=list");
	}

}
