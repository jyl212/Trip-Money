package share.service;

import static fw.DBUtil.close;
import static fw.DBUtil.getConnection;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import share.dao.ShareDAO;
import share.dao.ShareDAOImpl;
import share.dto.ShareDTO;

public class ShareServiceImpl implements ShareService{

	@Override
	public ArrayList<ShareDTO> listALL() {
		
		ArrayList<ShareDTO> sharelist = null;
		
		ShareDAO dao = new ShareDAOImpl();
		
		Connection con = null;
		con = getConnection();
		try {
			con = getConnection();
			sharelist = dao.listALL(con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(con);
		}
		
		return sharelist;
	}

	@Override
	public ArrayList<ShareDTO> searchList(String keyword) {
		
		ArrayList<ShareDTO> sharelist = null;
		
		ShareDAO dao = new ShareDAOImpl();
		
		Connection con = null;
		con = getConnection();
		try {
			con = getConnection();
			sharelist = dao.searchList(keyword, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(con);
		}
		
		return sharelist;
	}

	@Override
	public int thumbUp(String mem_id, String schedule_no) {
		
		int result = 0;
		
		ShareDAO dao = new ShareDAOImpl();
		
		Connection con = null;
		con = getConnection();
		boolean state = false;
		try {
			con = getConnection();
			con.setAutoCommit(false);
			
			dao.thumbUp(mem_id, schedule_no, con);
			dao.LikeCountUp(schedule_no, con);
			
		    
		    state = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
				try{
					if(state){
						con.commit();
					}else{
						con.rollback();
					}
				}catch(SQLException e){
					
				}
				
			close(con);
			if(state==true){
				result = 1;
			}
			else{
				result = 0;
			}
		}
		
		return result;
	}

	@Override
	public int thumbDown(String schedule_no) {
		
		int result = 0;
		
		ShareDAO dao = new ShareDAOImpl();
		
		Connection con = null;
		con = getConnection();
		boolean state = false;
		try {
			con = getConnection();
			con.setAutoCommit(false);
			
			dao.thumbDown(schedule_no, con);
			dao.LikeCountDown(schedule_no, con);
			
		    
		    state = true;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
				try{
					if(state){
						con.commit();
					}else{
						con.rollback();
					}
				}catch(SQLException e){
					
				}
				
			close(con);
			if(state==true){
				result = 1;
			}
			else{
				result = 0;
			}
		}
		
		return result;
	}

	@Override
	public int SelectThumb(String mem_id, String schedule_no) {
		
		int result = 0;
		
		ShareDAO dao = new ShareDAOImpl();
		
		Connection con = null;
		con = getConnection();
		try {
			con = getConnection();
			result = dao.SelectThumb(mem_id, schedule_no, con);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(con);
		}
		
		return result;
	}

	
	
	
	

}
