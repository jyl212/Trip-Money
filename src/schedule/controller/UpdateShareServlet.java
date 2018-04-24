package schedule.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dto.MemberDTO;
import schedule.dto.ScheduleDTO;
import schedule.service.ScheduleService;
import schedule.service.ScheduleServiceImpl;

@WebServlet(name = "/schedule/updateshare", urlPatterns = { "/schedule/updateshare.do" })
public class UpdateShareServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String para = request.getParameter("share");
		String note = request.getParameter("note");
		
		System.out.println(para);
		System.out.println(note);
		
		int schedule_no = Integer.parseInt(para.split("-")[0]);
		String share = para.split("-")[1];
		
		//비지니스 메소드 호출
		ScheduleService service = new ScheduleServiceImpl();
		
		if(share.equals("N")){
			share = "Y";
		}
		else{
			share = "N";
		}
		
		service.updateShare(share, note, schedule_no);
		
		HttpSession ses = request.getSession(false);
		MemberDTO loginUser = null;
		
		loginUser = (MemberDTO)ses.getAttribute("loginUser");
		String mem_id = loginUser.getMem_id();
		
		response.sendRedirect("/webProject/loginfilter/schedule/listSchedule.do?STATE=list&mem_id="+mem_id);
		
		
		
		
	}

}
