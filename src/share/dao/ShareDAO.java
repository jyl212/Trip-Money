package share.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import share.dto.ShareDTO;

public interface ShareDAO {
	
	ArrayList<ShareDTO> listALL(Connection con) throws SQLException;
	ArrayList<ShareDTO> searchList(String keyword ,Connection con) throws SQLException;
	int thumbUp(String mem_id, String schedule_no, Connection con) throws SQLException;
	int thumbDown(String schedule_no, Connection con) throws SQLException;
	int LikeCountUp(String schedule_no, Connection con) throws SQLException;
	int LikeCountDown(String schedule_no, Connection con) throws SQLException;
	int SelectThumb(String mem_id, String schedule_no, Connection con) throws SQLException;
	//int updateShare(String )

}
