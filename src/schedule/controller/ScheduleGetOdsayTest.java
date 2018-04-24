package schedule.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class ScheduleGetOdsayTest {

	public static void main(String[] args) throws Exception{
		JSONObject odsay=new JSONObject();
		String realUrl="https://api.odsay.com/v1/api/searchPubTransPath?lang=0&SX="+129.159643953+"&SY="+35.1633127546+"&EX="+126.9767235+"&EY="+37.5801859611+"&SearchType=0&apiKey=OiEL5w7d4Hw%2fxbU5juzt%2fTPjaGbb%2b%2b3YhSDq7UwB1aU";
		JSONParser parser= new JSONParser();
		URL url=new URL(realUrl);
		URLConnection conn=url.openConnection();
		BufferedReader bis=new BufferedReader(new InputStreamReader(
				conn.getInputStream(),"utf-8"));
		JSONObject rootobj;
		try {
			rootobj = (JSONObject)parser.parse(bis);
			JSONObject result=(JSONObject)rootobj.get("result");
			JSONObject trainRequest=(JSONObject)result.get("trainRequest");
			JSONArray obj=(JSONArray)trainRequest.get("OBJ");
			JSONObject path=(JSONObject)obj.get(0);
			
			String mapxToken="EX";
			String mapyToken="EY";
			
			String timeToken="time";
			String payToken="payment";
			int mapxindex=(int)path.toString().indexOf(mapxToken);
			int mapyindex=(int)path.toString().indexOf(mapyToken);
			int timeindex=(int)path.toString().indexOf(timeToken);
			int payindex=(int)path.toString().indexOf(payToken);
			
			String trainType=(String)path.get("trainType");
			odsay.put("trainType", trainType);
			String startSTN=(String)path.get("startSTN");
			odsay.put("startSTN", startSTN);
			String endSTN=(String)path.get("endSTN");
			odsay.put("endSTN", endSTN);
			String mapx=(String)path.toString().substring(mapxindex+4, mapxindex+18);
			mapx=mapx.split(",")[0];
			System.out.println(mapx);
			odsay.put("mapx",mapx);
			String mapy=(String)path.toString().substring(mapyindex+4, mapyindex+18);
			mapy=mapy.split(",")[0];
			odsay.put("mapy",mapy);
			
			String totalTime=(String)path.toString().substring(timeindex+6,timeindex+9);
			totalTime=totalTime.split(",")[0];
			odsay.put("totalTime",totalTime);
			
			String payment=(String)path.toString().substring(payindex+9,payindex+16);
			payment=payment.split(",")[0];
			odsay.put("payment",payment);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println(odsay.toJSONString());
	}

}
