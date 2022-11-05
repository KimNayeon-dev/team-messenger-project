<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="msg.MsgDTO"%>
<%@ page import="msg.MsgDAO"%>
<%@ page import="member.MemberDTO"%>
<%@ page import="member.MemberDAO"%>

<%
	MsgDAO dao = new MsgDAO();
	MemberDAO daoMem = new MemberDAO();
	String mId = session.getAttribute("id").toString();
	SimpleDateFormat dateFormat= new SimpleDateFormat("yy-MM-dd HH:mm");

	Map<String, Object> param = new HashMap<>();
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	if(searchWord != null) {
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	
	int count = dao.selectCountD(mId, param);
	String tempStart = request.getParameter("page");
	int startPage = 0;
	int onePageCount = 10;	// 10개씩 출력
	count = (int)Math.ceil((double)count/(double)onePageCount);
	if(tempStart != null) { 
		startPage = (Integer.parseInt(tempStart)-1)*onePageCount;
	}
	
	List<MsgDTO> msgList = dao.selectPageD(mId, startPage, onePageCount, param);
	
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
	var msgCode = "";
	var index = false;
	var bool = false;
	
	function checkMsg(obj) {
		var form = document.checkForm;
		var chkMsg = document.getElementsByName("rowCheck");
		var check = obj.checked;
		if(check) {
			if(index) {
				msgCode = msgCode + '-';
			}
			msgCode = msgCode + obj.value;
			index = true;
		} else {
			msgCode = "";
			index = false;
			for(var i=0; i<=chkMsg.length; i++) {
				if(chkMsg[i].type == "checkbox" && chkMsg[i].checked) {
					if(index) {
						msgCode = msgCode + '-';
					}
					msgCode = msgCode + chkMsg[i].value;
					index = true;
				}
			}
		}
		console.log(msgCode);
	}
	
	function deleteMsg() {
		var form = document.checkForm;
		var chkMsg = document.getElementsByName("rowCheck");
		var checkList = "";
		
		for(var i=0; i<chkMsg.length; i++) {
			if(chkMsg[i].checked) {
				if(bool) {
					checkList = checkList + '-';
				}
				checkList = checkList + chkMsg[i].value;
				bool = true;
			}
		}
		console.log(checkList);
		if(!bool) {
			alert("메세지를 선택해주세요.");
			return;
		}
		var confirmed = confirm("메세지를 영구히 삭제하시겠습니까?");
		if(confirmed) {
			alert("선택된 메세지가 삭제되었습니다.")
			form.chkCode.value = checkList;
			form.action = "DeleteChkProcess.jsp";
			form.method = "post";
			form.submit();
		}
	}
	
	function checkAll(obj) {
		var chkMsg = document.getElementsByName("rowCheck");
		var count = chkMsg.length - 1;
		var check = obj.checked;
		if(check) {
			msgCode = "";
			index = false;
			for(var i=0; i<=count; i++) {
				if(chkMsg[i].type == "checkbox") {
					if(index) {
						msgCode = msgCode + '-';
					}
					msgCode = msgCode + chkMsg[i].value;
					index = true;
					chkMsg[i].checked = true;
					console.log(chkMsg[i].value, "true");
				}
			}
		} else {
			for(var i=0; i<=count; i++) {
				if(chkMsg[i].type == "checkbox") {
					chkMsg[i].checked = false;
					index = false
					msgCode = "";
					console.log(chkMsg[i].value, "false");
				}
			}
		}
		console.log(msgCode);
	}
</script>

<nav class="navbar">
<div class="container">
	<div class="col-md-12" align="left" style="margin:30px 0px 40px 0px">
		<h1 class="display-3">휴지통</h1>
	</div>
	
	<div class="row" style="width:100%">
		<div class="col-md-12">
			
			<!-- 메세지 검색 -->
			<form name="searchForm" method="get">  
			    <table width="100%">
				    <tr>
						<td align="right">
							<select name="searchField" class="form-control"
								style="width:120px; float:left; margin-right:10px">
								<option value="SENDER">보낸 사람</option>
								<option value="RECEIVER">받는 사람</option>
								<option value="MSG_TITLE">제목</option>
								<option value="MSG_CNT">내용</option>
							</select>
							<input type="text" name="searchWord" class="form-control"
								style="width:360px; float:left; margin-right:10px"
								placeholder="메세지 검색">
							<input type="submit" value="검색" class="btn btn-secondary"
								style="float:left; margin-right:10px">
						</td>
				    </tr>   
			    </table><br>
		    </form>
		    
			<form name="checkForm">
		    	<input type="hidden" name="chkCode">
			    	<table class="table" width="100%"
			 	  		style="border-bottom:lightgray 1px solid">
			        <tr align="center">
						<th width="5%">
							<input type="checkbox" name="chkAllBTN" onclick="checkAll(this)">
						</th>
						<th width="10%"></th>
						<th width="15%">보낸 사람</th>
						<th width="50%">제목</th>
						<th width="20%">보낸 날짜</th>
			        </tr>
			        
			        <% if(msgList.isEmpty()) { %>
				        <tr>
					        <td colspan="5" align="center">
					        	받은 메세지가 없습니다.
					        </td>
				        </tr>
			        
			        <%
			        } else {
			        	for(int i=0; i<msgList.size(); i++) {
			        		MsgDTO dto = msgList.get(i);
			        %>
					<tr align="center">
						<td>
							<input type="checkbox" name="rowCheck"
								onclick="checkMsg(this)" value="<%=dto.getMsgCode() %>">
						</td>
						<td></td>
						<td><%=daoMem.nameS(dto.getMsgSender()) %></td>
						<td style="padding:0px">
							<button type="button" class="btn btn-link" style="width:100%; height:49px"
									onclick="location.href='MSG_View.jsp?MsgCode=<%=dto.getMsgCode() %>';">
								<%=dto.getMsgTitle() %>
								<% if(dto.getMsgFName() != null) { %>
									<img src="./img/icon_clip.png"
										alt="file" style="width:16px; height:16px; margin-bottom:4px">
								<% } %>
							</button>
						</td>
						<td><%=dateFormat.format(dto.getMsgDate()) %></td>
					</tr>
				<% } } %>
			    </table>
			    
			    <div align="center">
					<%
					for(int i=1; i<=count; i++) {
						if(searchWord != null) {
					%>
						<input type="button" value="<%=i %>" class="btn btn-secondary"
							onclick="location.href='MSG_DEL.jsp?page=<%=i%>&searchField=<%=searchField%>&searchWord=<%=searchWord%>';"
							style="border-radius:100px; width:40px; height:40px;
							align-items:center; justify-content:center;
							background:#D8D8D8; border:NONE; font-weight:bold">
					<% } else { %>
						<input type="button" value="<%=i %>" class="btn btn-secondary"
							onclick="location.href='MSG_DEL.jsp?page=<%=i%>';"
							style="border-radius:100px; width:40px; height:40px;
							align-items:center; justify-content:center;
							background:#D8D8D8; border:NONE; font-weight:bold">
					<%
						}
					}
					%>
					<button type="submit" onclick="deleteMsg()"
						style="float:right" class="btn btn-warning">삭제하기</button>
				<div>
		    </form>
			    
		</div>
	</div>
</div>
</nav>

</body>
</html>