package mypocket.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import mypocket.dto.BudgetDTO;
import mypocket.service.MyPocketService;
import mypocket.service.MyPocketServiceImpl;

public class GetBudgetList {
	public String getbudgetlist(int budget_flag, String schedule_no){
		
		MyPocketService service = new MyPocketServiceImpl();
		ArrayList<BudgetDTO> list = service.select(Integer.parseInt(schedule_no), budget_flag);
	
		JSONObject budgetjson = new JSONObject();	
		JSONArray budgetlist = new JSONArray();
		
		for (int i = 0; i < list.size(); i++) {	
			JSONObject budget = new JSONObject();
			budget.put("kind", list.get(i).getKind());
			budget.put("price", list.get(i).getPrice());	
			budgetlist.add(budget);
		}	
		budgetjson.put("budgetlist", budgetlist);	
		return budgetjson.toJSONString();
	}	
}