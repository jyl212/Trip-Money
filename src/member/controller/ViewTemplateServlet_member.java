package member.controller;

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
@WebServlet(name = "/member/view", urlPatterns = { "/member/view.html" })
public class ViewTemplateServlet_member extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String viewpath= request.getParameter("url");
		System.out.println(viewpath);
		request.setAttribute("viewpath", viewpath);
		
		RequestDispatcher rd =
				request.getRequestDispatcher("/f_member/layout_member/member_mainLayout.jsp");
		rd.forward(request, response);
	}
}