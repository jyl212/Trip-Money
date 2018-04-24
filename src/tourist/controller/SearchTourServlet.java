package tourist.controller;

import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.StringTokenizer;

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

@WebServlet(name = "/tourist/searchtour", urlPatterns = { "/tourist/searchtour.do" })
public class SearchTourServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		
		response.setContentType("application/json;charset=euc-kr");
		PrintWriter pw=response.getWriter();
		String keyword = request.getParameter("search");
		String areaCode = request.getParameter("city");
		System.out.println(areaCode);
		String encodeResult = URLEncoder.encode(keyword, "UTF-8");
        DocumentBuilderFactory factory	= DocumentBuilderFactory.newInstance();
        JSONObject tourlist=new JSONObject();
        JSONArray tourarr=new JSONArray();
        String cityno="";
        if(areaCode==""){
        	System.out.println("¼­ºí¸´¾ø´Ù.");
        }else{
        	String[] areacodelist = areaCode.split(",");
        	System.out.println(areacodelist.length);
        	for (int i = 0; i < areacodelist.length; i++) {
        		cityno = areacodelist[i];
			}
	  
        }
      
		try {
			DocumentBuilder builder = factory.newDocumentBuilder();
			
				String toururl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword";
				String key ="gtw8VtWB%2FRO%2FW4FbGeEdySHb3Nv9w6vBndH2ExaopmeAvnxAM0lNu2s0iL%2BokcBRG1Yehf98Zh43TbblFewtKw%3D%3D";
				String MobileApp = "TripMoney";
				String MobileOS = "ETC";
				String pageNo = "1";
				String numOfRows = "100";
				String arrange = "A";
				String listYN = "Y";
        
            if(areaCode==""){
            	 String realUrl = toururl+"?serviceKey="+key+"&MobileApp="+MobileApp+"&MobileOS="+MobileOS+
  		               "&pageNo="+pageNo+"&numOfRows="+numOfRows+"&keyword="+encodeResult+"&arrange="+arrange;

     			URL url = new URL(realUrl);
     			BufferedInputStream bis = new BufferedInputStream(url.openStream());
     			
     			Document document = builder.parse(bis);
                 Element root = document.getDocumentElement();
     			
     			NodeList itemlist = root.getElementsByTagName("item");
     			
     			for(int i = 0; i< itemlist.getLength() ; i++){
     				Node itemnode = itemlist.item(i);
     				JSONObject tour=new JSONObject();
     				NodeList itemChildNodelist = itemnode.getChildNodes();
     				for(int j=0 ; j<itemnode.getChildNodes().getLength() ; j++){
     					Node itemChildNode= itemChildNodelist.item(j);
     					
     					if(itemChildNode.getNodeName()=="title"){
     						tour.put("title",itemChildNode.getTextContent());
     					}
     					else if(itemChildNode.getNodeName()=="areacode"){
     						tour.put("areacode",itemChildNode.getTextContent());
     					}
     					else if(itemChildNode.getNodeName()=="addr1"){
     						tour.put("addr1",itemChildNode.getTextContent());
     					}
     					else if(itemChildNode.getNodeName()=="firstimage"){
     						tour.put("firstimage",itemChildNode.getTextContent());
     					}
     					else if(itemChildNode.getNodeName()=="mapx"){
     						tour.put("mapx",itemChildNode.getTextContent());
     					}
     					else if(itemChildNode.getNodeName()=="mapy"){
     						tour.put("mapy",itemChildNode.getTextContent());
     					}
     					else if(itemChildNode.getNodeName()=="contentid"){
     						tour.put("contentid",itemChildNode.getTextContent());
     					}
     				}
     				tourarr.add(tour);
     			}
     			tourlist.put("tourarr",tourarr);
     			pw.println(tourlist.toJSONString());
            }else{
            	
            	  String realUrl = toururl+"?serviceKey="+key+"&keyword="+encodeResult+"&areaCode="+cityno+"&listYN="+listYN+
  		        		"&MobileOS="+MobileOS+"&MobileApp="+MobileApp+"&arrange="+arrange+"&numOfRows="+numOfRows+"&pageNo="+pageNo;
            	  URL url = new URL(realUrl);
       			BufferedInputStream bis = new BufferedInputStream(url.openStream());
       			
       			Document document = builder.parse(bis);
                   Element root = document.getDocumentElement();
       			
       			NodeList itemlist = root.getElementsByTagName("item");
       			
       			for(int i = 0; i< itemlist.getLength() ; i++){
       				Node itemnode = itemlist.item(i);
       				JSONObject tour=new JSONObject();
       				NodeList itemChildNodelist = itemnode.getChildNodes();
       				for(int j=0 ; j<itemnode.getChildNodes().getLength() ; j++){
       					Node itemChildNode= itemChildNodelist.item(j);
       					
       					if(itemChildNode.getNodeName()=="title"){
       						tour.put("title",itemChildNode.getTextContent());
       					}
       					else if(itemChildNode.getNodeName()=="areacode"){
       						tour.put("areacode",itemChildNode.getTextContent());
       					}
       					else if(itemChildNode.getNodeName()=="addr1"){
       						tour.put("addr1",itemChildNode.getTextContent());
       					}
       					else if(itemChildNode.getNodeName()=="firstimage"){
       						tour.put("firstimage",itemChildNode.getTextContent());
       					}
       					else if(itemChildNode.getNodeName()=="mapx"){
       						tour.put("mapx",itemChildNode.getTextContent());
       					}
       					else if(itemChildNode.getNodeName()=="mapy"){
       						tour.put("mapy",itemChildNode.getTextContent());
       					}
       					else if(itemChildNode.getNodeName()=="contentid"){
       						tour.put("contentid",itemChildNode.getTextContent());
       					}
       				}
       				tourarr.add(tour);
       			}
       			tourlist.put("tourarr",tourarr);
       			pw.println(tourlist.toJSONString());
            }
		       
			
			}catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
}
