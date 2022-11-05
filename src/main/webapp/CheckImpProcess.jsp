<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="msg.MsgDTO" %>
<%@ page import="msg.MsgDAO" %>
    
<%
	request.setCharacterEncoding("utf-8");
	int chkCode = Integer.parseInt(request.getParameter("sendCode"));
	String chkType = request.getParameter("sendType").toString();
	MsgDAO dao = new MsgDAO();
	
	if(chkType.equals("RCV")) {
		dao.updateImp(chkCode);
		if(request.getHeader("referer").matches("(.*)IMP(.*)")) {
			response.sendRedirect("MSG_IMP.jsp");
		} else {
			response.sendRedirect("MSG_RCV.jsp");
		}
	} else if(chkType.equals("SND")) {
		dao.updateImpS(chkCode);
		if(request.getHeader("referer").matches("(.*)IMP(.*)")) {
			response.sendRedirect("MSG_IMP.jsp");
		} else {
			response.sendRedirect("MSG_SND.jsp");
		}
	} else {
		return;
	}
	
	dao.close();
%>
