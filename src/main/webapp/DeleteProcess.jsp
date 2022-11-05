<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="msg.MsgDTO" %>
<%@ page import="msg.MsgDAO" %>
    
<%
	request.setCharacterEncoding("utf-8");
	int MsgCode = Integer.parseInt(request.getParameter("code"));
	MsgDAO dao = new MsgDAO();
	dao.insertToDelMsg(MsgCode);
	dao.deleteMsg(MsgCode);
	dao.close();
	response.sendRedirect("MSG_RCV.jsp");
%>
