package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import member.dto.MemberDTO;


public interface MemberService {
	//회원가입
	int register (MemberDTO user);
	
	//로그인
	MemberDTO login(String mem_id,String pass);
	
	//아이디 중복확인
	boolean idCheck(String mem_id);
	
	boolean NickNameCheck(String nickname);
	
	//회원정보 가져오기
	MemberDTO read(String mem_id);
	
	//회원정보 수정하기
	int update(MemberDTO user);
	
	//회원탈퇴
	int delete(String mem_id);
	
	//회원관리 전체 조회 -- 관리자페이지
	ArrayList<MemberDTO> getMemberList();
	
	//회원관리 회원 검색 -- 관리자페이지
	ArrayList<MemberDTO> searchMember(String mem_id);
}
