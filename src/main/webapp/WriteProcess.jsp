<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import = "msg.MsgDTO" %>    
<%@ page import = "msg.MsgDAO" %>    

<%
	request.setCharacterEncoding("utf-8");
	String realFolder="C:\\upload\\";
	int maxSize = 10*1024*1024; //10MByte
	
	String fileName=""; //중복 처리된 이름
	String origina1Name=""; //중복 처리전 실제 원본
	
	//파일을 받아와서 폴더에 업로드
	MultipartRequest multi = new MultipartRequest(
			request,
			realFolder,
			maxSize,
			"utf-8",
			new DefaultFileRenamePolicy()
			);
	
	Enumeration files=multi.getFileNames();
	
	//파일의 이름만 가져옴 -> 전송 받은 이름
	String file=(String)files.nextElement();
	
	//multi에서 알고 있는 (파일) 원본이름을 file을 통해서 알아냄
	origina1Name=multi.getOriginalFileName(file);
	
	String sender = session.getAttribute("id").toString();
	String receiver = multi.getParameter("receiver");
	String title = multi.getParameter("title");
	String content = multi.getParameter("content");
	
	MsgDTO dto = new MsgDTO();
	dto.setMsgSender(sender);
	dto.setMsgReceiver(receiver);
	dto.setMsgTitle(title);
	dto.setMsgContent(content);
	dto.setMsgFName(origina1Name);
	dto.setMsgFPath(realFolder);
	
	// 메시지 보내기
	MsgDAO dao = new MsgDAO();
	dao.insertMsg(dto);
		
	// 보낸메시지 삽입
	dao.insertSndMsg(dto);
	dao.close();

	response.sendRedirect("MSG_RCV.jsp");
%>
