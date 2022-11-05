<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDTO" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>

<%
	MemberDAO dao = new MemberDAO();

	int count = dao.selectQCount();
	String tempStart = request.getParameter("page");
	int startPage = 0;
	int onePageCount = 10;	
	count = (int)Math.ceil((double)count/(double)onePageCount);
	
	if(tempStart != null) { 
		startPage = (Integer.parseInt(tempStart)-1)*onePageCount;
	}
	
	List<MemberDTO> memberList = dao.memberQPage(startPage, onePageCount);
	dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Messenger</title>
<jsp:include page="CSS.jsp"></jsp:include>
</head>
<body style="overflow:hidden">

<jsp:include page="Sidebar.jsp"></jsp:include>
<jsp:include page="Top.jsp"></jsp:include>

<nav class="navbar">
<div class="container">
	<div class="col-md-12" align="left" style="margin:30px 0px 15px 0px">
		<h1 class="display-3">회원관리</h1>
	</div>
	
	<div class="col-md-12" style="float:right; margin-bottom:15px">
		<input type="button" onclick="location.href='AdminPageQ.jsp'"
				class="btn btn-default" value="퇴사목록"
				style="float:right; margin-right:15px; border:lightgray 1px solid; background:NONE; color:#1E90FF">
		<input type="button" onclick="location.href='AdminPage.jsp'"
				class="btn btn-primary" value="재직목록"
				style="float:right; margin-right:7px">
	</div>
	
	<div class="row" style="width:100%">
		<div class="col-md-12">
		
			<table class="table" width="100%"
		 	  		style="border-bottom:lightgray 1px solid">
		        <tr align="center">
		            <th width="18%">아이디</th>
		            <th width="13%">팀</th>
		            <th width="11%">이름</th>
		            <th width="11%">직급</th>
		            <th width="17%">전화번호</th>
		            <th width="15%">입사일</th>
		            <th width="15%">퇴사일</th>
		        </tr>
		        
		        <% if(memberList.isEmpty()) { %>
			        <tr>
				        <td colspan="9" align="center">
				        	퇴사처리된 목록이 존재하지 않습니다.
				        </td>
			        </tr>
			        
		        <%
		        } else {
		        	for(int i=0; i<memberList.size(); i++) {
		        		MemberDTO dto = memberList.get(i);
		        %>
					<tr align="center">
						<td><%=dto.getmId() %></td>
						<td><%=dto.gettName() %></td>
						<td><%=dto.getmName() %></td>
						<td><%=dto.getpName() %></td>
						<td><%=dao.getCall(dto.getmCall()) %></td>
						<td><%=dto.getmJoin() %></td>
						<td><%=dto.getmQuit() %></td>
					</tr>
				<% } }; %>
			</table>
			
			<div align="center">
				<%
					for(int i=1; i<=count; i++) {
				%>
					<input type="button" value="<%=i %>" class="btn btn-secondary"
						onclick="location.href='AdminPage.jsp?page=<%=i%>';"
						style="border-radius:100px; width:40px; height:40px;
						align-items:center; justify-content:center;
						background:#D8D8D8; border:NONE; font-weight:bold">
				<% } %>
			<div>
		
		</div>
	</div>
</div>
</nav>

</body>
</html>