package member;

public class MemberDTO {

	private String mId;
	private String mPw;
	private String mName;
	private String tCode;
	private String tName;
	private String pCode;
	private String pName;
	private String mCall;
	private String mAddr;
	private String mEmail;
	private java.sql.Date mJoin;
	private java.sql.Date mQuit;
	private boolean mLeader;
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPw() {
		return mPw;
	}
	public void setmPw(String mPw) {
		this.mPw = mPw;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String gettCode() {
		return tCode;
	}
	public void settCode(String tCode) {
		this.tCode = tCode;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getmCall() {
		return mCall;
	}
	public void setmCall(String mCall) {
		this.mCall = mCall;
	}
	public String getmAddr() {
		return mAddr;
	}
	public void setmAddr(String mAddr) {
		this.mAddr = mAddr;
	}
	public String getmEmail() {
		return mEmail;
	}
	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}
	public java.sql.Date getmJoin() {
		return mJoin;
	}
	public void setmJoin(java.sql.Date mJoin) {
		this.mJoin = mJoin;
	}
	public java.sql.Date getmQuit() {
		return mQuit;
	}
	public void setmQuit(java.sql.Date mQuit) {
		this.mQuit = mQuit;
	}
	public boolean ismLeader() {
		return mLeader;
	}
	public void setmLeader(boolean mLeader) {
		this.mLeader = mLeader;
	}

}
