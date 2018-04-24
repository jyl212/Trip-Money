package member.controller;

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