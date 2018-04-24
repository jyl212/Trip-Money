<%@page import="member.dto.MemberDTO"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="share.dto.ShareDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/webProject/f_share/css_share/share.css">
<link type="text/css" rel="stylesheet"
	href="/webProject/f_tourist/css_tourist/tourist.css" media="screen" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".sharedetail").on("click",function(){	
			var no=$(this).children('.schedule_no').text();
			var days=$(this).children('.days').text();
			window.open("/webProject/f_share/layout_share/detail_schedule_share.jsp?scheduleNo="+no+"&days="+days);
		});
	});
</script>
</head>
<body>
	<% MemberDTO user = (MemberDTO)session.getAttribute("loginUser");%>
	<%
		ArrayList<ShareDTO> sharelist = (ArrayList<ShareDTO>)request.getAttribute("list"); 
		int size = sharelist.size();
		
		String img="";
		String schedule_title="";
		String note="";
		String start_date="";
		String end_date="";
		String like_count="";
		String update_date="";
		String mem_id="";
		String schedule_share="";
		String schedule_no="";
		String nickname = "";
	%>
	<h2 style="margin-top:45px; margin-left: 5px;"><img src="/webProject/f_share/img_share/share_b.png" style="width:45px; height:auto; margin-left:40px; margin-top:-6px">공유 페이지</h2>
	<hr style="width:1400px; margin-left: -40px;"/>
		<form action="/webProject/share/list.do">
	 <input class="form-control" type="text" name="search" id="search"  style="margin-left:1080px;border-left-style:none; float:left;width:300px" placeholder="검색" required/>
     <button type="submit" class="btn btn-primary" id="Search_btn" style="width:50px;padding-left:5px;padding-right: 5px;float:left; margin-left:-1px;"><i class="glyphicon glyphicon-search" aria-hidden="true" style="margin-left:10px;"></i><span style="margin-left:10px;"></span></button>
    <br>
    </form>
	<%for(int i =0 ; i< size; i++) {%>
	<% 	
		ShareDTO sharedata = sharelist.get(i);
		schedule_no = sharedata.getSchedule_no();
		start_date = sharedata.getStart_date();
		start_date = start_date.substring(0,10);
		end_date = sharedata.getEnd_date();
		end_date = end_date.substring(0,10);
		schedule_title = sharedata.getSchedule_title();
		schedule_share = sharedata.getSchedule_share();
		update_date = sharedata.getUpdate_date();
		update_date = update_date.substring(0,10);
		note = sharedata.getNote();
		img = sharedata.getImg();
		like_count = sharedata.getLike_count();
		mem_id = sharedata.getMem_id();
		nickname = sharedata.getNickname();
		%>
		<div class="sharebox" style="border-radius: 3px; width: 230px; height: 400px; margin-left: 55px; margin-bottom: 15px;">
			<div class="sharedetail">
				<img src="<%=img %>" style="border-radius: 3px; width: 230px; height: 160px;" />
				<p class="textin2" style="margin-left: 8px;"> <%=schedule_title %> </p>
				<p class="schedule_no" style="display:none;"><%=schedule_no %></p>
				<%
				String start = start_date;
			    String end = end_date;
			    long diff = 0;
			    long detaildays = 0;
			    try {
			    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			        Date beginDate = formatter.parse(start);
			        Date endDate = formatter.parse(end);
			         
			        diff = endDate.getTime() - beginDate.getTime();
			        detaildays = diff / (24 * 60 * 60 * 1000);		         
			    } catch (ParseException e) {
			        e.printStackTrace();
			    } %>
			    <p class="days" style="display:none; margin-left: 8px;"><%= detaildays+1 %></p>
				<p class="textin2" Style="margin-left: 8px;"> <%=start_date %> ~ <%=end_date %></p>
				<p Style="margin-left: 8px; color: #747474;"> <%=note %> </p>
				<p Style="font-size: 12px; position:absolute; margin-left:80px; margin-top: 50px; color: #747474; float:right;">닉네임 <%=nickname %> / 추천수 <span style="color:red;"><%=like_count %></span></p>
			</div>
			
		<%if(user!=null){%>
			<div class="like" id="<%=schedule_no%>" >
				<button type="button" class="btn btn-danger btn-circle btn-lg" Style="position:absolute; margin-left:20px; margin-top:40px;" onclick="change1(this)"><i class="glyphicon glyphicon-heart"></i></button>
			</div>
		<%} %>
				
			
		</div>
	<%} %>
		
	<script type="text/javascript">
	$(document).ready(function(){
		$(".like").on("click", function(){
			var id = $(this).attr("id");
		   //좋아요 했을때
		    location.href="/webProject/share/like.do?user=<%=user.getMem_id()%>&content="+id;
		});
	});
	</script>
		
	
	


</body>
</html>