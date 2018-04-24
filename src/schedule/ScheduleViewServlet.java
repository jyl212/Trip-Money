package schedule;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * �����۸�ũ�� Ŭ���ؼ� ��û�並 ��Ÿ���� ȣ���� ����
 * mainLayout.jsp�� ������ view�� ���� ������ �Ѱ��ִ� ����
 * view�� ���� ������ ??? 
 */
@WebServlet(name = "/schedule/view", urlPatterns = { "/schedule/view.html" })
public class ScheduleViewServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String viewpath= request.getParameter("url");
		request.setAttribute("viewpath", viewpath);
		
		
		//���� ���� �޴�
		String menupath = request.getParameter("menuurl");
		request.setAttribute("menupath", menupath);
		
		
		RequestDispatcher rd =
				request.getRequestDispatcher("/f_schedule/layout_schedule/schedule_mainLayout.jsp");
		rd.forward(request, response);
	}
}