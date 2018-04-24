package member.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import member.dto.MemberDTO;

public interface MemberDAO {
	
	//ȸ������
	int register (MemberDTO user, Connection con) throws SQLException;
	
	//�α���
	MemberDTO login(String mem_id,String pass, Connection con) throws SQLException;
	
	//���̵� �ߺ�Ȯ��
	boolean idCheck(String mem_id, Connection con) throws SQLException;
	
	//�г��� �ߺ�Ȯ��
	boolean NickNameCheck(String nickname, Connection con) throws SQLException;
	
	//ȸ������ ��������
	MemberDTO read(String mem_id,Connection con) throws SQLException;
	
	//ȸ������ �����ϱ�
	int update(MemberDTO user, Connection con) throws SQLException;
	
	//ȸ��Ż��
	int delete(String mem_id,Connection con) throws SQLException;
	
	//ȸ������ ��ü ��ȸ -- ������������
	ArrayList<MemberDTO> getMemberList(Connection con) throws SQLException;
	
	//ȸ������ ȸ�� �˻� -- ������������
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










