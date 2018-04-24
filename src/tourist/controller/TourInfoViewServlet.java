package tourist.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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

import tourist.dto.TourInfoDTO;



@WebServlet(name = "/tourist/tourlist", urlPatterns = { "/tourist/tourlist.do" })
public class TourInfoViewServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{

		response.setContentType("text/html;charset=UTF-8");
		
		String contentid = request.getParameter("contentid");

//		
//		String encodeResult = URLEncoder.encode(keyword, "UTF-8");
		
        DocumentBuilderFactory factory	= DocumentBuilderFactory.newInstance();
		//static 메소드로 생성 - 이 객체를 단 한번만 만들 때 사용
		
		//XML문서를 파싱할 수 있는 dom parser를 생성
		try {
			DocumentBuilder builder = factory.newDocumentBuilder();
			
			String toururl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon";
			String key ="qaKEDv59Lx5ZaEL4szS6BEyy6rWcP4SVxxYMGCJr6qG7efA6kP5SUBT7KiK0s1zpIobTjpga9CIiE3b%2BEl0aUQ%3D%3D";
			String numOfRows = "10";
			String pageNo = "1";
			String MobileOS = "ETC";
			String MobileApp = "AppTest";
			/*String contentId = "126508";*/
			String defaultYN = "Y";
			String firstImageYN = "Y";
			String areacodeYN = "Y";
			String catcodeYN = "Y";
			String addrinfoYN = "Y";
			String mapinfoYN = "Y";
			String overviewYN = "Y";
			String realUrl = toururl+"?serviceKey="+key+"&numOfRows="+numOfRows+"&pageNo="+pageNo+
					"&MobileOS="+MobileOS+"&MobileApp="+MobileApp+"&contentId="+contentid+"&defaultYN="+defaultYN+"&firstImageYN="+firstImageYN
					+"&areacodeYN="+areacodeYN+"&catcodeYN="+catcodeYN+"&addrinfoYN="+addrinfoYN+"&mapinfoYN="+mapinfoYN
					+"&overviewYN="+overviewYN;

			
			
		    URL url = new URL(realUrl);
			BufferedInputStream bis = new BufferedInputStream(url.openStream());
			Document document = builder.parse(bis);
	
			
			Element root = document.getDocumentElement();
			
			NodeList itemlist = root.getElementsByTagName("item");

			
			String title = "";
			String homepage = "";
			String firstimage = "";
			String firstimage2 = "";
			String areacode = "";
			String mapx = "";
			String mapy = "";
			String overview="";
			ArrayList<TourInfoDTO> TourInfoList = new ArrayList<TourInfoDTO>();
//			
			/*JSONObject tourroot = new JSONObject();
			JSONArray tourjsonlist = new JSONArray();*/
			
			for(int i = 0; i< itemlist.getLength() ; i++){
				Node itemnode = itemlist.item(i);
				JSONObject itemjson = new JSONObject();			
				NodeList itemChildNodelist = itemnode.getChildNodes();
				for(int j=0 ; j<itemnode.getChildNodes().getLength() ; j++){
					
					Node itemChildNode= itemChildNodelist.item(j);
					
					if(itemChildNode.getNodeName()=="title"){		
						title = itemChildNode.getTextContent();
						itemjson.put("title", itemChildNode.getTextContent());
					}
					else if(itemChildNode.getNodeName()=="homepage"){
						homepage = itemChildNode.getTextContent();
						itemjson.put("homepage", itemChildNode.getTextContent());
					}
					else if(itemChildNode.getNodeName()=="firstimage"){
						firstimage = itemChildNode.getTextContent();
						itemjson.put("firstimage", itemChildNode.getTextContent());
					}
					else if(itemChildNode.getNodeName()=="firstimage2"){
						firstimage2 = itemChildNode.getTextContent();
						itemjson.put("firstimage2", itemChildNode.getTextContent());
					}
					else if(itemChildNode.getNodeName()=="mapx"){
						mapx = itemChildNode.getTextContent();
						itemjson.put("mapx", itemChildNode.getTextContent());
					}
					else if(itemChildNode.getNodeName()=="mapy"){
						mapy = itemChildNode.getTextContent();
						itemjson.put("mapy", itemChildNode.getTextContent());
					}
					else if(itemChildNode.getNodeName()=="overview"){
						overview = itemChildNode.getTextContent();
						itemjson.put("overview", itemChildNode.getTextContent());
					}
					/*else if(itemChildNode.getNodeName()=="areacode"){
						areacode = itemChildNode.getTextContent();
						itemjson.put("areacode", itemChildNode.getTextContent());
					}*/
				}
				TourInfoDTO tourinfodto = new TourInfoDTO(title, homepage, firstimage, firstimage2, mapx, mapy, overview);		
				TourInfoList.add(tourinfodto);
			}
			
			request.setAttribute("tourinfolist", TourInfoList);
			/*PrintWriter pw = response.getWriter();*/

			
		/*	response.setContentType("application/json;charset=euc-kr");	
			response.setHeader("cache-control", "no-cache,no-store");
			pw.print(tourroot.toJSONString());
			
			System.out.println(tourroot.toJSONString());*/

			RequestDispatcher rd = request.getRequestDispatcher("/f_tourist/layout_tourist/trip_detail_layout.jsp");
			rd.forward(request, response);
			
		}
		catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} 
		
		
	}
}
