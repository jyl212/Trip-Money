package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.MemberService;
import member.service.MemberServiceImpl;

@WebServlet(name = "/member/idcheck", urlPatterns = { "/member/idcheck.do" })
public class Member_ID_Check_Servlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mem_id = request.getParameter("mem_id");
		MemberService service = new MemberServiceImpl();
		
		String msg ="";
		
		if(Pattern.matches("^[A-Za-z]+\\.?[a-zA-Z]+@[A-Za-z]+(\\.[a-zA-Z]+){1,2}", mem_id)==true){
			boolean result = service.idCheck(mem_id);
			if(result==true){
				msg = "�̹� ������� ���̵��Դϴ�";
			}
			else{
				msg = "��� ������ ���̵��Դϴ�";
			}
		}else{
			msg ="�̸��� �������� �Է��� �ּ���";
		}
		response.setContentType("text/html;charset=euc-kr");
		response.setHeader("cache-control", "no-cache, no-store");
		PrintWriter pw = response.getWriter();
		pw.print(msg);
	}

}
