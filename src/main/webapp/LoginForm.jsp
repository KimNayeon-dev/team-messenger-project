<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Team Messenger</title>
<jsp:include page="CSS.jsp"></jsp:include>
</head>
<body style="background:#5882FA">

<script>
	function loginMsg() {
		var form = document.loginForm;
		if(!form.loginId.value) {
			alert("아이디를 입력해주세요.");
			return false;
		} else if(!form.loginPw.value) {
			alert("비밀번호를 입력해주세요.");
			return false;
		} else {
			form.action = "LoginProcess.jsp";
			form.method = "post"
			form.submit();
		}
	}
	
	function logoutMsg() {
		alert("로그아웃되었습니다.");
	}
	
	var clicked = false;
	function showPw(obj) {
		var pw = document.getElementsByName("loginPw");
		if(!clicked) {
			pw[0].setAttribute('type', 'text');
			clicked = true;
			console.log(pw[0].getAttribute('type')+" "+clicked);
		} else {
			pw[0].setAttribute('type', 'password');
			clicked = false;
			console.log(pw[0].getAttribute('type')+" "+clicked);
		}
	}
</script>

<div class="container" style="background:white; width:500px; height:400px;
								border-radius:30px; justify-content:center">
	<div class="row" style="justify-content:center; margin-top:50%">
	
		<div align="center">
			<h1 class="display-3" style="color:#5882FA; font-size:3.3rem;
									padding-top:10px; font-weight:bold">TEAM MESSENGER</h1>
			<hr>
		</div>
	
		<div class="col-md-auto" style="margin-top:50px">
		
		<% if(session.getAttribute("id") == null ) { %>
			<form name="loginForm">
				<div class="row" style="margin-bottom:10px; align-items:center">
					<label class="col-md-auto" style="width:120px">아이디</label>
					<div class="col-md-auto form-inline">
						<input type="text" name="loginId" class="form-control"
								oninput="this.value=this.value.replace(/[\W]/, '');"
								placeholder="아이디" style="width:200px">
					</div>
				</div>
				
				<div class="row" style="margin-bottom:54px; align-items:center">
					<label class="col-md-auto" style="width:120px">비밀번호</label>
					<div class="col-md-auto form-inline">
						<input type="password" name="loginPw" class="form-control"
								oninput="this.value=this.value.replace(/[\W]/, '');"
								style="width:200px; margin-right:10px"
								placeholder="비밀번호">
						<button type="button" onclick="showPw(this)" class="btn btn-link"
								style="width:30px; height:38px; padding:0px" name="pwBTN">
							<img src="./img/icon_eye.png" alt="표시" style="width:24px; height:24px">
						</button>
					</div>
				</div>
				
				<div class="row" style="justify-content:center">
					<input type="submit" value="로그인" onclick="loginMsg()"
						class="btn btn-primary" style="margin-right:10px; height:38px">
					<input type="button" value="회원가입" class="btn btn-default"
						onclick="location.href='Sign.jsp'"
						style="border:lightgray 1px solid; background:NONE; color:#1E90FF">
				</div>
			</form>
			
		<% } else { %>
			<div align="center">
				<div class="col-md-auto" style="padding-bottom:80px">
					<button type="button" onclick="location.href='MSG_RCV.jsp';"
						class="btn btn-default" style="margin-top:40px">
						<%=session.getAttribute("name") %>님, 어서오세요.
					</button>
				</div>
	
				<div class="col-md-auto">
					<a href="LogoutProcess.jsp" onclick="logoutMsg()"
						class="btn btn-link" style="border:lightgray 1px solid">로그아웃</a>
				</div>
			</div>
		<% } %>
		</div>
	</div>
</div>

</body>
</html>