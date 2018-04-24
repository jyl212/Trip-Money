package share;

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
@WebServlet(name = "/share/view", urlPatterns = { "/share/view.html" })
public class ShareViewServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String viewpath= request.getParameter("url");
		System.out.println(viewpath);
		request.setAttribute("viewpath", viewpath);
		
		RequestDispatcher rd =
				request.getRequestDispatcher("/f_share/layout_share/share_mainLayout.jsp");
		rd.forward(request, response);
	}
}