<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="msg.MsgDTO" %>
<%@ page import="msg.MsgDAO" %>
    
<%
	int MsgCode = Integer.parseInt(request.getParameter("code"));
	MsgDAO dao = new MsgDAO();
	dao.killMsg(MsgCode);
	dao.close();
	response.sendRedirect("MSG_DEL.jsp");
%>
