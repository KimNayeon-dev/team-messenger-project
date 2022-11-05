<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.MemberDTO" %>
<%@ page import = "member.MemberDAO" %>
<%@ page import = "java.util.ArrayList" %>    
    
<%
	String mId = request.getParameter("M_ID");
	String mPw = request.getParameter("M_PW");

	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMemberDTO(mId, mPw);
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
	function quitMsg() {
		var form = document.quitForm;
		if(!form.quit.value) {
			alert("퇴사일을 입력해주세요.");
			return false;
		} else {
			alert("퇴사처리 되었습니다.");
			form.action = "QuitProcess.jsp" 
			form.method = "post";
			form.submit();
		}
	}
</script>

<nav class="navbar">
<div class="container">
	<div class="col-md-12" style="margin:30px 0px 40px 0px">
		<h1 class="display-3">퇴사처리</h1>
		<br><hr>
	</div>

	<div class="col-md-12">	
		<form name="quitForm" class="form-horizontal">
		
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">아이디</label>
				<div class="col-md-auto" style="color:grey">
					<%=dto.getmId() %>
					<input type="hidden" name="id" value="<%=dto.getmId() %>">
					<input type="hidden" name="pw" value="<%=dto.getmPw()%>">
				</div>
			</div>
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">이름</label>
				<div class="col-md-auto" style="color:grey"">		
					<%=dto.getmName() %>
					<input type="hidden" name="name" value="<%=dto.getmName() %>">
				</div>
			</div>
			
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">소속 팀</label>
				<div class="col-md-auto" style="color:grey">
					<%=dto.gettName() %>
					<input type="hidden" name="tcode" value="<%=dto.gettCode() %>">
				</div>
			</div>
			
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">직급</label>
				<div class="col-md-auto" style="color:grey">
					<%=dto.getpName() %>
					<input type="hidden" name="pcode" value="<%=dto.getpCode() %>">
				</div>
			</div>
			
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">전화번호</label>
				<div class="col-md-auto" style="color:grey">
					<%=dao.getCall(dto.getmCall()) %>
					<input type="hidden" name="call" value="<%=dto.getmCall() %>">
				</div>
			</div>
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">주소</label>
				<div class="col-md-6" style="color:grey">
					<%=dto.getmAddr() %>
				</div>	
			</div>
				
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">이메일</label>
				<div class="col-md-auto" style="color:grey">
					<%=dto.getmEmail() %>
				</div>
			</div>
			
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">입사일</label>
				<div class="col-md-auto" style="color:grey">
					<input type="date" name="join" class="form-control" 
							value="<%=dto.getmJoin() %>" readonly>
					<input type="hidden" name="join" value="<%=dto.getmJoin() %>">
				</div>	
			</div>
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">퇴사일</label>
				<div class="col-md-auto">
					<input type="date" name="quit" class="form-control">
				</div>	
			</div>
			
			<div style="float:right">
				<input type="submit" onclick="quitMsg()"
						class="btn btn-secondary" value="퇴사처리">
			</div>
			
		</form>	
	</div>
</div>
</nav>

</body>
</html>