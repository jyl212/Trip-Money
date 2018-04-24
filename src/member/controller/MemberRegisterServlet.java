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

import member.dto.MemberDTO;
import member.service.MemberService;
import member.service.MemberServiceImpl;
@WebServlet(name = "/member/register", urlPatterns = { "/member/register.html" })
public class MemberRegisterServlet extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException{
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		
		PrintWriter pw = response.getWriter();

		String mem_id ="";
		String pass ="";
		String name ="";
		String nickname ="";
		String sns="";
		
		if(request.getParameter("mem_id1")!=null){
		//1. 요청 정보 추출하기
			mem_id = request.getParameter("mem_id1");
			System.out.println("mem_id1 : "+mem_id);
			pass = request.getParameter("pass1");
			System.out.println(pass);
			name = request.getParameter("name1");
			System.out.println(name);
			nickname = request.getParameter("nickname1");
			System.out.println(nickname);
			sns = "Homepage";
			//String sns = request.getParameter("sns"); --> 일단 생략 
		}else if(request.getParameter("mem_id2")!=null){
			mem_id = request.getParameter("mem_id2");
			System.out.println(mem_id);
			pass = request.getParameter("pass2");
			System.out.println(pass);
			name = request.getParameter("name2");
			System.out.println(name);
			nickname = request.getParameter("nickname2");
			System.out.println(nickname);
			sns = "Homepage";
			//String sns = request.getParameter("sns"); --> 일단 생략 
		}
		
		//2. 비지니스 로직 호출
		MemberDTO user = new MemberDTO(mem_id,pass,name,nickname,sns);
		System.out.println(user);
		
		//3. service 호출
		MemberService service = new MemberServiceImpl();
		int result = service.register(user);
		

		RequestDispatcher rd =
		request.getRequestDispatcher("/f_main/main_index.jsp");
		rd.forward(request, response);


	}

}
