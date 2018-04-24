package mypocket.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mypocket.dto.ExpenseDTO;
import mypocket.service.MyPocketService;
import mypocket.service.MyPocketServiceImpl;


@WebServlet(name = "mypocket/expenseregi", urlPatterns = { "/mypocket/expenseregi.do" })
public class ExpenseRegiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		String saveFolder = "/f_mypocket/upload";
		String encType = "euc-kr";
		int size = 5*1024*1024;//5Mbyte
		String realpath = "";		
		ServletContext context = getServletContext();
		realpath = context.getRealPath(saveFolder);
		
		if(size>5*1024*1024){
			PrintWriter out = response.getWriter(); 
			out.println("alert('���������� ���� ó�� �Ǿ����ϴ�');"); 
		}
		MultipartRequest multipart = new MultipartRequest(request, realpath, size, encType, new DefaultFileRenamePolicy());
		String fileName = "";
		int count = 0;
		Enumeration<String> files = multipart.getFileNames();
		while(files.hasMoreElements()){//���ϸ���������
			count++;
			
			String file = files.nextElement();//���ϸ��� ������
			fileName = multipart.getFilesystemName(file);
			/*System.out.println(fileName);
			System.out.println(multipart.getOriginalFileName(file));*/
			
			request.setAttribute("image"+count, fileName);
		}
		
		String kind = multipart.getParameter("kind");
		String note = multipart.getParameter("note");
		String price = multipart.getParameter("price");
		String xnode = multipart.getParameter("latitude");
		String ynode = multipart.getParameter("longitude");
		String expenseFlag = multipart.getParameter("expenseFlag");
		String schedule_no = multipart.getParameter("scheduleNo");
		String days = multipart.getParameter("days");
		String title = multipart.getParameter("loc");
		
		System.out.println(title);
		int state=0;
		//dto�� ���� ����...
		if(expenseFlag.equals("true")){//����
			state=1;
		}else{//����
			state=0;
		}/*
		
		if(title.equals("�������� ��ġ�� ������ �ּ���")){
			title = null;
		}*/
		
		ExpenseDTO expenseInfo = new ExpenseDTO(state, days , Integer.parseInt(price), note, xnode, ynode, fileName, kind, Integer.parseInt(schedule_no),title);

		//service ȣ��
		MyPocketService service = new MyPocketServiceImpl();
		int result = service.insert(expenseInfo);
		
		request.setAttribute("viewpath", "/f_mypocket/layout_mypocket/expense_regi.jsp");
		request.setAttribute("menupath", "/f_mypocket/layout_mypocket/mypocket_menu.jsp");
		
		RequestDispatcher rd = request.getRequestDispatcher("/f_mypocket/layout_mypocket/mainLayout.jsp");
        rd.forward(request, response);       
	}
}