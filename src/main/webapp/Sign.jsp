<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.MemberDTO" %>
<%@ page import = "member.MemberDAO" %>
<%@ page import="java.util.ArrayList" %>

<%
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberDTO> teamList = dao.teamName();
	ArrayList<MemberDTO> positionList = dao.positionName();
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
	window.onload = function(){
		document.signForm.id.focus();
	}
	
	function signMsg() {
		var form = document.signForm;
		if(form.idCheckResult.value=="0"){
			alert("아이디 중복 확인을 해주세요.");
			return false;
		} else if(!form.password.value) {
			alert("비밀번호를 입력해주세요.");
			return false;
		} else if(!form.password_confirm.value) {
			alert("비밀번호 확인을 입력해주세요.");
			return false;
		} else if(form.password.value != form.password_confirm.value) {
			alert("비밀번호 확인이 잘못되었습니다.");
			return false;
		} else if(form.password.value.length > 20 || form.password.value.length < 5) {
			alert("비밀번호는 5~20자까지 입력해주세요.");
			return false;
		} else if(!form.name.value) {
			alert("이름을 입력해주세요.");
			return false;
		} else if(form.name.value.length > 6 || form.name.value.length < 2) {
			alert("이름은 2~6자까지 입력해주세요.");
			return false;
		} else if(!form.team.value) {
			alert("소속 팀을 확인해주세요.");
			return false;
		} else if(!form.position.value) {
			alert("직급을 확인해주세요.");
			return false;
		} else if(!form.phone.value) {
			alert("전화번호를 입력해주세요.");
			return false;
		} else if(form.phone.value.length > 11 || form.phone.value.length < 9) {
			alert("전화번호는 9~11자까지 입력해주세요.");
			return false;
		} else if(!form.address.value) {
			alert("주소를 입력해주세요.");
			return false;
		} else if(form.address.value.length > 100) {
			alert("주소는 최대 100자까지 입력해주세요.");
			return false;
		} else if(!form.mail1.value) {
			alert("이메일을 입력해주세요.");
			return false;
		} else if(form.mail1.value.length > 15) {
			alert("이메일은 최대 15자까지 입력해주세요.");
			return false;
		} else if(!form.mail2.value) {
			alert("이메일 주소를 확인해주세요.");
			return false;
		} else if(!form.join.value) {
			alert("입사일을 입력해주세요.");
			return false;
		} else {
			alert(form.name.value+"님, 가입을 축하드립니다.");
			form.action = "SignProcess.jsp";
			form.method = "post";
			form.submit();
		}
	}
	
	function idCheck(form){
		var form = document.signForm;
		
		if(!form.id.value){
			alert("아이디를 입력해주세요.");
			form.id.focus();
			return false;
		}
		let reg=/^[A-Za-z0-9]{6,15}$/;
 		if(!reg.test(form.id.value)){
			alert("아이디는 영어와 숫자 조합으로 6~15자리를 사용해야 합니다.");
			form.id.focus();
			return;
		}
 		
		var url="IdCheck.jsp?id=" + form.id.value;
		window.open(url,"아이디 중복 확인","width=480,height=230,left=450,top=20");
	}
	
	function idCheckInit(form){
		if(form.idCheckResult.value=="1"){
			form.idCheckResult.value=="0";
		}		
	}
	
	var clicked = false;
	var clickedC = false;
	function showPw(obj) {
		var pw = document.getElementsByName("password");
		var pwc = document.getElementsByName("password_confirm");
		if(obj.getAttribute('name') == 'pwBTN') {
			if(!clicked) {
				pw[0].setAttribute('type', 'text');
				clicked = true;
				console.log(pw[0].getAttribute('type')+" "+clicked);
			} else {
				pw[0].setAttribute('type', 'password');
				clicked = false;
				console.log(pw[0].getAttribute('type')+" "+clicked);
			}
		} else if(obj.getAttribute('name') == 'pwcBTN') {
			if(!clickedC) {
				pwc[0].setAttribute('type', 'text');
				clickedC = true;
				console.log(pwc[0].getAttribute('type')+" "+clicked);
			} else {
				pwc[0].setAttribute('type', 'password');
				clickedC = false;
				console.log(pwc[0].getAttribute('type')+" "+clicked);
			}
		}
	}
</script>	

<div class="jumbotron" style="background:#5882FA; color:white; border-radius:NONE">
	<div class="container">
		<div class="col-md-10">
			<h1 class="display-3">회원가입</h1>
		</div>
	</div>
</div>

