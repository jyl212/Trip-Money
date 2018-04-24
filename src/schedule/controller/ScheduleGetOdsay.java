package schedule.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.concurrent.ExecutionException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class ScheduleGetOdsay{
	public JSONObject GetOdayTrain(String sx,String sy,String ex,String ey) throws Exception{
		JSONObject odsay=new JSONObject();
		String realUrl="https://api.odsay.com/v1/api/searchPubTransPath?lang=0&SX="+sx+"&SY="+sy+"&EX="+ex+"&EY="+ey+"&SearchType=0&apiKey=OiEL5w7d4Hw%2fxbU5juzt%2fTPjaGbb%2b%2b3YhSDq7UwB1aU";
		JSONParser parser= new JSONParser();
		URL url=new URL(realUrl);
		URLConnection conn=url.openConnection();
		BufferedReader bis=new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
		JSONObject rootobj;
		try {
			rootobj = (JSONObject)parser.parse(bis);
			JSONObject result=(JSONObject)rootobj.get("result");
			JSONObject trainRequest=(JSONObject)result.get("trainRequest");
			if(trainRequest.get("OBJ")==null){
				trainRequest=(JSONObject)result.get("outBusRequest");
			}
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
			odsay.put("mapx",mapx);
			String mapy=(String)path.toString().substring(mapyindex+4, mapyindex+18);
			mapy=mapy.split(",")[0];
			odsay.put("mapy",mapy);
			
			String totalTime=(String)path.toString().substring(timeindex+6,timeindex+9);
			totalTime=totalTime.split("}")[0];
			odsay.put("totalTime",totalTime);
			
			String payment=(String)path.toString().substring(payindex+9,payindex+16);
			payment=payment.split(",")[0];
			odsay.put("payment",payment);
		} catch (ParseException e) {
		}
		return odsay;
	}
	public JSONObject GetBusList(String sx,String sy,String ex,String ey) throws Exception{
		JSONObject odsay=new JSONObject();
		String realUrl="https://api.odsay.com/v1/api/searchPubTransPath?lang=0&SX="+sx+"&SY="+sy+"&EX="+ex+"&EY="+ey+"&SearchType=0&apiKey=OiEL5w7d4Hw%2fxbU5juzt%2fTPjaGbb%2b%2b3YhSDq7UwB1aU";
		JSONParser parser= new JSONParser();
		URL url=new URL(realUrl);
		URLConnection conn=url.openConnection();
		BufferedReader bis=new BufferedReader(new InputStreamReader(conn.getInputStream(),"utf-8"));
		JSONObject rootobj;
		try {
			rootobj = (JSONObject)parser.parse(bis);
			JSONObject result=(JSONObject)rootobj.get("result");
			JSONArray pathlist=(JSONArray)result.get("path");
			if((JSONArray)pathlist!=null){
				JSONObject path=(JSONObject)pathlist.get(0);
				
				String type=(String)pathlist.get(0).toString();
				String pathToken="pathType";
				String timeToken="totalTime";
				String payToken="payment";
				int typeindex=type.indexOf(pathToken);
				String typedata=type.substring(typeindex+10, typeindex+11);
				odsay.put("type",typedata);
				
				String info=(String)path.get("info").toString();
				int timeindex=info.indexOf(timeToken);
				String totalTime=info.substring(timeindex+11,timeindex+15);
				totalTime=totalTime.split(",")[0];
				odsay.put("totalTime",totalTime);
				int payindex=info.indexOf(payToken);
				String payment=info.substring(payindex+9,payindex+16);
				payment=payment.split(",")[0];
				odsay.put("payment",payment);
				if(typedata.equals("1")){
					int index=0;
					JSONArray busarr=(JSONArray)path.get("subPath");
					int pathsize=busarr.size();
					JSONArray subwaylist=new JSONArray();
					for(int i=1;i<pathsize;i+=2){
						JSONObject businfo=(JSONObject)busarr.get(i);
						JSONArray busarr2=(JSONArray)businfo.get("lane");
						JSONObject busName=(JSONObject)busarr2.get(0);
						JSONObject subway=new JSONObject();
						subway.put("subwayCode",busName.get("name"));
						JSONObject passStopList=(JSONObject)businfo.get("passStopList");
						JSONArray passlist=(JSONArray)passStopList.get("stations");
						JSONArray getpasslist=new JSONArray();
						int size=passlist.size();
						for(int j=0;j<size;j++){
							JSONObject item=(JSONObject)passlist.get(j);
							getpasslist.add(item.get("stationName"));
						}
						subway.put("passlist",getpasslist);
						subway.put("index",index);
						index++;
						subwaylist.add(subway);
						odsay.put("subwaylist",subwaylist);
					}
				}else if(typedata.equals("2")){
					JSONArray busarr=(JSONArray)path.get("subPath");
					int pathsize=busarr.size();
					int index=0;
					JSONArray buslist=new JSONArray();
					for(int i=1;i<pathsize;i+=2){
						JSONObject bus=new JSONObject();
						JSONObject businfo=(JSONObject)busarr.get(i);
						JSONArray busarr2=(JSONArray)businfo.get("lane");
						JSONObject busName=(JSONObject)busarr2.get(0);
						bus.put("busNo",busName.get("busNo"));
						JSONObject passStopList=(JSONObject)businfo.get("passStopList");
						JSONArray passlist=(JSONArray)passStopList.get("stations");
						JSONArray getpasslist=new JSONArray();
						int size=passlist.size();
						for(int j=0;j<size;j++){
							JSONObject item=(JSONObject)passlist.get(j);
							getpasslist.add(item.get("stationName"));
						}
						bus.put("passlist",getpasslist);
						bus.put("index",index);
						index++;
						buslist.add(bus);
						odsay.put("buslist",buslist);
					}
				}else if(typedata.equals("3")){
					JSONArray busarr=(JSONArray)path.get("subPath");
					int pathsize=busarr.size();
					JSONArray subwaylist=new JSONArray();
					JSONArray buslist=new JSONArray();
					int index=0;
					for(int i=1;i<pathsize;i+=2){
						JSONObject businfo=(JSONObject)busarr.get(i);
						JSONArray busarr2=(JSONArray)businfo.get("lane");
						JSONObject busName=(JSONObject)busarr2.get(0);
						if(busName.get("busNo")==null){
							JSONObject subway=new JSONObject();
							subway.put("subwayCode",busName.get("name"));
							JSONObject passStopList=(JSONObject)businfo.get("passStopList");
							JSONArray passlist=(JSONArray)passStopList.get("stations");
							JSONArray getpasslist=new JSONArray();
							int size=passlist.size();
							for(int j=0;j<size;j++){
								JSONObject item=(JSONObject)passlist.get(j);
								getpasslist.add(item.get("stationName"));
							}
							subway.put("passlist",getpasslist);
							subway.put("index",index);
							subwaylist.add(subway);
							
						}else{
							JSONObject bus=new JSONObject();
							bus.put("busNo",busName.get("busNo"));
							JSONObject passStopList=(JSONObject)businfo.get("passStopList");
							JSONArray passlist=(JSONArray)passStopList.get("stations");
							JSONArray getpasslist=new JSONArray();
							int size=passlist.size();
							for(int j=0;j<size;j++){
								JSONObject item=(JSONObject)passlist.get(j);
								getpasslist.add(item.get("stationName"));
							}
							bus.put("passlist",getpasslist);
							bus.put("index",index);
							buslist.add(bus);
						}
						index++;
						odsay.put("buslist",buslist);
						odsay.put("subwaylist",subwaylist);
					}
				}
			}else{
				JSONObject odsay1=new JSONObject();
				JSONObject odsay2=new JSONObject();
				odsay1=GetOdayTrain(sx, sy, ex, ey);
				sx=(String)odsay1.get("mapx");
				sy=(String)odsay1.get("mapy");
				odsay2=GetBusList(sx, sy, ex, ey);
				odsay.put("odsay1",odsay1);
				odsay.put("odsay2",odsay2);
			}
		} catch (ParseException e) {
		}
		return odsay;
	}
}
