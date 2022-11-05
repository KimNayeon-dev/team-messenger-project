<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.MemberDTO" %>
<%@ page import = "member.MemberDAO" %>

<%
	String mPw = session.getAttribute("pw").toString();
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
	function acountChk() {
		var form = document.acountChkForm;
		if(!form.pwChk.value) {
			alert("비밀번호를 입력해주세요.");
			return false;
		} else if(form.pwChk.value != <%=mPw %>) {
			alert("비밀번호가 잘못되었습니다.");
			return false;
		} else {
			form.action = "MyUpdate.jsp";
			form.method = "post";
			form.submit();
		}
	}
</script>

<nav class="navbar">
<div class="container" style="width:500px; height:400px">
	<div class="col-md-12" style="margin-top:55%">
		<h1 class="display-3" style="font-size:1.5rem">비밀번호 확인</h1>
		<hr>
	</div>
		
	<div class="col-md-12">
		<form name="acountChkForm">
		
				<div class="row" style="align-items:center; float:left">
					<label class="col-md-4">비밀번호</label>
					<div class="col-md-4">
						<input type="password" name="pwChk" class="form-control"
							style="width:200px" placeholder="비밀번호">
					</div>
				</div>
				
				<div class="row" style="float:right">
					<input type="submit" value="확인" onclick="acountChk()"
						class="btn btn-secondary" style="margin-right:10px; height:38px">
				</div>
			</form>
	</div>
</div>
</nav>

</body>
</html>