<div class="container">
	<div class="col-md-12">
		
		<form name="signForm" class="form-horizontal">
			<br>
			<div class="form-group row" style="align-items:center">
				<label class="col-md-3">아이디</label>
				<div class="col-md-auto form-inline">
					<input type="hidden" name="idCheckResult" value="0">
					<input type="text" name="id" class="form-control"
							onkeyup="idCheckInit(signForm);"
							oninput="this.value=this.value.replace(/[\W]/, '');"
							placeholder="아이디" style="margin-right:10px">
					<button class="btn btn-secondary" type="button" onClick="idCheck(signForm);">중복 확인</button>
				</div>
			</div>
			
			<div class="form-group row" style="align-items:center">
				<label class="col-md-3">비밀번호</label>
				<div class="col-md-auto form-inline">
					<input type="password" name="password" class="form-control"
							oninput="this.value=this.value.replace(/[\W]/, '');"
							placeholder="비밀번호" style="margin-right:10px">
					<button type="button" onclick="showPw(this)" class="btn btn-link"
							style="width:30px; height:38px; padding:0px" name="pwBTN">
						<img src="./img/icon_eye.png" alt="표시" style="width:24px; height:24px">
					</button>
				</div>
			</div>
			<div class="form-group row" style="align-items:center">
				<label class="col-md-3">비밀번호 확인</label>
				<div class="col-md-auto form-inline">
					<input type="password" name="password_confirm" class="form-control"
							oninput="this.value=this.value.replace(/[\W]/, '');"
							placeholder="비밀번호 확인" style="margin-right:10px">
					<button type="button" onclick="showPw(this)" class="btn btn-link"
							style="width:30px; height:38px; padding:0px" name="pwcBTN">
						<img src="./img/icon_eye.png" alt="표시" style="width:24px; height:24px">
					</button>
				</div>
			</div>
			<div class="form-group row" style="align-items:center">
				<label class="col-md-3">이름</label>
				<div class="col-md-auto">
					<input type="text" name="name" class="form-control"
							placeholder="이름"
							oninput="this.value=this.value.replace(/[\s|`~!@#$%^&*|\\\';:\/?\-\=\+\[\]\,\.]/, '');">
				</div>
			</div>
			<div class="form-group row" style="align-items:center">
				<label class="col-md-3">소속 팀</label>
				<div class="col-md-auto">
					<select name="team" class="form-control" style="width:207px">
						<% 
							for(int i=0; i<teamList.size();i++) {
								MemberDTO team = teamList.get(i);
						%>
							<option value="<%=team.gettCode() %>">
											<%=team.gettName() %></option>
						<% } %>
					</select>
				</div>
			</div>
			<div class="form-group row" style="align-items:center">
				<label class="col-md-3">직급</label>
				<div class="col-md-auto">
					<select name="position" class="form-control" style="width:207px">
						<%
							for(int i=0; i<positionList.size();i++){
								MemberDTO position = positionList.get(i);
						%>
							<option value="<%= position.getpCode()%>">
											<%= position.getpName() %></option>
						<% } %>
					</select>
				</div>
			</div>
			<div class="form-group row" style="align-items:center">
				<label class="col-md-3">전화번호</label>
				<div class="col-md-auto">
					<input type="text" name="phone" class="form-control"
							placeholder="전화번호"
							oninput="this.value=this.value.replace(/[\D]/, '');">
				</div>
			</div>
			<div class="form-group row" style="align-items:center">
				<label class="col-md-3">주소</label>
					<div class="col-md-auto" style="width:557px">
						<input type="text" name="address" class="form-control"
								placeholder="주소">
					</div>	
				</div>
			<div class="form-group row" style="align-items:center">
				<label class="col-md-3">이메일</label>
				
				<div class="col-md-auto form-inline">
					<input type="text" name="mail1" class="form-control"
							oninput="this.value=this.value.replace(/[\W]/, '');"
							style="width:180px; margin-right:5px" placeholder="이메일">
					<span>@</span>
					<input type="text" name="mail2T" id="mail2T" disabled value="daum.net"
							class="form-control" style="width:180px; margin-left:5px">
					<select name="mail2" id="mail2" class="form-control" style="margin-left:5px">
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="kakao.com">kakao.com</option>
						<option value="nate.com">nate.com</option>
						<option value="naver.com">naver.com</option>
						<option value="outlook.com">outlook.com</option>
						<option value="tistory.com">tistory.com</option>
						<option value="yahoo.com">yahoo.com</option>
						<option value="other">직접 입력</option>
					</select>
				</div>
				
			</div>
			<div class="form-group row" style="align-items:center">
				<label class="col-md-3">입사일</label>
				<div class="col-md-auto">
					<input type="date" name="join" class="form-control">
				</div>	
			</div><br>
			
			<div align="center">
				<input type="submit" onclick="signMsg()" style="margin-bottom:100px"
					class="btn btn-primary" value="가입하기">	
			</div>							
		</form>	
	</div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$('#mail2').change(function() {
		$("#mail2 option:selected").each(function() {
			if($(this).val() == "other") {
				$("#mail2T").val('');
				$("#mail2T").attr('disabled', false);
				$("#mail2T").attr('disabled', false);
			} else {
				$("#mail2T").val($(this).text());
				$("#mail2T").attr('disabled', true);
			}
		})
	})
</script>

</body>
</html>