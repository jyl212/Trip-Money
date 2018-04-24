package schedule.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dto.MemberDTO;
import member.service.MemberService;
import member.service.MemberServiceImpl;
import schedule.dto.ScheduleDTO;
import schedule.service.ScheduleService;
import schedule.service.ScheduleServiceImpl;

@WebServlet(name = "makeSchedule", urlPatterns = { "/makeSchedule.html" })
public class MakeScheduleServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter pw = response.getWriter();
		
		SimpleDateFormat today = new SimpleDateFormat("yyyyMMdd");

		String schedule_title = request.getParameter("schedule_title");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		int person = Integer.parseInt(request.getParameter("person"));
		String update_date = today.format(new Date());
		String schedule_share = "N"; 
		String mem_id = request.getParameter("user");
		
		//2. 비지니스 로직 호출
		ScheduleDTO makeScheduledto = new ScheduleDTO(schedule_title, start_date, end_date, person, update_date, schedule_share, mem_id);
		
		//3. service 호출
		ScheduleService service = new ScheduleServiceImpl();
		service.makeSchedule(makeScheduledto);

		response.sendRedirect("/webProject/loginfilter/schedule/listSchedule.do?STATE=list&mem_id="+mem_id);

		
	}

}
