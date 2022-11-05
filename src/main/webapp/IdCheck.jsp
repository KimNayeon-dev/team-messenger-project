<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDAO" %>
<%@ page import="member.MemberDTO" %>

<%
	String check = request.getParameter("id");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.idCheck(check);
	
	String mId = dto.getmId();
	System.out.println(mId);
	
	MemberDTO dto1=dao.qIdCheck(check);
	String qId = dto1.getmId();
	System.out.println(qId);
	dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Messenger</title>
<jsp:include page="CSS.jsp"></jsp:include>
</head>
<body style="overflow:hidden; background:whitesmoke">

<script type="text/javascript">
	function idCheck(form){
		if(!form.id.value){
			alert("아이디를 입력해주세요.");
			form.id.focus();
			return;
		}
		
		//아이디 유효성검사
		let reg=/^[A-Za-z0-9]{6,15}$/;
 		if(!reg.test(form.id.value)){
			alert("아이디는 영어와 숫자 조합으로 6~15자리를 사용해야 합니다.");
			form.id.focus();
			return;
		}
 		
 		var checkNumber = form.id.value.search(/[0-9]/i);
	 	var checkEnglish = form.id.value.search(/[a-zA-Z]/ig);
 		
	 	if(checkNumber<0 || checkEnglish<0) {
 			alert("숫자와 영문자를 포함해야 합니다.");
 			return;
 		}
		
		//입력 데이터 전달
		form.action="IdCheck.jsp";
		form.method="post";
		form.submit();
	}
	
	//부모 창에 존재하는 폼변수 값을 전달하고 현재 창을 종료하는 함수
	function onClose(){
		opener.signForm.id.value="<%=check %>";
		opener.signForm.idCheckResult.value="1";
		//현재 창 종료
		window.close();
	}
</script>

<div class="container">
	<div class="row" style="margin:20px; background:white; border-radius:10px;">
		<form name="idCheckForm" style="margin:30px">
		 	<% if(mId!=null || qId!=null) { %>
				<p style="font-size:1.2rem"><b><%=check %></b>는<br>
				이미 사용 중인 아이디 입니다.
				<hr width="345px">
				<div class="form-inline">
					<input type="text" name="id" class="form-control"
							style="width:240px; margin-right:10px">
					<button type="button" onclick="idCheck(idCheckForm);"
							class="btn btn-secondary">중복 확인</button>
				</div>
			<%} else { %>
				<p style="font-size:1.2rem"><b><%=check %></b>는<br>
				사용 가능한 아이디 입니다.
				<hr width="345px">
				<div align="center">
					<button type="button" onclick="onClose();" style="maring-top:20px"
						class="btn btn-success">사용</button>
				</div>
			<% } %>
		</form>
	</div>
</div>

</body>
</html>