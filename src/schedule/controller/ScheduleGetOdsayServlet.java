package schedule.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


@WebServlet(name = "/getodsay", urlPatterns = { "/schedule/getodsay.do" })
public class ScheduleGetOdsayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json;charset=euc-kr");
		request.setCharacterEncoding("euc-kr");
		PrintWriter pw=response.getWriter();
		response.setHeader("cache-control","no-cache,no-store");
		String sposition=request.getParameter("sposition");
		sposition=sposition.substring(1,sposition.length()-1);
		sposition.trim();
		String eposition=request.getParameter("eposition");
		eposition.trim();
		eposition=eposition.substring(1,sposition.length()-1);
		String sy=sposition.split(",")[0];
		sy=sy.trim();
		String sx=sposition.split(",")[1];
		sx=sx.trim();
		String ey=eposition.split(",")[0];
		ey=ey.trim();
		String ex=eposition.split(",")[1];
		ex=ex.trim();
		
		ScheduleGetOdsay obj=new ScheduleGetOdsay();
		JSONObject odsay=new JSONObject();
		try {
			odsay = obj.GetBusList(sx, sy, ex, ey);
		} catch (Exception e) {
		}
		pw.println(odsay.toJSONString());
	}

}
