package msg;

import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.JDBConnect;

public class MsgDAO extends JDBConnect {

// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ insert key ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	public void insertMsg(MsgDTO dto) {
		String query = "insert into msg (SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_FNAME, MSG_FPATH) value(?,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getMsgSender());
			psmt.setString(2, dto.getMsgReceiver());
			psmt.setString(3, dto.getMsgTitle());
			psmt.setString(4, dto.getMsgContent());
			psmt.setString(5, dto.getMsgFName());
			psmt.setString(6,  dto.getMsgFPath());
		
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("insertMsg error");
		}		
	}
	
	public void insertSndMsg(MsgDTO dto) {
		String query = "insert into snd_msg (SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_FNAME, MSG_FPATH) value(?,?,?,?,?,?)";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getMsgSender());
			psmt.setString(2, dto.getMsgReceiver());
			psmt.setString(3, dto.getMsgTitle());
			psmt.setString(4, dto.getMsgContent());
			psmt.setString(5, dto.getMsgFName());
			psmt.setString(6, dto.getMsgFPath());
			
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("insertSndMsg error");
		}
	}
	
	public void insertToDelMsg(int MsgCode) {
		String query = "insert into del_msg("
					+ "SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH)"
					+ " select SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH from msg where MSG_CODE=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, MsgCode);
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("insertToDelMsg error");
		}
	}
	
	public void insertToDelMsgFromSnd(int MsgCode) {
		String query = "insert into del_msg("
					+ "SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH)"
					+ " select SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH from snd_msg where MSG_CODE=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, MsgCode);
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("insertToDelMsgFromSnd error");
		}
	}
	
	public void insertCheckToDel(String chkCode) {
		String[] checkArr = chkCode.split("-");
		String query = "insert into del_msg("
					+ "MSG_CODE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH)"
					+ " select MSG_CODE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH from msg where MSG_CODE=?";
		
		try {
			psmt = con.prepareStatement(query);
			if(checkArr != null && checkArr.length > 0) {
				for(int i=0; i<checkArr.length; i++) {
					psmt.setInt(1, Integer.parseInt(checkArr[i]));
					psmt.executeUpdate();
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("insertCheckToDel error");
		}
	}
	
	public void insertCheckToDelS(String chkCode) {
		String[] checkArr = chkCode.split("-");
		String query = "insert into del_msg("
					+ "MSG_CODE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH)"
					+ " select MSG_CODE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH from snd_msg where MSG_CODE=?";
		
		try {
			psmt = con.prepareStatement(query);
			if(checkArr != null && checkArr.length > 0) {
				for(int i=0; i<checkArr.length; i++) {
					psmt.setInt(1, Integer.parseInt(checkArr[i]));
					psmt.executeUpdate();
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("insertCheckToDelS error");
		}
	}
	
// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ delete key ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

	public void deleteMsg(int MsgCode) {
		String query = "delete from msg where MSG_CODE=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, MsgCode);
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("deleteMsg error");
		}
	}

	public void deleteSndMsg(int MsgCode) {
		String query = "delete from snd_msg where MSG_CODE=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, MsgCode);
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("deleteSndMsg error");
		}
	}
	
	public void deleteCheck(String chkCode) {
		String[] checkArr = chkCode.split("-");
		String query = "delete from msg where MSG_CODE=?";
		
		try {
			psmt = con.prepareStatement(query);
			if(checkArr != null && checkArr.length > 0) {
				for(int i=0; i<checkArr.length; i++) {
					psmt.setInt(1, Integer.parseInt(checkArr[i]));
					psmt.executeUpdate();
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("deleteCheck error");
		}
	}
	
	public void deleteCheckS(String chkCode) {
		String[] checkArr = chkCode.split("-");
		String query = "delete from snd_msg where MSG_CODE=?";
		
		try {
			psmt = con.prepareStatement(query);
			if(checkArr != null && checkArr.length > 0) {
				for(int i=0; i<checkArr.length; i++) {
					psmt.setInt(1, Integer.parseInt(checkArr[i]));
					psmt.executeUpdate();
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("deleteCheckS error");
		}
	}
	
	public void killChk(String chkCode) {
		String[] checkArr = chkCode.split("-");
		String query = "delete from del_msg where MSG_CODE=?";
		
		try {
			psmt = con.prepareStatement(query);
			if(checkArr != null && checkArr.length > 0) {
				for(int i=0; i<checkArr.length; i++) {
					psmt.setInt(1, Integer.parseInt(checkArr[i]));
					psmt.executeUpdate();
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("killChk error");
		}
	}
	
	public void killMsg(int MsgCode) {
		String query = "delete from del_msg where MSG_CODE=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, MsgCode);
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("killMsg error");
		}
	}
	
// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ select key ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	// selectPage 메소드로 대체
	/* 
	public List<MsgDTO> selectMsg(String mId) {
		List<MsgDTO> msgList = new Vector<>();
		String query = "select * from msg";
		
		if(mId != null) {
			query += " where RECEIVER = '" + mId + "'";
		} query += " order by MSG_DATE desc";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				MsgDTO dto = new MsgDTO();
				dto.setMsgCode(rs.getInt("MSG_CODE"));
				dto.setMsgSender(rs.getString("SENDER"));
				dto.setMsgReceiver(rs.getString("RECEIVER"));
				dto.setMsgTitle(rs.getString("MSG_TITLE"));
				dto.setMsgContent(rs.getString("MSG_CNT"));
				dto.setMsgDate(rs.getDate("MSG_DATE"));
				dto.setMsgFName(rs.getString("MSG_FNAME"));
				dto.setMsgFPath(rs.getString("MSG_FPATH"));
				dto.setMsgImp(rs.getString("MSG_IMP"));
				dto.setMsgOpen(rs.getBoolean("MSG_OPENED"));
				
				msgList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectMsg error");
		}
		return msgList;
	}
	
	public List<MsgDTO> selectImpMsg(String mId) {
		List<MsgDTO> msgList = new Vector<>();
		String query = "select * from msg where MSG_IMP='IMP'";
		
		if(mId != null) {
			query += " and RECEIVER = '" + mId + "'";
		} query += " order by MSG_DATE desc";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				MsgDTO dto = new MsgDTO();
				dto.setMsgCode(rs.getInt("MSG_CODE"));
				dto.setMsgSender(rs.getString("SENDER"));
				dto.setMsgReceiver(rs.getString("RECEIVER"));
				dto.setMsgTitle(rs.getString("MSG_TITLE"));
				dto.setMsgContent(rs.getString("MSG_CNT"));
				dto.setMsgDate(rs.getDate("MSG_DATE"));
				dto.setMsgFName(rs.getString("MSG_FNAME"));
				dto.setMsgFPath(rs.getString("MSG_FPATH"));
				dto.setMsgImp(rs.getString("MSG_IMP"));
				
				msgList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectImpMsg error");
		}
		return msgList;
	}
	
	public List<MsgDTO> selectSndMsg(String mId) {
		List<MsgDTO> msgList = new Vector<>();
		String query = "select * from snd_msg";
		
		if(mId != null) {
			query += " where SENDER = '" + mId + "'";
		} query += " order by MSG_DATE desc";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				MsgDTO dto = new MsgDTO();
				dto.setMsgCode(rs.getInt("MSG_CODE"));
				dto.setMsgSender(rs.getString("SENDER"));
				dto.setMsgReceiver(rs.getString("RECEIVER"));
				dto.setMsgTitle(rs.getString("MSG_TITLE"));
				dto.setMsgContent(rs.getString("MSG_CNT"));
				dto.setMsgDate(rs.getDate("MSG_DATE"));
				dto.setMsgFName(rs.getString("MSG_FNAME"));
				dto.setMsgFPath(rs.getString("MSG_FPATH"));
				
				msgList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectSndMsg error");
		}
		return msgList;
	}
	
	public List<MsgDTO> selectDelMsg(String mId) {
		List<MsgDTO> msgList = new Vector<>();
		
		String query = "select * from del_msg";
		if(mId != null) {
			query += " where RECEIVER = '" + mId + "'";
		} query += " order by MSG_CODE desc";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				MsgDTO dto = new MsgDTO();
				dto.setMsgCode(rs.getInt("MSG_CODE"));
				dto.setMsgSender(rs.getString("SENDER"));
				dto.setMsgReceiver(rs.getString("RECEIVER"));
				dto.setMsgTitle(rs.getString("MSG_TITLE"));
				dto.setMsgContent(rs.getString("MSG_CNT"));
				dto.setMsgDate(rs.getDate("MSG_DATE"));
				dto.setMsgFName(rs.getString("MSG_FNAME"));
				dto.setMsgFPath(rs.getString("MSG_FPATH"));
				
				msgList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectDelMsg error");
		}
		return msgList;
	}
	*
	*/
	
// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ view key ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	public MsgDTO selectView(int MsgCode) {
		MsgDTO dto = new MsgDTO();
		
		String query = "select * from msg where MSG_CODE=?";
						
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, MsgCode);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setMsgCode(rs.getInt("MSG_CODE"));
				dto.setMsgType(rs.getString("MSG_TYPE"));
				dto.setMsgSender(rs.getString("SENDER"));
				dto.setMsgReceiver(rs.getString("RECEIVER"));
				dto.setMsgTitle(rs.getString("MSG_TITLE"));
				dto.setMsgContent(rs.getString("MSG_CNT"));
				dto.setMsgDate(rs.getTimestamp("MSG_DATE"));
				dto.setMsgFName(rs.getString("MSG_FNAME"));
				dto.setMsgFPath(rs.getString("MSG_FPATH"));
				dto.setMsgImp(rs.getString("MSG_IMP"));
				dto.setMsgOpen(rs.getBoolean("MSG_OPENED"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectView error");
		}
		return dto;
		
	}
	
	public MsgDTO selectImpViewR(int MsgCode) {
		MsgDTO dto = new MsgDTO();
		
		String query = "select * from msg where MSG_CODE=? and MSG_IMP='IMP'";
						
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, MsgCode);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setMsgCode(rs.getInt("MSG_CODE"));
				dto.setMsgType(rs.getString("MSG_TYPE"));
				dto.setMsgSender(rs.getString("SENDER"));
				dto.setMsgReceiver(rs.getString("RECEIVER"));
				dto.setMsgTitle(rs.getString("MSG_TITLE"));
				dto.setMsgContent(rs.getString("MSG_CNT"));
				dto.setMsgDate(rs.getTimestamp("MSG_DATE"));
				dto.setMsgFName(rs.getString("MSG_FNAME"));
				dto.setMsgFPath(rs.getString("MSG_FPATH"));
				dto.setMsgImp(rs.getString("MSG_IMP"));
				dto.setMsgOpen(rs.getBoolean("MSG_OPENED"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectImpViewR error");
		}
		return dto;
		
	}
	
	public MsgDTO selectImpViewS(int MsgCode) {
		MsgDTO dto = new MsgDTO();
		
		String query = "select * from snd_msg where MSG_CODE=? and MSG_IMP='IMP'";
						
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, MsgCode);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setMsgCode(rs.getInt("MSG_CODE"));
				dto.setMsgType(rs.getString("MSG_TYPE"));
				dto.setMsgSender(rs.getString("SENDER"));
				dto.setMsgReceiver(rs.getString("RECEIVER"));
				dto.setMsgTitle(rs.getString("MSG_TITLE"));
				dto.setMsgContent(rs.getString("MSG_CNT"));
				dto.setMsgDate(rs.getTimestamp("MSG_DATE"));
				dto.setMsgFName(rs.getString("MSG_FNAME"));
				dto.setMsgFPath(rs.getString("MSG_FPATH"));
				dto.setMsgImp(rs.getString("MSG_IMP"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectImpViewS error");
		}
		return dto;
		
	}
	
	public MsgDTO selectDelView(int MsgCode) {
		MsgDTO dto = new MsgDTO();
		
		String query = "select * from del_msg where MSG_CODE=?";
						
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, MsgCode);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setMsgCode(rs.getInt("MSG_CODE"));
				dto.setMsgType(rs.getString("MSG_TYPE"));
				dto.setMsgSender(rs.getString("SENDER"));
				dto.setMsgReceiver(rs.getString("RECEIVER"));
				dto.setMsgTitle(rs.getString("MSG_TITLE"));
				dto.setMsgContent(rs.getString("MSG_CNT"));
				dto.setMsgDate(rs.getTimestamp("MSG_DATE"));
				dto.setMsgFName(rs.getString("MSG_FNAME"));
				dto.setMsgFPath(rs.getString("MSG_FPATH"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectDelView error");
		}
		return dto;
		
	}
	
	public MsgDTO selectSndView(int MsgCode) {
		MsgDTO dto = new MsgDTO();
		
		String query = "select * from snd_msg where MSG_CODE=?";
						
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, MsgCode);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setMsgCode(rs.getInt("MSG_CODE"));
				dto.setMsgType(rs.getString("MSG_TYPE"));
				dto.setMsgSender(rs.getString("SENDER"));
				dto.setMsgReceiver(rs.getString("RECEIVER"));
				dto.setMsgTitle(rs.getString("MSG_TITLE"));
				dto.setMsgContent(rs.getString("MSG_CNT"));
				dto.setMsgDate(rs.getTimestamp("MSG_DATE"));
				dto.setMsgFName(rs.getString("MSG_FNAME"));
				dto.setMsgFPath(rs.getString("MSG_FPATH"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectDelView error");
		}
		return dto;
		
	}
	
// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ new key ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	public int askNewMsg(String mId) {
		int newMsg = 0;
		String query = "select count(*) from msg where MSG_OPENED=false";
		
		if(mId != null) {
			query += " and RECEIVER = '" + mId + "'";
		}
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			if(rs.next()) {
				newMsg = rs.getInt(1);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("askNewMsg error");
		}
		return newMsg;
	}
	
// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ update key ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	public void openMsg(int MsgCode) {
		String query = "update msg set MSG_OPENED=true where MSG_CODE=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, MsgCode);
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("openMsg error");
		}
	}
	
	public void updateImp(int MsgCode) {
		String query = "update msg set MSG_IMP='IMP' where MSG_CODE=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, MsgCode);
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("updateImp error");
		}
	}
	
	public void updateNm(int MsgCode) {
		String query = "update msg set MSG_IMP='NM' where MSG_CODE=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, MsgCode);
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("updateNm error");
		}
	}
	
	public void updateImpS(int MsgCode) {
		String query = "update snd_msg set MSG_IMP='IMP' where MSG_CODE=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, MsgCode);
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("updateImp error");
		}
	}
	
	public void updateNmS(int MsgCode) {
		String query = "update snd_msg set MSG_IMP='NM' where MSG_CODE=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, MsgCode);
			psmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("updateNm error");
		}
	}
	
// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ search key ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	// selectPage 메소드로 대체
	/*
	public List<MsgDTO> searchMsg(Map<String, Object> map) {
		List<MsgDTO> searchList = new Vector<>();
		
		String query = "select * from msg";
		if(map.get("searchWord") != null) {
			query += " where " + map.get("searchField")
					+ " like '%" + map.get("searchWord") + "%'";
		}
		query += " order by MSG_DATE desc";
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MsgDTO dto = new MsgDTO();
				dto.setMsgCode(rs.getInt("MSG_CODE"));
				dto.setMsgSender(rs.getString("SENDER"));
				dto.setMsgReceiver(rs.getString("RECEIVER"));
				dto.setMsgTitle(rs.getString("MSG_TITLE"));
				dto.setMsgContent(rs.getString("MSG_CNT"));
				dto.setMsgDate(rs.getTimestamp("MSG_DATE"));
				dto.setMsgFName(rs.getString("MSG_FNAME"));
				dto.setMsgFPath(rs.getString("MSG_FPATH"));
				dto.setMsgImp(rs.getString("MSG_IMP"));
				dto.setMsgOpen(rs.getBoolean("MSG_OPENED"));
				
				searchList.add(dto);
			}
		} catch(Exception e) {
			System.out.println("searchMsg error");
			e.printStackTrace();
		}
		return searchList;
	}
	*/
	
// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ paging key ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
	public int selectCountR(String mId, Map map) {
		int result = 0;
		String query = "select count(*) from msg M";
		
		if(mId != null) {
			if(map.get("searchField") != null) {
				if(map.get("searchField").equals("RECEIVER") || map.get("searchField").equals("SENDER")) {
					query += " join member MEM on MEM.M_ID = M."+map.get("searchField")
							+ " where ((MEM.M_NAME like '%"+map.get("searchWord")+"%')"
							+ " or (MEM.M_ID like '%"+map.get("searchWord")+"%'))";
				} else {
					query += " where M."+map.get("searchField")+" like '%"+map.get("searchWord")+"%'";
				}
				query += " and M.RECEIVER = ?";
			} else {
				query += " where M.RECEIVER = ?";
			}
		}
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mId);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectCountR error");
		}
		return result;
	}
	
	public List<MsgDTO> selectPageR(String mId, int start, int pageCount, Map map){
		List<MsgDTO> pageList = new Vector<MsgDTO>();
		String query = "select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH, MSG_IMP, MSG_OPENED"
				+ " from msg M";
		
		if(mId != null) {
			if(map.get("searchField") != null) {
				if(map.get("searchField").equals("RECEIVER") || map.get("searchField").equals("SENDER")) {
					query += " join member MEM on MEM.M_ID = M."+map.get("searchField")
							+ " where ((MEM.M_NAME like '%"+map.get("searchWord")+"%')"
							+ " or (MEM.M_ID like '%"+map.get("searchWord")+"%'))";
				} else {
					query += " where M."+map.get("searchField")+" like '%"+map.get("searchWord")+"%'";
				}
				query += " and M.RECEIVER = ?";
			} else {
				query += " where M.RECEIVER = ?";
			}
		} query += " order by M.MSG_DATE desc limit ?, ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mId);
			psmt.setInt(2, start);
			psmt.setInt(3, pageCount);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MsgDTO dto = new MsgDTO();
				dto.setMsgCode(rs.getInt("MSG_CODE"));
				dto.setMsgType(rs.getString("MSG_TYPE"));
				dto.setMsgSender(rs.getString("SENDER"));
				dto.setMsgReceiver(rs.getString("RECEIVER"));
				dto.setMsgTitle(rs.getString("MSG_TITLE"));
				dto.setMsgContent(rs.getString("MSG_CNT"));
				dto.setMsgDate(rs.getTimestamp("MSG_DATE"));
				dto.setMsgFName(rs.getString("MSG_FNAME"));
				dto.setMsgFPath(rs.getString("MSG_FPATH"));
				dto.setMsgImp(rs.getString("MSG_IMP"));
				dto.setMsgOpen(rs.getBoolean("MSG_OPENED"));
				
				pageList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectPageR error");
		}
		return pageList;
	}
	
	public int selectCountS(String mId, Map map) {
		int result=0;
		String query = "select count(*) from snd_msg S";
		
		if(mId != null) {
			if(map.get("searchField") != null) {
				if(map.get("searchField").equals("RECEIVER") || map.get("searchField").equals("SENDER")) {
					query += " join member MEM on MEM.M_ID = S."+map.get("searchField")
							+ " where ((MEM.M_NAME like '%"+map.get("searchWord")+"%')"
							+ " or (MEM.M_ID like '%"+map.get("searchWord")+"%'))";
				} else {
					query += " where S."+map.get("searchField")+" like '%"+map.get("searchWord")+"%'";
				}
				query += " and S.SENDER = ?";
			} else {
				query += " where S.SENDER = ?";
			}
		}
		
		try {
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, mId);
			rs = psmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectCountS error");
		}
		return result;
	}
	
	public List<MsgDTO> selectPageS(String mId, int start, int pageCount, Map map){
		List<MsgDTO> pageList = new Vector<MsgDTO>();
		String query = "select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH, MSG_IMP"
				+ " from snd_msg S"; 
		
		if(mId != null) {
			if(map.get("searchField") != null) {
				if(map.get("searchField").equals("RECEIVER") || map.get("searchField").equals("SENDER")) {
					query += " join member MEM on MEM.M_ID = S."+map.get("searchField")
							+ " where ((MEM.M_NAME like '%"+map.get("searchWord")+"%')"
							+ " or (MEM.M_ID like '%"+map.get("searchWord")+"%'))";
				} else {
					query += " where S."+map.get("searchField")+" like '%"+map.get("searchWord")+"%'";
				}
				query += " and S.SENDER = ?";
			} else {
				query += " where S.SENDER = ?";
			}
		} query += " order by S.MSG_DATE desc limit ?, ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mId);
			psmt.setInt(2, start);
			psmt.setInt(3, pageCount);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MsgDTO dto = new MsgDTO();
				dto.setMsgCode(rs.getInt("MSG_CODE"));
				dto.setMsgType(rs.getString("MSG_TYPE"));
				dto.setMsgSender(rs.getString("SENDER"));
				dto.setMsgReceiver(rs.getString("RECEIVER"));
				dto.setMsgTitle(rs.getString("MSG_TITLE"));
				dto.setMsgContent(rs.getString("MSG_CNT"));
				dto.setMsgDate(rs.getTimestamp("MSG_DATE"));
				dto.setMsgFName(rs.getString("MSG_FNAME"));
				dto.setMsgFPath(rs.getString("MSG_FPATH"));
				dto.setMsgImp(rs.getString("MSG_IMP"));
				
				pageList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectPageS error");
		}
		return pageList;
	}

	public int selectCountD(String mId, Map map) {
		int result=0;
		String query = "select distinct count(*) from (";
		
		if(mId != null) {
			if(map.get("searchField") != null) {
				if(map.get("searchField").equals("RECEIVER") || map.get("searchField").equals("SENDER")) {
					query += " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH"
							+ " from del_msg D join member MEM on MEM.M_ID=D."+map.get("searchField")
							+ " where ((MEM.M_NAME like '%"+map.get("searchWord")+"%') or (MEM.M_ID like '%"+map.get("searchWord")+"%'))"
							+ " and D.RECEIVER=?"
							+ " union all"
							+ " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH"
							+ " from del_msg D join member MEM on MEM.M_ID=D."+map.get("searchField")
							+ " where ((MEM.M_NAME like '%"+map.get("searchWord")+"%') or (MEM.M_ID like '%"+map.get("searchWord")+"%'))"
							+ " and D.SENDER=?";
				} else {
					query += " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH"
							+ " from del_msg D join member MEM on MEM.M_ID=D.RECEIVER"
							+ " where D."+map.get("searchField")+" like '%"+map.get("searchWord")+"%'"
							+ " and D.RECEIVER=?"
							+ " union all"
							+ " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH"
							+ " from del_msg D join member MEM on MEM.M_ID=D.SENDER"
							+ " where D."+map.get("searchField")+" like '%"+map.get("searchWord")+"%'"
							+ " and D.SENDER=?";
				}
			} else {
				query += " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH"
						+ " from del_msg D where D.RECEIVER = ?"
						+ " union all"
						+ " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH"
						+ " from del_msg D where D.SENDER = ?";
			}
		} query += ") a";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mId);
			psmt.setString(2, mId);
			
			rs = psmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectCountD error");
		}
		return result;
	}
	
	public List<MsgDTO> selectPageD(String mId, int start, int pageCount, Map map){
		List<MsgDTO> pageList = new Vector<MsgDTO>();
		String query = "select distinct MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH"
				+ " from (";
		
		if(mId != null) {
			if(map.get("searchField") != null) {
				if(map.get("searchField").equals("RECEIVER") || map.get("searchField").equals("SENDER")) {
					query += " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH"
							+ " from del_msg D join member MEM on MEM.M_ID=D."+map.get("searchField")
							+ " where ((MEM.M_NAME like '%"+map.get("searchWord")+"%') or (MEM.M_ID like '%"+map.get("searchWord")+"%'))"
							+ " and D.RECEIVER=?"
							+ " union all"
							+ " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH"
							+ " from del_msg D join member MEM on MEM.M_ID=D."+map.get("searchField")
							+ " where ((MEM.M_NAME like '%"+map.get("searchWord")+"%') or (MEM.M_ID like '%"+map.get("searchWord")+"%'))"
							+ " and D.SENDER=?";
				} else {
					query += " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH"
							+ " from del_msg D join member MEM on MEM.M_ID=D.RECEIVER"
							+ " where D."+map.get("searchField")+" like '%"+map.get("searchWord")+"%'"
							+ " and D.RECEIVER=?"
							+ " union all"
							+ " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH"
							+ " from del_msg D join member MEM on MEM.M_ID=D.SENDER"
							+ " where D."+map.get("searchField")+" like '%"+map.get("searchWord")+"%'"
							+ " and D.SENDER=?";
				}
			} else {
				query += " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH"
						+ " from del_msg D where D.RECEIVER = ?"
						+ " union all"
						+ " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH"
						+ " from del_msg D where D.SENDER = ?";
			}
		} query += ") a order by MSG_DATE desc limit ?, ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mId);
			psmt.setString(2, mId);
			psmt.setInt(3, start);
			psmt.setInt(4, pageCount);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MsgDTO dto = new MsgDTO();
				dto.setMsgCode(rs.getInt("MSG_CODE"));
				dto.setMsgType(rs.getString("MSG_TYPE"));
				dto.setMsgSender(rs.getString("SENDER"));
				dto.setMsgReceiver(rs.getString("RECEIVER"));
				dto.setMsgTitle(rs.getString("MSG_TITLE"));
				dto.setMsgContent(rs.getString("MSG_CNT"));
				dto.setMsgDate(rs.getTimestamp("MSG_DATE"));
				dto.setMsgFName(rs.getString("MSG_FNAME"));
				dto.setMsgFPath(rs.getString("MSG_FPATH"));
				
				pageList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectPageD error");
		}
		return pageList;
	}
	
	public int selectCountI(String mId, Map map) {
		int result=0;
		String query = "select distinct count(*) from (";
		
		if(mId != null) {
			if(map.get("searchField") != null) {
				if(map.get("searchField").equals("RECEIVER") || map.get("searchField").equals("SENDER")) {
					query += " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH, MSG_IMP"
							+ " from msg M where M.RECEIVER=? and M.MSG_IMP='IMP'"
							+ " union all"
							+ " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH, MSG_IMP"
							+ " from snd_msg S where S.SENDER=? and S.MSG_IMP='IMP'"
							+ ") a join member MEM on MEM.M_ID="+map.get("searchField")+""
							+ " where MEM.M_ID like '%"+map.get("searchWord")+"%'"
							+ " or MEM.M_NAME like '%"+map.get("searchWord")+"%'";
				} else {
					query += " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH, MSG_IMP"
							+ " from msg M where M.RECEIVER=? and M.MSG_IMP='IMP'"
							+ " union all"
							+ " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH, MSG_IMP"
							+ " from snd_msg S where S.SENDER=? and S.MSG_IMP='IMP'"
							+ ") a where "+map.get("searchField")+" like '%"+map.get("searchWord")+"%'";
				}
			} else {
				query += " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH, MSG_IMP"
						+ " from msg M where M.RECEIVER=? and M.MSG_IMP='IMP'"
						+ " union all"
						+ " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH, MSG_IMP"
						+ " from snd_msg S where S.SENDER=? and S.MSG_IMP='IMP'"
						+ ") a";
			}
		}
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, mId);
			psmt.setString(2, mId);
			rs = psmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectCountI error");
		}
		return result;
	}
	
	public List<MsgDTO> selectPageI(String mId, int start, int pageCount, Map map){
		List<MsgDTO> pageList = new Vector<MsgDTO>();
		String query = "select distinct MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH, MSG_IMP"
				+ " from (";
		
		if(mId != null) {
			if(map.get("searchField") != null) {
				if(map.get("searchField").equals("RECEIVER") || map.get("searchField").equals("SENDER")) {
					query += " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH, MSG_IMP"
							+ " from msg M where RECEIVER=? and M.MSG_IMP='IMP'"
							+ " union all"
							+ " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH, MSG_IMP"
							+ " from snd_msg S where SENDER=? and S.MSG_IMP='IMP'"
							+ ") a join member MEM on MEM.M_ID="+map.get("searchField")+""
							+ " where MEM.M_ID like '%"+map.get("searchWord")+"%'"
							+ " or MEM.M_NAME like '%"+map.get("searchWord")+"%'";
				} else {
					query += " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH, MSG_IMP"
							+ " from msg M where M.RECEIVER=? and M.MSG_IMP='IMP'"
							+ " union all"
							+ " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH, MSG_IMP"
							+ " from snd_msg S where S.SENDER=? and S.MSG_IMP='IMP'"
							+ ") a where "+map.get("searchField")+" like '%"+map.get("searchWord")+"%'";
				}
			} else {
				query += " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH, MSG_IMP"
						+ " from msg M where M.RECEIVER=? and M.MSG_IMP='IMP'"
						+ " union all"
						+ " select MSG_CODE, MSG_TYPE, SENDER, RECEIVER, MSG_TITLE, MSG_CNT, MSG_DATE, MSG_FNAME, MSG_FPATH, MSG_IMP"
						+ " from snd_msg S where S.SENDER=? and S.MSG_IMP='IMP'"
						+ ") a";
			}
		} query += " order by MSG_DATE desc limit ?, ?";
		
		try {
			psmt = con.prepareStatement(query);
			
			psmt.setString(1, mId);
			psmt.setString(2, mId);
			psmt.setInt(3, start);
			psmt.setInt(4, pageCount);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MsgDTO dto = new MsgDTO();
				dto.setMsgCode(rs.getInt("MSG_CODE"));
				dto.setMsgType(rs.getString("MSG_TYPE"));
				dto.setMsgSender(rs.getString("SENDER"));
				dto.setMsgReceiver(rs.getString("RECEIVER"));
				dto.setMsgTitle(rs.getString("MSG_TITLE"));
				dto.setMsgContent(rs.getString("MSG_CNT"));
				dto.setMsgDate(rs.getTimestamp("MSG_DATE"));
				dto.setMsgFName(rs.getString("MSG_FNAME"));
				dto.setMsgFPath(rs.getString("MSG_FPATH"));
				dto.setMsgImp(rs.getString("MSG_IMP"));
				
				pageList.add(dto);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("selectPageI error");
		}
		return pageList;
	}
	
// ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ recover key ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
	
}
