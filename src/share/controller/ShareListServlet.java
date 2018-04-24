package share.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import share.dto.ShareDTO;
import share.service.ShareService;
import share.service.ShareServiceImpl;

@WebServlet(name = "/share/list", urlPatterns = { "/share/list.do" })
public class ShareListServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		ArrayList<ShareDTO> list = new ArrayList<>();
		
		String keyword = request.getParameter("search");
		
		
		//비지니스 메소드 호출
		ShareService service = new ShareServiceImpl();
		
		if(keyword==null){
			list = service.listALL();
		}
		else{
			list = service.searchList(keyword);
		}
		
		
		request.setAttribute("list", list);
		
		String viewpath="/f_share/layout_share/share_main.jsp";
		
		request.setAttribute("viewpath", viewpath);
		
		RequestDispatcher rd =
				request.getRequestDispatcher("/f_share/layout_share/share_mainLayout.jsp");
		rd.forward(request, response);
		
	}

}
