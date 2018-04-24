package member.query;

public class MemberQuery {
	public static String Login = 
			"select * from member where mem_id = ? and pass = ?";
	
	public static String Register = 
			"insert into member values(?,?,?,?,?)";
	
	public static String MEMBER_UPDATE =
			"update member set pass = ?, nickname = ? where mem_id = ?";
	
	public static String IDCHECK = 
			"select * from member where mem_id = ?";
	
	public static String NICKNAMECHECK = 
			"select * from member where nickname = ?";
}
