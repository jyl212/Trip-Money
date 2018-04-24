package schedule.controller;

import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import java.io.BufferedInputStream;
import java.io.IOException;

@WebServlet(name = "/schedule/searchtour", urlPatterns = { "/schedule/searchtour.do" })
public class SearchTourServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		response.setContentType("application/json;charset=euc-kr");
		PrintWriter pw=response.getWriter();
		String keyword = request.getParameter("search");
		keyword = keyword.replaceAll("<", "&lt;").replaceAll(">", "&gt'");
		keyword = keyword.replaceAll("eval", "");
		keyword = keyword.replaceAll("script", "");
		String encodeResult = URLEncoder.encode(keyword, "UTF-8");
		SearchTour logic=new SearchTour();
		JSONObject tourlist=new JSONObject();
		try {
			tourlist=logic.getTourList(encodeResult);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		pw.println(tourlist.toJSONString());
	}
}
