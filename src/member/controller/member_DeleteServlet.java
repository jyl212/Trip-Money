package member.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.http.HTTPException;


import member.service.MemberService;
import member.service.MemberServiceImpl;

@WebServlet(name = "/member/delete", urlPatterns = { "/member/delete.do" })
public class member_DeleteServlet extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws HTTPException, IOException{
		req.setCharacterEncoding("euc-kr");
		res.setContentType("text/html;charset=euc-kr");
		
		MemberService sevice= new MemberServiceImpl();
		int result = sevice.delete(req.getParameter("memid"));
		
		res.sendRedirect("/webProject/member/listread.do?state=NORMAL");
	}
}