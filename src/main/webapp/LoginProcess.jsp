<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.MemberDTO" %>
<%@ page import = "member.MemberDAO" %>

<%
	String loginId = request.getParameter("loginId");
	String loginPw = request.getParameter("loginPw");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO memberDTO = dao.getMemberDTO(loginId, loginPw);
	dao.close();

	if(memberDTO.getmId() != null) {
		session.setAttribute("id", memberDTO.getmId());
		session.setAttribute("pw", memberDTO.getmPw());
		session.setAttribute("name", memberDTO.getmName());
		session.setAttribute("position", memberDTO.getpName());
		response.sendRedirect("MSG_RCV.jsp");
	} else {
		request.setAttribute("LoginErrMsg", "로그인 오류입니다." + memberDTO.getmId());
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
%>
