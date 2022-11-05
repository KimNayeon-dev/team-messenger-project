<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.MemberDTO" %>    
<%@ page import = "member.MemberDAO" %>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String team = request.getParameter("team");
	String position = request.getParameter("position");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameter("mail2");
	String email = mail1 + "@" + mail2;
	
	java.sql.Date join = java.sql.Date.valueOf(request.getParameter("join"));
	
	MemberDTO dto = new MemberDTO();
	dto.setmId(id);
	dto.setmPw(password);
	dto.setmName(name);
	dto.settCode(team);
	dto.setpCode(position);
	dto.setmCall(phone);
	dto.setmAddr(address);
	dto.setmEmail(email);
	dto.setmJoin(join);
	
	MemberDAO dao = new MemberDAO();
	dao.insertMember(dto);
	
	response.sendRedirect("LoginForm.jsp");
%>
