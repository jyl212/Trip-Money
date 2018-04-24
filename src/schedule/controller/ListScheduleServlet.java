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

@WebServlet(name = "/schedule/listSchedule", urlPatterns = { "/loginfilter/schedule/listSchedule.do" })
public class ListScheduleServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=euc-kr");
		ArrayList<ScheduleDTO> list = new ArrayList<>();
		
		String mem_id = (String)request.getParameter("mem_id");
		
		//비지니스 메소드 호출
		ScheduleService service = new ScheduleServiceImpl();
		list = service.listSchedule(mem_id);
		
		//state에 따라서 forward할 view를 다르게 연결
		String state = request.getParameter("STATE");
		
		
		//데이터 공유
		request.setAttribute("list", list);
		
		String viewpath="";
		String menupath="/f_schedule/layout_schedule/schedule_menu_layout.jsp";
		
		if(state.equals("list")){
			viewpath = "/f_schedule/layout_schedule/my_schedule.jsp";
		}
		else if(state.equals("share")){
			viewpath = "/f_schedule/layout_schedule/shared_schedule.jsp";
		}
		else if(state.equals("mypocket")){
            menupath = "/f_mypocket/layout_mypocket/mypocket_menu1.jsp";
            viewpath = "/f_mypocket/layout_mypocket/schedule_for_regi.jsp";
         }

		request.setAttribute("viewpath", viewpath);
		request.setAttribute("menupath", menupath);

		RequestDispatcher rd =
				request.getRequestDispatcher("/f_schedule/layout_schedule/schedule_mainLayout.jsp");
		rd.forward(request, response);
		
	}

}
