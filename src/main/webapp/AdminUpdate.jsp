<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.MemberDTO" %>
<%@ page import = "member.MemberDAO" %>
<%@ page import = "java.util.ArrayList" %>

<%
	String mId = request.getParameter("M_ID");
	String mPw = request.getParameter("M_PW");

	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMemberDTO(mId,mPw);
	ArrayList<MemberDTO> teamList = dao.teamName();
	ArrayList<MemberDTO> positionList = dao.positionName();
	dao.close();
	
	String tCode=dto.gettCode();
	String pCode=dto.getpCode();
	
	String[] email = dto.getmEmail().split("@");
	String mail1 = email[0];
	String mail2 = email[1];
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
	function updateMember() {
		var form = document.updateForm;
		if(!form.password_confirm.value) {
			alert("비밀번호 확인을 입력해주세요.");
			$("#password").focus();
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
		} else if(!form.phone.value) {
			alert("전화번호를 입력해주세요.");
			return false;
		} else if(form.phone.value.length > 11 || form.phone.value.length < 9) {
			alert("전화번호는 9~11자까지 입력해주세요.");
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
		} else {
			form.action = "UpdateProcess.jsp";
			form.method = "post";
			form.submit();
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

<nav class="navbar">
<div class="container">
	<div class="col-md-12" style="margin:30px 0px 40px 0px">
		<h1 class="display-3">회원수정</h1>
		<br><hr>
	</div>

	<div class="col-md-12">	
		<form name="updateForm" class="form-horizontal">
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">아이디</label>
				<div class="col-md-auto" style="color:grey">
					<%=dto.getmId() %>
					<input type="hidden" name="id" value="<%=dto.getmId() %>">
				</div>
			</div>
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">비밀번호 변경</label>
				<div class="col-md-auto form-inline">
					<input type="password" name="password" class="form-control"
							oninput="this.value=this.value.replace(/[\W]/, '');"
							placeholder="비밀번호" value="<%=dto.getmPw() %>"
							style="margin-right:10px">
					<button type="button" onclick="showPw(this)" class="btn btn-link"
							style="width:30px; height:38px; padding:0px" name="pwBTN">
						<img src="./img/icon_eye.png" alt="표시" style="width:24px; height:24px">
					</button>
				</div>
			</div>
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">비밀번호 확인</label>
				<div class="col-md-auto form-inline">
					<input type="password" name="password_confirm" class="form-control"
							oninput="this.value=this.value.replace(/[\W]/, '');"
							placeholder="비밀번호 확인"  style="margin-right:10px">
					<button type="button" onclick="showPw(this)" class="btn btn-link"
							style="width:30px; height:38px; padding:0px" name="pwcBTN">
						<img src="./img/icon_eye.png" alt="표시" style="width:24px; height:24px">
					</button>
				</div>	
			</div>
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">이름</label>
				<div class="col-md-auto" style="color:grey"">		
					<input type="text" name="name" value="<%= dto.getmName() %>" class="form-control">
				</div>
			</div>
			
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">소속 팀</label>
				<div class="col-md-auto" style="color:grey">
					<select name="team" class="form-control" style="width:207px">
						<% 
							for(int i=0; i<teamList.size();i++) {
								MemberDTO team = teamList.get(i);
						%>
						<option value="<%= team.gettCode() %>"
							<% if(tCode.equals(team.gettCode())) {%> selected <%}%>>
								<%=team.gettName() %></option>
						<% } %>
					</select>
				</div>
			</div>
			
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">직급</label>
				<div class="col-md-auto" style="color:grey">
					<select name="position" class="form-control" style="width:207px">
						<%
							for(int i=0; i<positionList.size();i++){
								MemberDTO position = positionList.get(i);
						%>
						<option value="<%= position.getpCode()%>"
							<%=pCode %>
							<% if(pCode.equals(position.getpCode())) {%> selected <%}%>>
								<%=position.getpName() %></option>
						<% } %>
					</select>
				</div>
			</div>
			
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">전화번호</label>
				<div class="col-md-auto" style="color:grey">
					<input type="text" name="phone" class="form-control"
							placeholder="전화번호"
							oninput="this.value=this.value.replace(/[\D]/, '');" value="<%=dto.getmCall() %>">
				</div>
			</div>
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">주소</label>
				<div class="col-md-6">
					<input type="text" name="address" class="form-control" style="width:527px"
							placeholder="주소" value="<%=dto.getmAddr() %>">
				</div>	
			</div>
				
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">이메일</label>
				
				<div class="col-md-auto form-inline">
					<input type="text" name="mail1" class="form-control"
							value="<%=mail1 %>" style="width:180px; margin-right:5px">
					<span>@</span>
					<input type="text" name="mail2T" id="mail2T" disabled value="<%=mail2 %>"
							class="form-control" style="width:180px; margin-left:5px">
					<select name="mail2" id="mail2" class="form-control" style="margin-left:5px">
						<option value="daum.net" <% if(mail2.equals("daum.net")){%> selected <%}%>>daum.net</option>
						<option value="gmail.com" <% if(mail2.equals("gmail.com")){%> selected <%}%>>gmail.com</option>
						<option value="hanmail.net" <% if(mail2.equals("hanmail.net")){%> selected <%}%>>hanmail.net</option>
						<option value="kakao.com" <% if(mail2.equals("kakao.com")){%> selected <%}%>>kakao.com</option>
						<option value="nate.com" <% if(mail2.equals("nate.com")){%> selected <%}%>>nate.com</option>
						<option value="naver.com" <% if(mail2.equals("naver.com")){%> selected <%}%>>naver.com</option>
						<option value="outlook.com" <% if(mail2.equals("outlook.com.com")){%> selected <%}%>>outlook.com</option>
						<option value="tistory.com" <% if(mail2.equals("tistory.com")){%> selected <%}%>>tistory.com</option>
						<option value="yahoo.com" <% if(mail2.equals("yahoo.com")){%> selected <%}%>>yahoo.com</option>
						<option value="other">직접 입력</option>
					</select>
				</div>
				
			</div>
			
			<div class="form-group row" style="align-items: center">
				<label class="col-md-3" style="font-weight:bold">입사일</label>
				<div class="col-md-auto" style="color:grey">
					<input type="date" name="join" class="form-control" 
							value="<%=dto.getmJoin() %>" readonly>
				</div>	
			</div>
			
			<div style="float:right">
				<input type="submit" onclick="updateMember()"
						class="btn btn-primary" value="수정하기">
			</div>
		</form>	
	</div>
</div>
</nav>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$('#mail2').change(function() {
		$("#mail2 option:selected").each(function() {
			if($(this).val() == "other") {
				$("#mail2T").val('');
				$("#mail2T").attr('disabled', false);
				$("#mail2T").focus();
			} else {
				$("#mail2T").val($(this).text());
				$("#mail2T").attr('disabled', true);
			}
		})
	})
</script>

</body>
</html>