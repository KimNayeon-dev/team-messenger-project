<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="msg.MsgDTO" %>
<%@ page import="msg.MsgDAO" %>
    
<%
	request.setCharacterEncoding("utf-8");
	String chkCode = request.getParameter("chkCode");
	MsgDAO dao = new MsgDAO();
	MsgDTO dto;
	
	if(request.getHeader("referer").matches("(.*)RCV(.*)")) {
		dao.insertCheckToDel(chkCode);
		dao.deleteCheck(chkCode);
		response.sendRedirect("MSG_RCV.jsp");
	} else if(request.getHeader("referer").matches("(.*)IMP(.*)")) {
		String[] checkArr = chkCode.split("-");
		for(int i=0; i<checkArr.length; i++) {
			dto = dao.selectImpViewR(Integer.parseInt(checkArr[i]));
			if(dto.getMsgTitle() != null) {
				dao.insertToDelMsg(dto.getMsgCode());
				dao.deleteMsg(dto.getMsgCode());
			} else {
				dto = dao.selectImpViewS(Integer.parseInt(checkArr[i]));
				dao.insertToDelMsgFromSnd(dto.getMsgCode());
				dao.deleteSndMsg(dto.getMsgCode());
			}
		}
		response.sendRedirect("MSG_IMP.jsp");
	} else if(request.getHeader("referer").matches("(.*)SND(.*)")) {
		dao.insertCheckToDelS(chkCode);
		dao.deleteCheckS(chkCode);
		response.sendRedirect("MSG_SND.jsp");
	} else if(request.getHeader("referer").matches("(.*)DEL(.*)")) {
		dao.killChk(chkCode);
		response.sendRedirect("MSG_DEL.jsp");
	} else {
		return;
	}
	
	dao.close();
%>
