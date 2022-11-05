<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.MemberDTO" %>
<%@ page import = "member.MemberDAO" %>

<%
	String mId = session.getAttribute("id").toString();
	String mName = session.getAttribute("name").toString();
	String mPw = session.getAttribute("pw").toString();
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMemberDTO(mId, mPw);
	
	String[] callArr = dto.getmCall().split("");
	String callStr = "";
	for(int i=0; i<callArr.length; i++) {
		callStr = callStr + callArr[i];
	}
	String mCall = dao.getCall(callStr);
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
	<div class="col-md-12" style="margin:30px 0px 40px 0px">
		<div style="float:right; padding-top:80px">
			<input type="button" onclick="location.href='AcountChk.jsp'"
				class="btn btn-primary" style="float:right" value="내 정보 수정">
		</div>
		<h1 class="display-3">내 정보</h1>
		<br><hr>
	</div>
		
	<div class="col-md-12">
		<form name="profileForm">
		
			<div class="form-group row">
				<label class="col-md-2" style="font-weight:bold">아이디</label>
				<div class="col-md-auto" style="color:grey">
					<%=mId %>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2" style="font-weight:bold">이름</label>
				<div class="col-md-auto" style="color:grey">
					<%=mName %>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2" style="font-weight:bold">소속 팀</label>
				<div class="col-md-auto" style="color:grey">
					<%=dto.gettName() %>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2" style="font-weight:bold">직급</label>
				<div class="col-md-auto" style="color:grey">
					<%=dto.getpName() %>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2" style="font-weight:bold">전화번호</label>
				<div class="col-md-auto" style="color:grey">
					<%=mCall %>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2" style="font-weight:bold">주소</label>
					<div class="col-md-auto" style="color:grey">
						<%=dto.getmAddr() %>
					</div>	
				</div>
			<div class="form-group row">
				<label class="col-md-2" style="font-weight:bold">이메일</label>
				<div class="col-md-auto" style="color:grey">
					<%=dto.getmEmail() %>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-2" style="font-weight:bold">입사일</label>
				<div class="col-md-auto" style="color:grey">
					<%=dto.getmJoin() %>
				</div>	
			</div><br>
			
		</form>
	</div>
</div>
</nav>

</body>
</html>