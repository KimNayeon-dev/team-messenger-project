package msg;

public class MsgDTO {

	private int msgCode;
	private String msgType;
	private String msgSender;
	private String msgReceiver;
	private String msgTitle;
	private String msgContent;
	private java.sql.Timestamp msgDate;
	private String msgFName;
	private String msgFPath;
	private String msgImp;
	private boolean msgOpen;
	
	public int getMsgCode() {
		return msgCode;
	}
	public void setMsgCode(int msgCode) {
		this.msgCode = msgCode;
	}
	public String getMsgType() {
		return msgType;
	}
	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	public String getMsgSender() {
		return msgSender;
	}
	public void setMsgSender(String msgSender) {
		this.msgSender = msgSender;
	}
	public String getMsgReceiver() {
		return msgReceiver;
	}
	public void setMsgReceiver(String msgReceiver) {
		this.msgReceiver = msgReceiver;
	}
	public String getMsgTitle() {
		return msgTitle;
	}
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	public java.sql.Timestamp getMsgDate() {
		return msgDate;
	}
	public void setMsgDate(java.sql.Timestamp msgDate) {
		this.msgDate = msgDate;
	}
	public String getMsgFName() {
		return msgFName;
	}
	public void setMsgFName(String msgFName) {
		this.msgFName = msgFName;
	}
	public String getMsgFPath() {
		return msgFPath;
	}
	public void setMsgFPath(String msgFPath) {
		this.msgFPath = msgFPath;
	}
	public String getMsgImp() {
		return msgImp;
	}
	public void setMsgImp(String msgImp) {
		this.msgImp = msgImp;
	}
	public boolean isMsgOpen() {
		return msgOpen;
	}
	public void setMsgOpen(boolean msgOpen) {
		this.msgOpen = msgOpen;
	}
	
}
