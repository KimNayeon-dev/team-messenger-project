<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="msg.MsgDTO"%>
<%@ page import="msg.MsgDAO"%>
    
<%
	String mId = session.getAttribute("id").toString();
	String mName = session.getAttribute("name").toString();
	String mPst = session.getAttribute("position").toString();
	MsgDAO dao = new MsgDAO();
	int newMsg = dao.askNewMsg(mId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Messenger</title>
<jsp:include page="CSS.jsp"></jsp:include>
</head>
<body>

<script>
	function adminMenu() {
		var form = document.memberForm;
		form.action = "AdminPage.jsp"
		form.method = "post"
		form.submit();
	}
	function memberInfo() {
		var form = document.memberForm;
		form.action = "MyProfile.jsp"
		form.method = "post"
		form.submit();
	}
	function logoutMsg() {
		var form = document.memberForm;
		form.action = "LogoutProcess.jsp"
		form.method = "post"
		form.submit();
		alert("로그아웃되었습니다.");
	}
</script>

<nav class="navbar" style="border-bottom:rgb(234, 234, 244) 1px solid">
	<div class="container">
	
		<div class="navbar-header">
			<span class="navbar-brand"><%=mName %>(<%=mId %>)</span>
			
			<%
				if(newMsg > 0) {
					if(newMsg < 100) {
			%>
					<input type="button" value="<%=newMsg %>" align="center"
						style="width:27px; height:27px;
							background:salmon; color:white; font-size:0.8rem; font-weight:bold;
								border-radius:100px; border:NONE">
				<% } else if(newMsg < 1000) { %>
					<input type="button" value="<%=newMsg %>" align="center"
							style="width:34px; height:27px;
								background:salmon; color:white; font-size:0.8rem; font-weight:bold;
									border-radius:100px; border:NONE">
				<% } else if(newMsg < 10000) { %>
					<input type="button" value="<%=newMsg %>" align="center"
							style="width:42px; height:27px;
								background:salmon; color:white; font-size:0.8rem; font-weight:bold;
									border-radius:100px; border:NONE">
				<% } else { %>
					<input type="button" value="<%=newMsg %>" align="center"
							style="width:50px; height:27px;
								background:salmon; color:white; font-size:0.8rem; font-weight:bold;
									border-radius:100px; border:NONE">
				<% } %>
				<a href="MSG_RCV.jsp" class="navbar-brand"
					style="font-size:1rem; font-weight:bold; color:salmon">새로운 메세지</a>
			<% } %>
		</div>
		
		<div class="navbar-header" align="right">
			<% if(mId != null) { %>
				<form name="memberForm">
					<% if(mPst.equals("관리자")) { %>
						<input type="submit" onclick="adminMenu()" value="회원관리"
							class="btn btn-info" style="margin-right:3px">
					<% } %>
					<input type="submit" onclick="memberInfo()" value="내 정보"
						class="btn btn-default" style="margin-right:3px; border:lightgray 1px solid; background:NONE; color:#1E90FF">
					<input type="submit" onclick="logoutMsg()" value="로그아웃"
						class="btn btn-default" style="border:lightgray 1px solid; background:NONE; color:#1E90FF">
				</form>
			<% } else { response.sendRedirect("LoginForm.jsp"); } %>
		</div>
		
	</div>
</nav>

</body>
</html>