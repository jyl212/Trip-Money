package schedule;

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

/*
 * 하이퍼링크를 클릭해서 요청뷰를 나타낼때 호출할 서블릿
 * mainLayout.jsp에 연결할 view에 대한 정보를 넘겨주는 서블릿
 * view에 대한 정보는 ??? 
 */
@WebServlet(name = "/schedule/detailview", urlPatterns = { "/schedule/detailview.do" })
public class ScheduleDetailViewServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	 	String para = request.getParameter("days");
	 	
	 	String schedule_no = para.split("_")[0];
	 	String start = para.split("_")[1];
	    String end = para.split("_")[2];
	    long diff = 0;
	    long detaildays = 0;
	    try {
	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	        Date beginDate = formatter.parse(start);
	        Date endDate = formatter.parse(end);
	         
	        diff = endDate.getTime() - beginDate.getTime();
	        detaildays = diff / (24 * 60 * 60 * 1000);
	        
	         
	    } catch (ParseException e) {
	        e.printStackTrace();
	    }
		
		request.setAttribute("schedule_no", schedule_no);
		request.setAttribute("detaildays", detaildays);
		
		
		RequestDispatcher rd =
				request.getRequestDispatcher("/f_schedule/layout_schedule/detail_schedule.jsp");
		rd.forward(request, response);
	}
}