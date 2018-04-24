package share.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dto.MemberDTO;
import schedule.service.ScheduleService;
import schedule.service.ScheduleServiceImpl;
import share.service.ShareService;
import share.service.ShareServiceImpl;

@WebServlet(name = "/share/like", urlPatterns = { "/share/like.do" })
public class ShareLikeServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String schedule_no = request.getParameter("content");
		String user = request.getParameter("user");
		
		//비지니스 메소드 호출
		ShareService service = new ShareServiceImpl();
		
		int result = service.SelectThumb(user, schedule_no);
		
		if(result==0){
			service.thumbUp(user, schedule_no);
		}
		else{
			service.thumbDown(schedule_no);
		}
		
		response.sendRedirect("/webProject/share/list.do");
		
		
	}

}
