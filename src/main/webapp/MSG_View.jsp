<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="msg.MsgDTO" %>
<%@ page import="msg.MsgDAO" %>
<%@ page import="member.MemberDTO"%>
<%@ page import="member.MemberDAO"%>

<%
	request.setCharacterEncoding("utf-8");
	MsgDAO dao = new MsgDAO();
	MemberDAO daoMem = new MemberDAO();
	int MsgCode = Integer.parseInt(request.getParameter("MsgCode"));
	String uri;
	SimpleDateFormat dateFormat= new SimpleDateFormat("yy-MM-dd HH:mm");

	MsgDTO dto;
	
	if(request.getHeader("referer").matches("(.*)RCV(.*)")) {
		uri = "RCV";
		dto = dao.selectView(MsgCode);
		dao.openMsg(MsgCode);
	} else if(request.getHeader("referer").matches("(.*)IMP(.*)")) {
		uri = "IMP";
		dto = dao.selectImpViewR(MsgCode);
		dao.openMsg(MsgCode);
		if(dto.getMsgTitle() == null) {
			uri = "IMP";
			dto = dao.selectImpViewS(MsgCode);
		}
	} else if(request.getHeader("referer").matches("(.*)SND(.*)")) {
		uri = "SND";
		dto = dao.selectSndView(MsgCode);
	} else if(request.getHeader("referer").matches("(.*)DEL(.*)")) {
		uri = "DEL";
		dto = dao.selectDelView(MsgCode);
	} else {
		return;
	}

	dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Messenger</title>
<jsp:include page="CSS.jsp"></jsp:include>
</head>
<body>

<jsp:include page="Sidebar.jsp"></jsp:include>
<jsp:include page="Top.jsp"></jsp:include>

<script>
	function deleteMsg() {
		var form = document.viewForm;
		var confirmed = confirm("메세지를 삭제하시겠습니까?");
		if(confirmed) {
			alert("메세지가 삭제되었습니다.");
			form.method = "post";
			form.action = "DeleteProcess.jsp";
			form.submit();
		} else {
			return;
		}
	}
	
	function deleteSndMsg() {
		var form = document.viewForm;
		var confirmed = confirm("메세지를 삭제하시겠습니까?");
		if(confirmed) {
			alert("메세지가 삭제되었습니다.");
			form.method = "post";
			form.action = "DeleteSndProcess.jsp";
			form.submit();
		} else {
			return;
		}
	}
	
	function deleteImpMsg() {
		var form = document.viewForm;
		var confirmed = confirm("메세지를 삭제하시겠습니까?");
		if(confirmed) {
			alert("메세지가 삭제되었습니다.");
			form.method = "post";
			form.action = "DeleteImpProcess.jsp";
			form.submit();
		} else {
			return;
		}
	}
	function killMsg() {
		var form = document.viewForm;
		var confirmed = confirm("메세지를 영구히 삭제하시겠습니까?");
		if(confirmed) {
			alert("메세지가 삭제되었습니다.");
			form.method = "post";
			form.action = "KillProcess.jsp";
			form.submit();
		} else {
			return;
		}
	}
	
	function downMsg() {
		var form = document.viewForm;
		form.method = "post";
		form.action = "FileDown.jsp";
		form.submit();
	}
</script>

<nav class="navbar">
<div class="container">
	<div class="col-md-12" style="padding-top:50px">

		<form name="viewForm">
			<input type="hidden" name="code" value="<%=MsgCode %>">
			<input type="hidden" name="uriV" value="<%=uri %>">
		
			<table class="table" width="100%" style="border-bottom:lightgray 1px solid">
				<tr>
					<td width="140px"><b>제목</b></td>
					<td>%=dto.getMsgTitle() %></td>
					<td align="right"><%=dateFormat.format(dto.getMsgDate()) %></td>
				</tr>
				<tr>
					<td><b>보낸 사람</b></td>
					<td colspan="2">
						[<%=daoMem.nameT(dto.getMsgSender()) %>]
						<%=daoMem.nameS(dto.getMsgSender()) %>
						<%=daoMem.nameP(dto.getMsgSender()) %>
					</td>
				<tr>
				<tr>
					<td><b>받는 사람</b></td>
					<td colspan="2">
						[<%=daoMem.nameT(dto.getMsgReceiver()) %>]
						<%=daoMem.nameR(dto.getMsgReceiver()) %>
						<%=daoMem.nameP(dto.getMsgReceiver()) %>
					</td>
				<tr>
					<td><b>내용</b></td>
					<td colspan="2" height="100px">
						<%=dto.getMsgContent().replace("\r\n","<br/>") %></td>
				</tr>
				
				<% if(dto.getMsgFName() != null) { %>
					<tr>
						<td><b>첨부파일</b></td>
						<td colspan="2">
							<button type="button" class="btn btn-link" style="padding:0px"
								onclick="downMsg()"><%=dto.getMsgFName() %></button>
						</td>
					</tr>
				<% } %>
			</table>
				
				<% if(request.getHeader("referer").matches("(.*)RCV(.*)")) { %>
					<button type="button" class="btn btn-link"
						onclick="location.href='MSG_RCV.jsp';"
						style="border:lightgray 1px solid; float:left">목록보기</button>
					<button type="button" onclick="deleteMsg()"
							style="float:right" class="btn btn-warning">삭제하기</button>
							
				<% } else if(request.getHeader("referer").matches("(.*)IMP(.*)")) { %>
					<button type="button" class="btn btn-link"
						onclick="location.href='MSG_IMP.jsp';"
						style="border:lightgray 1px solid; float:left">목록보기</button>
					<button type="button" onclick="deleteImpMsg()"
							style="float:right" class="btn btn-warning">삭제하기</button>
							
				<% } else if(request.getHeader("referer").matches("(.*)SND(.*)")) { %>
					<button type="button" class="btn btn-link"
						onclick="location.href='MSG_SND.jsp';"
						style="border:lightgray 1px solid; float:left">목록보기</button>
					<button type="button" onclick="deleteSndMsg()"
							style="float:right" class="btn btn-warning">삭제하기</button>
							
				<% } else if(request.getHeader("referer").matches("(.*)DEL(.*)")) { %>
					<button type="button" class="btn btn-link"
						onclick="location.href='MSG_DEL.jsp';"
						style="border:lightgray 1px solid; float:left">목록보기</button>
					<button type="button" onclick="killMsg()"
							style="float:right" class="btn btn-warning">삭제하기</button>
				<% } %>
				
		</form>
			
	</div>
</div>
</nav>

</body>
</html>