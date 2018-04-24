package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dto.MemberDTO;
import member.service.MemberService;
import member.service.MemberServiceImpl;
import sun.awt.RepaintArea;

@WebServlet(name = "/member/update", urlPatterns = { "/member/update.do" })
public class MemberUpdateServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		HttpSession ses = request.getSession(false);
		
		MemberDTO data = (MemberDTO)ses.getAttribute("loginUser");
		
		
		String mem_id = data.getMem_id();
		String name = data.getName();
		String pass = request.getParameter("pass");
		String nickname = request.getParameter("nickname");
		
		
		MemberDTO user = new MemberDTO(mem_id, pass, name, nickname);

		MemberService service = new MemberServiceImpl();
		
		service.update(user);
		
		ses.setAttribute("loginUser", user);
		
		response.sendRedirect("/webProject/f_main/main_index.jsp");
		
		
	}

}
