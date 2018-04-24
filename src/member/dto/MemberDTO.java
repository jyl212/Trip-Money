package member.dto;

public class MemberDTO{
	private String mem_id;
	private String pass;
	private String name;
	private String nickname;
	private String sns;
	
	
	public MemberDTO() {
		super();
	}

	//업데이트 용
	public MemberDTO(String mem_id, String pass, String name, String nickname) {
		super();
		this.mem_id = mem_id;
		this.pass = pass;
		this.name = name;
		this.nickname = nickname;
	}
	public MemberDTO(String mem_id, String nickname, String name, String pass, String sns) {
		super();
		this.mem_id = mem_id;
		this.pass = pass;
		this.name = name;
		this.nickname = nickname;
		this.sns = sns;
	}


	public MemberDTO(String mem_id, String name, String nickname) {
		super();
		this.mem_id = mem_id;
		this.name = name;
		this.nickname = nickname;
	}

	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public String getPass() {
		return pass;
	}


	public void setPass(String pass) {
		this.pass = pass;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getSns() {
		return sns;
	}


	public void setSns(String sns) {
		this.sns = sns;
	}
	
	
}
	
	












