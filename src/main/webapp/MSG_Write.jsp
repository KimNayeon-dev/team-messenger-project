<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "member.MemberDTO" %>
<%@ page import = "member.MemberDAO" %>

<%
	String mId = session.getAttribute("id").toString();
	String mPw = session.getAttribute("pw").toString();
	String userName = session.getAttribute("name").toString();
	
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberDTO> memberList = dao.getMember();
	
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

<script>
	function writeMsg() {
		var form = document.writeForm;
		if(!form.receiver.value) {
			alert("받는 사람을 선택해주세요.");
			return false;
		} else if(!form.title.value) {
			alert("제목을 입력해주세요.");
			return false;
		} else if(form.title.value.length > 60) {
			alert("제목은 최대 60자까지 입력해주세요.");
			return false;
		} else if(!form.content.value) {
			alert("내용을 입력해주세요.");
			return false;
		} else if(form.title.value.length > 2000) {
			alert("내용은 최대 2000자까지 입력해주세요.");
			return false;
		} else {
			alert("메세지가 전송되었습니다.");
			form.action = "WriteProcess.jsp";
			form.method = "post"
			form.submit();
		}
	}
</script>

<nav class="navbar">
<div class="container">
	<div class="col-md-12" align="left" style="margin:30px 0px 40px 0px">
		<h1 class="display-3">메세지 작성</h1>
	</div>
	
	<div class="row" style="width:100%">
		<div class="col-md-12">
		
			<form name="writeForm" enctype="Multipart/form-data">
				<table class="table" width="100%" style="border-bottom:lightgray 1px solid">
					<tr>
						<td width="140px">보내는 사람</td>
						<td>
							<%=session.getAttribute("name") %>
						</td>
					</tr>
					<tr>
						<td style="vertical-align:initial">받는 사람</td>
						<td style="vertical-align:initial">
							<% if(memberList.isEmpty()) { %>
								<span>(받는 사람 정보 없음)</span>
							<% } else { %>
							<select name="receiver" class="form-control">
							<%
								for(int i=0; i<memberList.size(); i++) {
									MemberDTO member = memberList.get(i);
							%>
								<option value="<%=member.getmId() %>">
									[<%=member.gettName() %>]
										<%=member.getmName() %>
											<%=member.getpName() %></option>
							<% } } %>
							</select>
						</td>
					</tr>
					<tr>
						<td style="vertical-align:initial">제목</td>
						<td style="vertical-align:initial">
							<input type="text" name="title" placeholder="제목"
									class="form-control" width="200px">
						</td>
					</tr>
					<tr>
						<td style="vertical-align:initial">내용</td>
						<td style="vertical-align:initial">
							<textarea name="content" rows="14" cols="40"
									placeholder="내용" class="form-control"
									style="resize:NONE"></textarea>
						</td>
					</tr>
					<tr>
						<td style="vertical-align:initial">첨부파일</td>
						<td style="vertical-align:initial">
							<input type="file" name="fileName">
						</td>
					</tr>
				</table>
					
				<input type="submit" value="보내기" onclick="writeMsg()"
						class="btn btn-primary" style="float:right">
			</form>
			
		</div>
	</div>
</div>
</nav>

</body>
</html>