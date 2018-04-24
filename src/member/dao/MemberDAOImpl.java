package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import member.dto.MemberDTO;

import static member.query.MemberQuery.*;
import static fw.DBUtil.*;

public class MemberDAOImpl implements MemberDAO {

	@Override
	public int register(MemberDTO user, Connection con) throws SQLException {
		
		int result = 0;
		PreparedStatement ptmt = null;
		
		ptmt = con.prepareStatement(Register);

		ptmt.setString(1, user.getMem_id());
		ptmt.setString(2, user.getPass());
		ptmt.setString(3, user.getName());
		ptmt.setString(4, user.getNickname());
		ptmt.setString(5, user.getSns());
		
		//sql½ÇÇà
		result = ptmt.executeUpdate();
		close(ptmt);
		
		return result;
	}

	@Override
	public MemberDTO login(String mem_id, String pass, Connection con) throws SQLException {
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		MemberDTO user = null;
		
		ptmt = con.prepareStatement(Login);
		ptmt.setString(1, mem_id);
		ptmt.setString(2, pass);

		rs = ptmt.executeQuery();

		if(rs.next()){
				user = new MemberDTO(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4)
						,rs.getString(5));
		}
		
		close(rs);
		close(ptmt);
		
		return user;
	}

	@Override
	public boolean idCheck(String mem_id, Connection con) throws SQLException {
		
		boolean state = false;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		ptmt = con.prepareStatement(IDCHECK);
		ptmt.setString(1, mem_id);
		rs = ptmt.executeQuery();
		
		if(rs.next()){
			state=true;
		}
		close(rs);
		close(ptmt);
		return state;
	}

	@Override
	public boolean NickNameCheck(String nickname, Connection con) throws SQLException {
		boolean state = false;
		PreparedStatement ptmt = null;
		ResultSet rs = null;
		ptmt = con.prepareStatement(NICKNAMECHECK);
		ptmt.setString(1, nickname);
		rs = ptmt.executeQuery();
		
		if(rs.next()){
			state=true;
		}
		close(rs);
		close(ptmt);
		return state;
	}

	@Override
	public MemberDTO read(String mem_id, Connection con) throws SQLException {
		System.out.println(mem_id);
		String sql = "select * from member where mem_id=?";
		PreparedStatement ptmt = null;	
		ResultSet rs = null;
		MemberDTO dto = null;
		
		ptmt = con.prepareStatement(sql);
		ptmt.setString(1,mem_id);
		rs = ptmt.executeQuery();
		if(rs.next()){
			dto = new MemberDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
		}			
		close(rs, ptmt, null);
		return dto;
	}

	@Override
	public int update(MemberDTO user, Connection con) throws SQLException {
		int result = 0;
		PreparedStatement ptmt = null;
		ptmt = con.prepareStatement(MEMBER_UPDATE);
		
		ptmt.setString(1, user.getPass());
		ptmt.setString(2, user.getNickname());
		ptmt.setString(3, user.getMem_id());
		ptmt.executeUpdate();
		
		close(ptmt);
		return result;
	}

	@Override
	public int delete(String mem_id, Connection con) throws SQLException {
		String sql = "delete from member where mem_id=?";
		PreparedStatement ptmt = null;
		int result = 0;
		
		ptmt = con.prepareStatement(sql);
		ptmt.setString(1, mem_id);
		result = ptmt.executeUpdate();
		close(ptmt);
		
		return result;
	}

	@Override
	public ArrayList<MemberDTO> getMemberList(Connection con) throws SQLException {
		System.out.println("ArrayList<MemberDTO>");
		String sql1 = "select mem_id,name,nickname from member";

		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		MemberDTO dto = null;
		PreparedStatement ptmt = null;	
		ResultSet rs = null;
		
	
	    ptmt = con.prepareStatement(sql1);
			
		
		rs = ptmt.executeQuery();
		while(rs.next()){
			dto = new MemberDTO(rs.getString(1), rs.getString(2), rs.getString(3));
			list.add(dto);
		}			
		close(rs, ptmt, null);
		
		return list;
	}

	@Override
	public ArrayList<MemberDTO> searchMember(String mem_id, Connection con) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Vector<String> selectMemberSchedule(String mem_id, Connection con) throws SQLException {
		String sql = "select SCHEDULE_NO from schedule where mem_id=?";

		Vector<String> list = new Vector<String>();
		PreparedStatement ptmt = null;	
		ResultSet rs = null;
		
	    ptmt = con.prepareStatement(sql);
		ptmt.setString(1, mem_id);
		rs = ptmt.executeQuery();
		while(rs.next()){
			list.add(rs.getString(1));
		}			
		close(rs, ptmt, null);
		
		return list;
	}

	@Override
	public void deleteMemberSchedule(Vector<String> scheduleNo, Connection con) throws SQLException {
		String sql = "delete from schedule where schedule_No=?";
		PreparedStatement ptmt = null;
		int result = 0;
		int size=scheduleNo.size();
		for(int i=0;i<size;i++){
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, scheduleNo.get(i));
			result = ptmt.executeUpdate();
			close(ptmt);
		}
	}

	@Override
	public void deleteMemberScheduleDays(Vector<String> scheduleNo, Connection con) throws SQLException {
		String sql = "delete from schedule_days where schedule_No=?";
		PreparedStatement ptmt = null;
		int result = 0;
		int size=scheduleNo.size();
		for(int i=0;i<size;i++){
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, scheduleNo.get(i));
			result = ptmt.executeUpdate();
			close(ptmt);
		}
	}

	@Override
	public void deleteMemberScheduleDetail(String scheduleNo, Connection con) throws SQLException {
		String sql = "delete from schedule_detail where SCHEDULE_DAYS_NO=?";
		PreparedStatement ptmt = null;
		int result = 0;
		ptmt = con.prepareStatement(sql);
		ptmt.setString(1, scheduleNo);
		result = ptmt.executeUpdate();
		close(ptmt);
	}

	@Override
	public void deleteMemberthumb(String mem_id, Connection con) throws SQLException {
		String sql = "delete from thumb where mem_id=?";
		PreparedStatement ptmt = null;
		int result = 0;
		ptmt = con.prepareStatement(sql);
		ptmt.setString(1, mem_id);
		result = ptmt.executeUpdate();
		close(ptmt);
	}

	@Override
	public void deleteMemberbudget(Vector<String> scheduleNo, Connection con) throws SQLException {
		String sql = "delete from budget where schedule_No=?";
		PreparedStatement ptmt = null;
		int result = 0;
		int size=scheduleNo.size();
		for(int i=0;i<size;i++){
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, scheduleNo.get(i));
			result = ptmt.executeUpdate();
			close(ptmt);
		}
	}

	@Override
	public void deleteMemberexpense(Vector<String> scheduleNo, Connection con) throws SQLException {
		String sql = "delete from expense where schedule_No=?";
		PreparedStatement ptmt = null;
		int result = 0;
		int size=scheduleNo.size();
		for(int i=0;i<size;i++){
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, scheduleNo.get(i));
			result = ptmt.executeUpdate();
			close(ptmt);
		}
	}

	@Override
	public Vector<String> selectScheduleDaysNo(String schduleNo, Connection con) throws SQLException {
		String sql = "select SCHEDULE_DAYS_NO from schedule_days where schedule_no=?";

		Vector<String> list = new Vector<String>();
		PreparedStatement ptmt = null;	
		ResultSet rs = null;
		
	    ptmt = con.prepareStatement(sql);
		ptmt.setString(1, schduleNo);
		rs = ptmt.executeQuery();
		while(rs.next()){
			list.add(rs.getString(1));
		}			
		close(rs, ptmt, null);
		
		return list;
	}
	
	
}
