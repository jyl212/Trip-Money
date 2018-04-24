package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "/member/logout", urlPatterns = { "/member/logout.do" })
public class LogoutServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		//사용중인 세션을 받아오기
		HttpSession session = request.getSession(false);
		if(session!=null){
			session.invalidate();
		}
		
		response.sendRedirect("/webProject/f_main/main_index.jsp");
		
	}

}
