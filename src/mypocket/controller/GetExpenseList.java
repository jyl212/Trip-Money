package mypocket.controller;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import mypocket.dto.ExpenseDTO;
import mypocket.service.MyPocketService;
import mypocket.service.MyPocketServiceImpl;

public class GetExpenseList {
	@SuppressWarnings("unchecked")
	public String getexpenselist(String days, int budget_flag, int schedule_no) {

		MyPocketService service = new MyPocketServiceImpl();
		ArrayList<ExpenseDTO> list = service.expenselist(schedule_no, budget_flag);
		ArrayList<ExpenseDTO> alllist = service.expenseAllList(budget_flag, schedule_no);
		
		if(days!=null){
			if(days.equals("ÀüÃ¼")){
				alllist = service.expenseAllList(budget_flag, schedule_no);
			}else{
				alllist = service.select(days, schedule_no, budget_flag);
			}
		}
		
		JSONObject expensejson = new JSONObject();
		JSONArray expenselist = new JSONArray();
		JSONArray expensealllist = new JSONArray();
		
		for (int i = 0; i < list.size(); i++) {
			JSONObject expense = new JSONObject();
			expense.put("kind", list.get(i).getKind());
			expense.put("bprice", list.get(i).getBudgetPrice());
			expense.put("eprice", list.get(i).getPrice());
			expenselist.add(expense);
		}
		
		for (int i = 0; i < alllist.size(); i++) {
			JSONObject expense = new JSONObject();	
			expense.put("kind", alllist.get(i).getKind());
			expense.put("price", alllist.get(i).getPrice());
			expense.put("schdule_no", alllist.get(i).getSchedule_no());
			expense.put("day", alllist.get(i).getDay());
			expense.put("img", alllist.get(i).getImg());
			expense.put("xnode", alllist.get(i).getXnode());
			expense.put("ynode", alllist.get(i).getYnode());
			
			if(alllist.get(i).getTitle()!=null){
				expense.put("title", alllist.get(i).getTitle());				
			}else{
				expense.put("title", "-");
			}
			
			expense.put("expense_no", alllist.get(i).getExpense_no());
			expense.put("expense_flag", budget_flag);
			
			if(alllist.get(i).getNote()!=null){
				expense.put("note", alllist.get(i).getNote());
			}else{
				expense.put("note", "");
			}
			
			expensealllist.add(expense);
		}
		
		expensejson.put("expenselist", expenselist);
		expensejson.put("expensealllist", expensealllist);

		return expensejson.toJSONString();
	}
}
