package share.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import share.dto.ShareDTO;

public interface ShareService {

	ArrayList<ShareDTO> listALL();
	ArrayList<ShareDTO> searchList(String keyword);
	int thumbUp(String mem_id, String schedule_no);
	int thumbDown(String schedule_no);
	int SelectThumb(String mem_id, String schedule_no);
}
