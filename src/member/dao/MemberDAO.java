package member.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import member.dto.MemberDTO;

public interface MemberDAO {
	
	//회원가입
	int register (MemberDTO user, Connection con) throws SQLException;
	
	//로그인
	MemberDTO login(String mem_id,String pass, Connection con) throws SQLException;
	
	//아이디 중복확인
	boolean idCheck(String mem_id, Connection con) throws SQLException;
	
	//닉네임 중복확인
	boolean NickNameCheck(String nickname, Connection con) throws SQLException;
	
	//회원정보 가져오기
	MemberDTO read(String mem_id,Connection con) throws SQLException;
	
	//회원정보 수정하기
	int update(MemberDTO user, Connection con) throws SQLException;
	
	//회원탈퇴
	int delete(String mem_id,Connection con) throws SQLException;
	
	//회원관리 전체 조회 -- 관리자페이지
	ArrayList<MemberDTO> getMemberList(Connection con) throws SQLException;
	
	//회원관리 회원 검색 -- 관리자페이지
	ArrayList<MemberDTO> searchMember(String mem_id,Connection con) throws SQLException;
	
	Vector<String> selectMemberSchedule(String mem_id,Connection con) throws SQLException;
	Vector<String> selectScheduleDaysNo(String schduleNo,Connection con) throws SQLException;
	void deleteMemberSchedule(Vector<String> scheduleNo,Connection con) throws SQLException;
	void deleteMemberScheduleDays(Vector<String> scheduleNo,Connection con) throws SQLException;
	void deleteMemberScheduleDetail(String scheduleNo,Connection con) throws SQLException;
	void deleteMemberthumb(String mem_id,Connection con) throws SQLException;
	void deleteMemberbudget(Vector<String> scheduleNo,Connection con) throws SQLException;
	void deleteMemberexpense(Vector<String> scheduleNo,Connection con) throws SQLException;
}










