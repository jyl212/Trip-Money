package mypocket.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "mypocket/view", urlPatterns = { "/mypocket/view.html" })
public class ViewTemplateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewpath = request.getParameter("url");
		String menupath = request.getParameter("menuurl");		
		
		request.setAttribute("viewpath", viewpath);
		request.setAttribute("menupath", menupath);
		
		//템플릿페이지로 요청재지정하기(forward)
		RequestDispatcher rd = request.getRequestDispatcher("/f_mypocket/layout_mypocket/mainLayout.jsp");
		rd.forward(request, response);
	}
}