package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import member.dto.MemberDTO;


public interface MemberService {
	//ȸ������
	int register (MemberDTO user);
	
	//�α���
	MemberDTO login(String mem_id,String pass);
	
	//���̵� �ߺ�Ȯ��
	boolean idCheck(String mem_id);
	
	boolean NickNameCheck(String nickname);
	
	//ȸ������ ��������
	MemberDTO read(String mem_id);
	
	//ȸ������ �����ϱ�
	int update(MemberDTO user);
	
	//ȸ��Ż��
	int delete(String mem_id);
	
	//ȸ������ ��ü ��ȸ -- ������������
	ArrayList<MemberDTO> getMemberList();
	
	//ȸ������ ȸ�� �˻� -- ������������
	ArrayList<MemberDTO> searchMember(String mem_id);
}
