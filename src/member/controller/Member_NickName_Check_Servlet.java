package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.MemberService;
import member.service.MemberServiceImpl;

@WebServlet(name = "/member/nicknamechack", urlPatterns = { "/member/nicknamechack.do" })
public class Member_NickName_Check_Servlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String nickname = request.getParameter("nickname");
		
		MemberService service = new MemberServiceImpl();
		
		boolean result = service.NickNameCheck(nickname);
		
		String msg ="";	
		if(nickname.length()>8&&nickname.length()<16){
			if(result==true){
				msg = "�̹� ������� �г����Դϴ�";
			}
			else{
				msg = "��밡���� �г����Դϴ�.";
			}
		}else if(nickname.length()<8||nickname.length()>16){
			msg = "3�����̻� 6�������Ϸ� �Է����ֽʽÿ�";
		}
		
		
		response.setContentType("text/html;charset=euc-kr");
		response.setHeader("cache-control", "no-cache, no-store");
		PrintWriter pw = response.getWriter();
		pw.print(msg);
	}
}