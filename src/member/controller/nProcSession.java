package member.controller;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class nProcSession
 */
@WebServlet("/nProcSession")
public class nProcSession extends HttpServlet {
 private static final long serialVersionUID = 1L;
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public nProcSession() {
        super();
        // TODO Auto-generated constructor stub
    }
 /**
  * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
  */
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  try {
   // 정해진 페이지에서의 요청이 아니면 세션처리 안함
   System.out.println(request.getHeader("referer").toString());
   if(request.getHeader("referer").toString().equals("http://192.168.0.2:8080/jmProj/napi/jmnaverloginPop.html")){
    HttpSession s = request.getSession();
    s.setAttribute("email", request.getParameter("email"));
    s.setAttribute("nickname", request.getParameter("nickname"));
    s.setAttribute("age", request.getParameter("age"));
    s.setAttribute("birthday", request.getParameter("birthday"));
    s.setAttribute("gender", request.getParameter("gender"));
    s.setAttribute("profile_image", request.getParameter("profile_image"));
    System.out.println(s.getAttribute("email"));
    System.out.println(s.getAttribute("nickname"));
   } else {
    System.out.println("바른 경로의 요청이 아닙니다. ");
   };
   // 로그인성공페이지
   request.getRequestDispatcher("/napi/nlogin.jsp").forward(request, response);
  } catch (Exception e) {
   // TODO Auto-generated catch block
   e.printStackTrace();
  }
 }
 /**
  * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
  */
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  doGet(request, response);
 }
}