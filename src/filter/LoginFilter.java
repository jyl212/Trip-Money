package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import member.dto.MemberDTO;

@WebFilter(filterName = "loginfilter", urlPatterns = { "/loginfilter/*" })
public class LoginFilter implements Filter {

    public LoginFilter() {
    
    }

	public void destroy() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession ses = ((HttpServletRequest) request).getSession(false);
		MemberDTO loginUser = null;
		RequestDispatcher rd = null;

		String viewpath = "";
		if(ses!=null){
			loginUser = (MemberDTO)ses.getAttribute("loginUser");
			if(loginUser==null){//�α��� ���°� �ƴ�
				viewpath="login_web.jsp";
				request.setAttribute("viewpath", viewpath);
				
				rd = request.getRequestDispatcher("/f_member/layout_member/member_mainLayout.jsp");
				rd.forward(request, response);
				
			}
			else{
				chain.doFilter(request, response);
			}
		}
		
		//�� ���� ���� -- ���η��̾ƿ� ���忡�� ��� ����


	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}