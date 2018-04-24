 <%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script type="text/javascript">
function change_url(menuurl, url){
	menupath = encodeURIComponent(menuurl);
	viewpath = encodeURIComponent(url);
	location.href="/webProject/member/view.html?menuurl="+menupath+"&url="+viewpath;
}
</script>
</head>

<body>
	<h3>관리자 페이지</h3>
	
	<div class="list-group">
		<a href="/webProject/member/listread.do?state=NORMAL" class="list-group-item">회원관리</a>
		<a href="/webProject/share/list.do" class="list-group-item">공유페이지 관리</a>
	</div>
</body>
</html>
