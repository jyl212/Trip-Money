package tourist.controller;

import java.io.IOException;

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
@WebServlet(name = "/tourist/view2", urlPatterns = { "/tourist/view2.html" })
public class ViewTemplateServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewpath = request.getParameter("url");
		request.setAttribute("viewpath", viewpath);
		
		
		String menupath = request.getParameter("menuurl");
		request.setAttribute("menupath", menupath);
		

		RequestDispatcher rd =
				request.getRequestDispatcher("/f_tourist/layout_tourist/trip_detail_layout.jsp");
		rd.forward(request, response);
	}
}