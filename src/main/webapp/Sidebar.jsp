<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Messenger</title>
<jsp:include page="CSS.jsp"></jsp:include>
</head>
<body>

<div style="float:left">
	<ul class="list-unstyled" align="center"
		style="width:250px; height:200vh; padding-top:56px; background:whitesmoke">
		
		<li><button type="button" onclick="location.href='MSG_Write.jsp';"
			style="width:200px; margin-bottom:30px"
			class="btn btn-primary">메세지 작성</button></li>
			
		<li><button type="button" onclick="location.href='MSG_RCV.jsp';"
			style="width:100%; height:46px; border:NONE; background:NONE; color:#1E90FF"
			class="btn btn-default">받은 메세지</button></li>
		
		<li><button type="button" onclick="location.href='MSG_IMP.jsp';"
			style="width:100%; height:46px; border:NONE; background:NONE; color:#1E90FF"
			class="btn btn-default">중요 메세지</button></li>
		
		<li><button type="button" onclick="location.href='MSG_SND.jsp';"
			style="width:100%; height:46px; border:NONE; background:NONE; color:#1E90FF"
			class="btn btn-default">보낸 메세지</button></li>
		
		<li><button type="button" onclick="location.href='MSG_DEL.jsp';"
			style="width:100%; height:46px; border:NONE; background:NONE; color:#1E90FF"
			class="btn btn-default">휴지통</button></li>
	
	</ul>
</div>

</body>
</html>