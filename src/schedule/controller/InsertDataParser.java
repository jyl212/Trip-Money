package schedule.controller;

import java.util.ArrayList;
import java.util.Vector;

import schedule.service.ScheduleDetailService;
import schedule.service.ScheduleDetailServiceImpl;

public class InsertDataParser {
	public int insert(String data,int totaldays,String scheduleid){
		String[] daydata=new String[totaldays];
		String[] days=new String[totaldays];
		int result=0;
		for(int i=1;i<=totaldays;i++){
			days[i-1]="day"+i+"::";
		}
		for(int i=0;i<days.length;i++){
			if(data.split(days[i]).length>1){
				if(i==days.length-1){
					String tempdata=data.split(days[i])[1];
					daydata[i]=tempdata;
				}else{
					String tempdata=data.split(days[i])[1];
					daydata[i]=tempdata.split(days[i+1])[0];
				}
			}
		}
		
		for(int i=0;i<daydata.length;i++){
			System.out.println(daydata[i]+"daydata");
			if(daydata[i]!=null){
				if(!(daydata[i].equals("::::::::"))){
					String mapxdata=daydata[i].split("::")[0];
					String mapydata=daydata[i].split("::")[1];
					String titledata=daydata[i].split("::")[2];
					String imagedata=daydata[i].split("::")[3];
					String contentdata=daydata[i].split("::")[4];
					
					String[] mapx=mapxdata.split(",");
					String[] mapy=mapydata.split(",");
					String[] title=titledata.split(",");
					String[] image=imagedata.split(",");
					String[] contentid=contentdata.split(",");
					String scheduleDaysNo=scheduleid+"-"+(i+1);
					ScheduleDetailService service=new ScheduleDetailServiceImpl();
					if(mapx!=null){
						result=service.insert(mapx, mapy, title, image, contentid, scheduleDaysNo);
					}
				}
			}
		}
		return result;
	}
}
