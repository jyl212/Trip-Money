package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import member.dao.MemberDAO;
import member.dao.MemberDAOImpl;
import member.dto.MemberDTO;

import static fw.DBUtil.*;

public class MemberServiceImpl implements MemberService {
	@Override
	public int register(MemberDTO user) {
		int result = 0;
		
		MemberDAO dao = new MemberDAOImpl();
		
		Connection con = null;
		con = getConnection();
		try {
			con = getConnection();
			result = dao.register(user, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(con);
		}
		
		return result;
	}

	@Override
	public MemberDTO login(String mem_id, String pass) {
		
		MemberDTO user = null;		
		MemberDAO dao = new MemberDAOImpl();

		Connection con = null;
		con = getConnection();
		try {
			con = getConnection();
			user = dao.login(mem_id, pass, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(con);
		}
		
		return user;
	}

	@Override
	public boolean idCheck(String mem_id) {
		
		boolean state = false;
		MemberDAO dao = new MemberDAOImpl();
		Connection con = null;
		
		try{
			con = getConnection();
			state = dao.idCheck(mem_id, con);
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close(con);
		}
		
		return state;
	}
	
	@Override
	public boolean NickNameCheck(String nickname) {
		
		boolean state = false;
		MemberDAO dao = new MemberDAOImpl();
		Connection con = null;
		
		try{
			con = getConnection();
			state = dao.idCheck(nickname, con);
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close(con);
		}
		
		return state;
	}

	@Override
	public MemberDTO read(String mem_id) {
		System.out.println("serviceImpl의 read");
		MemberDAO dao = new MemberDAOImpl();
		MemberDTO dto = null;
		//트랜잭션 관리를 하기 위해서 Connection을 서비스단에서 만들어서 넘긴다.
		Connection con = null;
		try {
			con = getConnection();
			dto = dao.read(mem_id, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		return dto;
	}

	@Override
	public int update(MemberDTO user) {
		int result = 0;
		MemberDAO dao = new MemberDAOImpl();
		Connection con = null;
		try {
			con = getConnection();
			result = dao.update(user, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		return result;
	}

	@Override
	public int delete(String mem_id) {
		int result = 0;
		MemberDAO dao = new MemberDAOImpl();
		Connection con = null;
		Vector<String> schedules=new Vector<String>();
		try {
			con = getConnection();
			schedules=dao.selectMemberSchedule(mem_id, con);
			for(int i=0;i<schedules.size();i++){
				Vector<String> daysno=dao.selectScheduleDaysNo(schedules.get(i), con);
				for(int j=0;j<daysno.size();j++){
					dao.deleteMemberScheduleDetail(daysno.get(j), con);
				}
			}
			dao.deleteMemberScheduleDays(schedules, con);
			dao.deleteMemberbudget(schedules, con);
			dao.deleteMemberexpense(schedules, con);
			dao.deleteMemberSchedule(schedules, con);
			dao.deleteMemberthumb(mem_id, con);
			result = dao.delete(mem_id, con);
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		return result;
	}

	@Override
	public ArrayList<MemberDTO> getMemberList() {
		System.out.println("serviceImpl의 select");
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		MemberDAO dao = new MemberDAOImpl();
		//트랜잭션 관리를 하기 위해서 Connection을 서비스단에서 만들어서 넘긴다.
		Connection con = null;
		try {
			con = getConnection();
			list = dao.getMemberList(con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		return list;
	}

	@Override
	public ArrayList<MemberDTO> searchMember(String mem_id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
