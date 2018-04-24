<%@page import="member.dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mypocket.service.MyPocketServiceImpl"%>
<%@page import="mypocket.service.MyPocketService"%>
<%@page import="mypocket.dto.BudgetDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="/webProject/f_mypocket/css_mypocket/style.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="/webProject/f_mypocket/js_mypocket/Filechose.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<!-- <style type="text/css">
.bagimg{
background-image: url(/webProject/f_mypocket/img_mypocket/sky.jpg);  
no-repeat center center fixed;
-webkit-background-size: cover;
-moz-background-size: cover;
-o-background-size: cover;
background-size: cover;
}
</style> -->
</head>
<body class="bagimg">
	<%
		String scheduleNo = (String) session.getAttribute("scheduleNo");
		MemberDTO user = (MemberDTO) session.getAttribute("loginUser");
		String mem_id = "";
		if (user != null) {
			mem_id = user.getMem_id();
		} else {
			mem_id = "guest";
		}
	%>

	<div style="margin-top :50px;">
		<ul id="myTab" class="nav nav-tabs nav-justified" role="tablist">

			<li role="presentation" class="active"><a data-target="#b_regi"
				id="b_together_tab" role="tab" data-toggle="tab"
				aria-controls="b_together" aria-expanded="true">공금</a></li>

			<li role="presentation" class=""><a data-target="#b_regi"
				role="tab" id="b_private_tab" data-toggle="tab"
				aria-controls="b_private" aria-expanded="false">개인</a></li>
		</ul>

		<div class="col-sm-5">
			<div role="tabpanel" class="tab-pane fade active in" id="b_regi"
				aria-labelledby="b_together_tab">
				<form id="budgetform" name="budgetform" method="POST">

					<div class="row">
						<input type="text" id="scheduleNo" name="scheduleNo"
							value="<%=scheduleNo%>" />
						<div class="input-group"
							style="margin-bottom: 10px; margin-top: 40px;">
							<div class="input-group-btn">
								<select class="form-control" name="kind" id="kind"
									style="width: 100px; font-size:12px; margin-right: 20px;margin-left: 90px; border-radius: 4px;" required>
									<option>숙박비</option>
									<option>식비</option>
									<option>교통비</option>
									<option>입장료</option>
									<option>쇼핑</option>
									<option>기타</option>
								</select>
							</div>
							<input type="text" id="budgetFlag" name="budgetFlag" />
							<div class="input-group">
								<input type="text" class="form-control"
									placeholder="예산을 입력해 주세요." name="price" id="price"
									onkeypress="isNum()" required="required" style="font-size:12px;background-color:#f9f9f9 "> <span
									class="input-group-addon">원</span> <span
									class="input-group-btn">
									<button class="btn btn-default" type="button" id="insertbtn" style=" color:white; background-color:#27a1db;">등록</button>
								</span>
							</div>
						</div>
						<!-- /input-group -->
					</div>

				</form>
			</div>
			<div id="result" style="margin-left: 90px; margin-top: 10px;"></div>
				<div>
		<button class="btn btn-default" type="button" id="anothersch" style="margin-top: 20px;margin-left: 80px; background-color:#27a1db; color:white;">다른 일정 선택</button>
	    </div>
		</div>	
		<div class="col-sm-5">
			<div id="piechart" style="width: 600px; height: 400px; margin-top: 20px;margin-left: 100px;"></div>
		</div>
	</div>
	
	<script type="text/javascript">
		
		$(document).ready(function() {
			$("#scheduleNo").hide();
			$("#budgetFlag").hide();
			$("#budgetFlag").val(0);
			
			$.ajax({
				url : "/webProject/mypocket/budgetlist.do",
				type : "post",
				data : {"scheduleNo":$("#scheduleNo").val(),
						"budget_flag":$("#budgetFlag").val()
						},
				dataType : "json",
				success : success_run
			});
			
			$("#b_together_tab").on("click",function(){
		 		$("#budgetFlag").val(0);
		 		$.ajax({
					url : "/webProject/mypocket/budgetlist.do",
					type : "post",
					data : {"scheduleNo":$("#scheduleNo").val(),
							"budget_flag":$("#budgetFlag").val()
							},
					dataType : "json",
					success : success_run
				});
		 	});
			$("#b_private_tab").on("click",function(){
		 		$("#budgetFlag").val(1);
		 		$.ajax({
					url : "/webProject/mypocket/budgetlist.do",
					type : "post",
					data : {"scheduleNo":$("#scheduleNo").val(),
							"budget_flag":$("#budgetFlag").val()
							},
					dataType : "json",
					success : success_run
				});
		 	});

			$("#anothersch").on("click",function(){
				location.href = "/webProject/loginfilter/schedule/listSchedule.do?STATE=mypocket&mem_id=<%=mem_id%>";
				});
			//ajax insert
			$("#insertbtn").on("click",function() {
				if ($("#price").val() == 0) {
					alert("금액을 입력해주세요!");
				} else {
					$.ajax({
						url : "/webProject/mypocket/setbudget.do",
						type : "post",
						data : {
						"scheduleNo" : $("#scheduleNo").val(),
						"budget_flag" : $("#budgetFlag").val(),
						"kind" : $("#kind option:selected").val(),
						"price" : $("#price").val()
						},
						dataType : "json",
						success : success_run
					});
				$("#price").val("");
				}
			});

			//ajax delete
			$(document).on("click",".deletebtn",function() {
				$.ajax({
						url : "/webProject/mypocket/delete.do",
						type : "post",
						data : {"scheduleNo" : $("#scheduleNo").val(),
								"budget_flag" : $("#budgetFlag").val(),
								"kind" : $(this).closest("tr").find(".kindname").text()
								},
								dataType : "json",
								success : success_run
							});
								alert("선택하신 항목을 삭제하였습니다.");
							});

			//ajax edit
			$(document).on("click",".editbtn",function() {
				$("#price").val($(this).closest("tr").find(".lprice").text());
				$("#kind").val($(this).closest("tr").find(".kindname").text());
				$.ajax({
						url : "/webProject/mypocket/budgetlist.do",
						type : "post",
						data : {"scheduleNo" : $("#scheduleNo").val(),
								"budget_flag" : $("#budgetFlag").val(),
								"kind" : $(this).closest("tr").find(".kindname").text()
								},
						dataType : "json",
						success : success_run
				});
			});
		});

		function success_run(budget) {
			size = budget.budgetlist.length;
			$("#result").empty();
			var str = '<table class="table"><tr><th style="text-align: center;">항목</th><th style="text-align: center;">금액</th><th style="text-align: center;">수정</th><th style="text-align: center;">삭제</th>';
			for (i = 0; i < size; i++) {
				str += '<tr><td class="kindname">' + budget.budgetlist[i].kind
						+ '</td>';
				str += '<td class="lprice">' + budget.budgetlist[i].price
						+ '</td>'
				str += '<td><a class="editbtn">수정</a></td>'
				str += '<td><a class="deletebtn">삭제</a></td></tr>'
				str += '</div>'
			}
			str += '</table>'
			$("#result").append(str);
			google.charts.load('current', {
				'packages' : [ 'corechart' ]
			});

			google.charts.setOnLoadCallback(drawChart);

			function drawChart() {

				if (size == 0) {
					var data = google.visualization.arrayToDataTable([
							[ '예산', '금액' ], [ '예산설정을 해주세요.', 1 ] ]);
				}

				if (size == 1) {
					var data = google.visualization.arrayToDataTable([
							[ '예산', '금액' ],
							[ budget.budgetlist[0].kind,
									budget.budgetlist[0].price ] ]);
				} else if (size == 2) {
					var data = google.visualization.arrayToDataTable([
							[ '예산', '금액' ],
							[ budget.budgetlist[0].kind,
									budget.budgetlist[0].price ],
							[ budget.budgetlist[1].kind,
									budget.budgetlist[1].price ] ]);
				} else if (size == 3) {
					var data = google.visualization.arrayToDataTable([
							[ '예산', '금액' ],
							[ budget.budgetlist[0].kind,
									budget.budgetlist[0].price ],
							[ budget.budgetlist[1].kind,
									budget.budgetlist[1].price ],
							[ budget.budgetlist[2].kind,
									budget.budgetlist[2].price ] ]);
				} else if (size == 4) {
					var data = google.visualization.arrayToDataTable([
							[ '예산', '금액' ],
							[ budget.budgetlist[0].kind,
									budget.budgetlist[0].price ],
							[ budget.budgetlist[1].kind,
									budget.budgetlist[1].price ],
							[ budget.budgetlist[2].kind,
									budget.budgetlist[2].price ],
							[ budget.budgetlist[3].kind,
									budget.budgetlist[3].price ] ]);
				} else if (size == 5) {
					var data = google.visualization.arrayToDataTable([
							[ '예산', '금액' ],
							[ budget.budgetlist[0].kind,
									budget.budgetlist[0].price ],
							[ budget.budgetlist[1].kind,
									budget.budgetlist[1].price ],
							[ budget.budgetlist[2].kind,
									budget.budgetlist[2].price ],
							[ budget.budgetlist[3].kind,
									budget.budgetlist[3].price ],
							[ budget.budgetlist[4].kind,
									budget.budgetlist[4].price ] ]);
				} else if (size == 6) {
					var data = google.visualization.arrayToDataTable([
							[ '예산', '금액' ],
							[ budget.budgetlist[0].kind,
									budget.budgetlist[0].price ],
							[ budget.budgetlist[1].kind,
									budget.budgetlist[1].price ],
							[ budget.budgetlist[2].kind,
									budget.budgetlist[2].price ],
							[ budget.budgetlist[3].kind,
									budget.budgetlist[3].price ],
							[ budget.budgetlist[4].kind,
									budget.budgetlist[4].price ],
							[ budget.budgetlist[5].kind,
									budget.budgetlist[5].price ] ]);
				}

				var options = {
					title : '예산 그래프'
				};

				var chart = new google.visualization.PieChart(document
						.getElementById('piechart'));

				chart.draw(data, options);
			}
		}
		var key = event.keyCode;
		if (!(key == 8 || key == 9 || key == 13 || key == 46 || key == 144
				|| (key >= 48 && key <= 57) || key == 110 || key == 190)) {
			alert('숫자를 입력해주세요');
			event.returnValue = false;
		}
	</script>
</body>
</html>
