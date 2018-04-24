package member.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.MemberDAO;
import member.dao.MemberDAOImpl;
import member.dto.MemberDTO;
import member.service.MemberService;
import member.service.MemberServiceImpl;

@WebServlet(name = "/member/login", urlPatterns = { "/member/login.do" })
public class LoginServlet extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		
		
		//1. 요청정보 추출
		String mem_id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String check = request.getParameter("member_id_save");
		
		System.out.println(mem_id);
		System.out.println(pass);
		
		//2. 비지니스 메소드 호출
		MemberService service = new MemberServiceImpl();
		MemberDTO user = service.login(mem_id, pass);
		
		//3. 데이터 공유
		String url = "";
		if(user!=null){
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", user);
			url = "/webProject/f_main/main_index.jsp";
			
		}
		else{
			url = "/webProject/member/view.html?url=login_web.jsp";
		
		}
		response.sendRedirect(url);
		
		
			
	}

}
