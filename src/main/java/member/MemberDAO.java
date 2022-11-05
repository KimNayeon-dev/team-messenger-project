package member;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.regex.Pattern;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
	
	public MemberDTO getMemberDTO(String mId, String mPw) {
		MemberDTO dto = new MemberDTO();
		String query = "select M_ID, M_PW, M_NAME, M.T_CODE, T_NAME, M.P_CODE, P_NAME, M_CALL, M_ADDR, M_EMAIL, M_JOIN, M_LEADER"
				+ " from team T inner join member M"
				+ " on M.T_CODE = T.T_CODE inner join positions P"
				+ " on M.P_CODE = P.P_CODE"
				+ " where M_ID=? and M_PW=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mId);
			psmt.setString(2, mPw);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setmId(rs.getString("M_ID"));
				dto.setmPw(rs.getString("M_PW"));
				dto.setmName(rs.getString("M_NAME"));
				dto.settCode(rs.getString("T_CODE"));
				dto.settName(rs.getString("T_NAME"));
				dto.setpCode(rs.getString("P_CODE"));
				dto.setpName(rs.getString("P_NAME"));
				dto.setmCall(rs.getString("M_CALL"));
				dto.setmAddr(rs.getString("M_ADDR"));
				dto.setmEmail(rs.getString("M_EMAIL"));
				dto.setmJoin(rs.getDate("M_JOIN"));
				dto.setmLeader(rs.getBoolean("M_LEADER"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("getMemberDTO error");
		}
		return dto;
	}
	
	public ArrayList<MemberDTO> getMember() {
		ArrayList<MemberDTO> memberList = new ArrayList<>();
		String query = "select * from team T join member M on M.T_CODE=T.T_CODE join positions P on M.P_CODE=P.P_CODE";
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setmId(rs.getString("M_ID"));
				dto.setmPw(rs.getString("M_PW"));
				dto.setmName(rs.getString("M_NAME"));
				dto.settCode(rs.getString("T_CODE"));
				dto.setpCode(rs.getString("P_CODE"));
				dto.setmCall(rs.getString("M_CALL"));
				dto.setmAddr(rs.getString("M_ADDR"));
				dto.setmEmail(rs.getString("M_EMAIL"));
				dto.setmJoin(rs.getDate("M_JOIN"));
				dto.setmLeader(rs.getBoolean("M_LEADER"));
				dto.settName(rs.getString("T_NAME"));
				dto.setpName(rs.getString("P_NAME"));
				
				memberList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("getMember error");
		}
		return memberList;
	}
	
	public String nameS(String mId) {
		String query = "select distinct M_NAME from member where M_ID=?";
		String name = null;
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mId);
			rs=psmt.executeQuery();
			
			while(rs.next()) {			
				name = rs.getString("M_NAME");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("nameS error");
		}
		return name;
	}
	
	public String nameR(String mId) {
		String query = "select distinct M_NAME from member where M_ID=?";
		String name = null;
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mId);
			rs=psmt.executeQuery();
			
			while(rs.next()) {			
				name = rs.getString("M_NAME");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("nameR error");
		}
		return name;
	}
	
	public String nameT(String mId) {
		String query = "select distinct T_NAME from team T join member M on M.T_CODE=T.T_CODE where M_ID=?";
		String name = null;
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mId);
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				name = rs.getString("T_NAME");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("nameR error");
		}
		return name;
	}
	
	public String nameP(String mId) {
		String query = "select distinct P_NAME from positions P join member M on M.P_CODE=P.P_CODE where M_ID=?";
		String name = null;
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mId);
			rs=psmt.executeQuery();
			
			while(rs.next()) {			
				name = rs.getString("P_NAME");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("nameP error");
		}
		return name;
	}
	
	public void insertMember(MemberDTO dto) {
		String query = "insert into member("
				+ "M_ID, M_PW, M_NAME, T_CODE, P_CODE, M_CALL, M_ADDR, M_EMAIL, M_JOIN, M_LEADER"
				+ ") VALUES (?,?,?,?,?,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getmId());
			psmt.setString(2, dto.getmPw());
			psmt.setString(3, dto.getmName());
			psmt.setString(4, dto.gettCode());
			psmt.setString(5, dto.getpCode());
			psmt.setString(6, dto.getmCall());
			psmt.setString(7, dto.getmAddr());
			psmt.setString(8, dto.getmEmail());
			psmt.setDate(9, dto.getmJoin());
			psmt.setBoolean(10, dto.getpCode().equals("CH"));
			
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("insertMember error");
		}
		
	}
	
	public MemberDTO idCheck(String id) {
		MemberDTO dto = new MemberDTO();
		String query = "select M_ID from member where M_ID=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setmId(rs.getString("M_ID"));
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("idCheck error");
		}
		return dto;
	}
	
	public MemberDTO qIdCheck(String id) {
		MemberDTO dto = new MemberDTO();
		String query = "select M_ID from q_member where M_ID=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setmId(rs.getString("M_ID"));
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("idCheck error");
		}
		return dto;
	}
	
	public void updateMember(MemberDTO dto) {
		String query = "update member set M_PW=?, M_NAME=?, T_CODE=?, P_CODE=?, M_CALL=?, M_ADDR=?, M_EMAIL=?, M_JOIN=?, M_LEADER=?"
				+ " where M_ID=?";
		
		try {
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, dto.getmPw());
			psmt.setString(2, dto.getmName());
			psmt.setString(3, dto.gettCode());
			psmt.setString(4, dto.getpCode());
			psmt.setString(5, dto.getmCall());
			psmt.setString(6, dto.getmAddr());
			psmt.setString(7, dto.getmEmail());
			psmt.setDate(8, dto.getmJoin());
			psmt.setBoolean(9, dto.getpCode().equals("CH"));
			psmt.setString(10,dto.getmId());
			
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("updateMember error");
		}
	}
	
	public ArrayList<MemberDTO> teamName() {
		ArrayList<MemberDTO> teamList = new ArrayList<>();
		String query = "select * from team";
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.settCode(rs.getString("T_CODE"));
				dto.settName(rs.getString("T_NAME"));
				teamList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("teamName error");
		}
		return teamList;
			
	}
	
	public ArrayList<MemberDTO> positionName() {
		ArrayList<MemberDTO> positionList = new ArrayList<>();
		String query = "select * from positions";
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setpCode(rs.getString("P_CODE"));
				dto.setpName(rs.getString("P_NAME"));
				positionList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("positionName error");
		}
		return positionList;
			
	}
	
	public String getCall(String mCall) {
		String regEx = "(\\d{2,3})(\\d{3,4})(\\d{4})";

		if(!Pattern.matches(regEx, mCall)) {
			return null;
		}
		if(mCall.substring(0,2).contains("02") && mCall.length() == 9) {
			return mCall.replaceAll(regEx, "$1-$2-$3");
		} else if(mCall.length() == 9) {
			return null;
		}
	    return mCall.replaceAll(regEx, "$1-$2-$3");
	}
	
	public int selectCount() {
		int result=0;
		String query = "select count(*) from member";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectCount error");
		}
		return result;
	}
	
	
	public List<MemberDTO> memberPage(int start, int pageCount) {
		List<MemberDTO> memberList = new Vector<MemberDTO>();
		String query = "select * from team T join member M on M.T_CODE=T.T_CODE"
				+ " join positions P on M.P_CODE=P.P_CODE"
				+ " order by M.T_CODE limit ?, ?";
		
		try {
			psmt = con.prepareStatement(query);	
			psmt.setInt(1, start);
			psmt.setInt(2, pageCount);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setmId(rs.getString("M_ID"));
				dto.setmPw(rs.getString("M_PW"));
				dto.setmName(rs.getString("M_NAME"));
				dto.settCode(rs.getString("T_CODE"));
				dto.setpCode(rs.getString("P_CODE"));
				dto.setmCall(rs.getString("M_CALL"));
				dto.setmAddr(rs.getString("M_ADDR"));
				dto.setmEmail(rs.getString("M_EMAIL"));
				dto.setmJoin(rs.getDate("M_JOIN"));
				dto.setmLeader(rs.getBoolean("M_LEADER"));
				dto.settName(rs.getString("T_NAME"));
				dto.setpName(rs.getString("P_NAME"));
				
				memberList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("memberPage error");
		}
		return memberList;
	}
	
	public int selectQCount() {
		int result=0;
		String query = "select count(*) from q_member";
		
	
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectQCount error");
		}
		return result;
	}
	
	
	public List<MemberDTO> memberQPage(int start, int pageCount) {
		List<MemberDTO> memberList = new Vector<MemberDTO>();
		String query = "select * from team T join q_member Q on Q.T_CODE=T.T_CODE join positions P on Q.P_CODE=P.P_CODE order by Q.T_CODE limit ?, ?";
		

		try {
			psmt = con.prepareStatement(query);	
			psmt.setInt(1, start);
			psmt.setInt(2, pageCount);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setmId(rs.getString("M_ID"));
				dto.setmName(rs.getString("M_NAME"));
				dto.settCode(rs.getString("T_CODE"));
				dto.setpCode(rs.getString("P_CODE"));
				dto.setmCall(rs.getString("M_CALL"));
				dto.setmJoin(rs.getDate("M_JOIN"));
				dto.setmQuit(rs.getDate("M_QUIT"));
				dto.settName(rs.getString("T_NAME"));
				dto.setpName(rs.getString("P_NAME"));
				
				memberList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("memberQPage error");
		}
		return memberList;
	}
	
	public int insertQMember(MemberDTO dto, Date quit) {
		String query="insert into q_member values (?,?,?,?,?,?,?)";
		int result=0;
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getmId());
			psmt.setString(2, dto.getmName());
			psmt.setString(3, dto.gettCode());
			psmt.setString(4, dto.getpCode());
			psmt.setString(5, dto.getmCall());
			psmt.setDate(6, dto.getmJoin());
			psmt.setDate(7, quit);
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("insertQMember error");
		}
		return result;	
	}
	
	public void deleteMember(String mId, String mPw) {
		String query = "delete from member where M_ID=? and M_PW=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mId);
			psmt.setString(2, mPw);
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("deleteMember error");
		}
	}
}
