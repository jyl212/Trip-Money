package schedule.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dto.MemberDTO;
import schedule.service.ScheduleService;
import schedule.service.ScheduleServiceImpl;

@WebServlet(name = "/schedule/delete", urlPatterns = { "/schedule/delete.do" })
public class DeleteScheduleServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String para = request.getParameter("del_no");
	 	
	 	int del_no = Integer.parseInt(para.split("-")[1]);
	 	
	 	ScheduleService service = new ScheduleServiceImpl();
	 	service.deleteSchedule(del_no);
	 	
		HttpSession ses = request.getSession(false);
		MemberDTO loginUser = null;
		
		loginUser = (MemberDTO)ses.getAttribute("loginUser");
		String mem_id = loginUser.getMem_id();
	 	
	 	RequestDispatcher rd =
	 			request.getRequestDispatcher("/loginfilter/schedule/listSchedule.do?STATE=list&mem_id="+mem_id);
	 			rd.forward(request, response);
	}

}
