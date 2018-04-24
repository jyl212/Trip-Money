package schedule.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.net.URL;

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

public class SearchTour {
	public JSONObject getTourList(String encodeResult) throws Exception{
		 DocumentBuilderFactory factory	= DocumentBuilderFactory.newInstance();
        JSONObject tourlist=new JSONObject();
        JSONArray tourarr=new JSONArray();
		try {
			DocumentBuilder builder = factory.newDocumentBuilder();
			
			String toururl = "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword";
			String key ="gtw8VtWB%2FRO%2FW4FbGeEdySHb3Nv9w6vBndH2ExaopmeAvnxAM0lNu2s0iL%2BokcBRG1Yehf98Zh43TbblFewtKw%3D%3D";
			String MobileApp = "TripMoney";
			String MobileOS = "ETC";
			String pageNo = "1";
			String numOfRows = "100";
			String arrange = "A";
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
					}else if(itemChildNode.getNodeName()=="cat3"){
						tour.put("cat3",itemChildNode.getTextContent());
					}else if(itemChildNode.getNodeName()=="contentid"){
						tour.put("contentid",itemChildNode.getTextContent());
					}
				}
				tourarr.add(tour);
			}
			tourlist.put("tourarr",tourarr);
		}
		catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return tourlist;
	}
}
