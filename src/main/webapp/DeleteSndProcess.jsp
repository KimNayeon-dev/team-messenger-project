<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="msg.MsgDTO" %>
<%@ page import="msg.MsgDAO" %>
    
<%
	request.setCharacterEncoding("utf-8");
	int MsgCode = Integer.parseInt(request.getParameter("code"));
	MsgDAO dao = new MsgDAO();
	dao.insertToDelMsgFromSnd(MsgCode);
	dao.deleteSndMsg(MsgCode);
	dao.close();
	response.sendRedirect("MSG_SND.jsp");
%>
