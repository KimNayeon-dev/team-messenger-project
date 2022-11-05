<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="msg.MsgDTO" %>
<%@ page import="msg.MsgDAO" %>
    
<%
	request.setCharacterEncoding("utf-8");
	int chkCode = Integer.parseInt(request.getParameter("sendCode"));
	String chkType = request.getParameter("sendType").toString();
	MsgDAO dao = new MsgDAO();
	MsgDTO dtoR = dao.selectImpViewR(chkCode);
	MsgDTO dtoS = dao.selectImpViewS(chkCode);
	
	if(chkType.equals("RCV")) {
		dao.updateNm(chkCode);
	} else if(chkType.equals("SND")) {
		dao.updateNmS(chkCode);
	}
	
	if(request.getHeader("referer").matches("(.*)IMP(.*)")) {
		if(dtoR.getMsgType() != null) {
			response.sendRedirect("MSG_IMP.jsp");
		} else {
			dao.updateNmS(chkCode);
			response.sendRedirect("MSG_IMP.jsp");
		}
	} else if(request.getHeader("referer").matches("(.*)SND(.*)")) {
		response.sendRedirect("MSG_SND.jsp");
	} else {
		response.sendRedirect("MSG_RCV.jsp");
	}
	
	dao.close();
%>
