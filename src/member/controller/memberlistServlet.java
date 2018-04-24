package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;



import member.dto.MemberDTO;
import member.service.MemberService;
import member.service.MemberServiceImpl;


@WebServlet(name = "listread", urlPatterns = { "/member/listread.do" })
public class memberlistServlet extends HttpServlet {
	
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
				req.setCharacterEncoding("euc-kr");

				String state = req.getParameter("state");
				MemberService sevice= new MemberServiceImpl();
				ArrayList<MemberDTO> list = sevice.getMemberList();
			
				String menupath="";
				String viewpath="";
				
				menupath = "/f_manager/layout_manager/manager_menu.jsp";
				if(state.equals("NORMAL")){
					viewpath = "/f_member/layout_member/memberlist_read.jsp";
				}
				
				req.setAttribute("memberlist", list);
				req.setAttribute("menupath", menupath);
				req.setAttribute("viewpath", viewpath);
				
				RequestDispatcher rd = req.getRequestDispatcher("/f_member/managerpage_index.jsp");		
				rd.forward(req, res);
	}

}
