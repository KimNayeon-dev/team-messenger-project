<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.MemberDTO" %>
<%@ page import = "member.MemberDAO" %>
    
<%
	request.setCharacterEncoding("utf-8");
	String mId = request.getParameter("id");
	String mPw = request.getParameter("pw");
	java.sql.Date quit = java.sql.Date.valueOf(request.getParameter("quit"));
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getMemberDTO(mId, mPw);
	
	int result=dao.insertQMember(dto, quit);
	if(result!=0){
		dao.deleteMember(mId, mPw);
		response.sendRedirect("AdminPage.jsp");
	} else {
		out.println("퇴사처리 실패");
	}
	dao.close();
%>    
