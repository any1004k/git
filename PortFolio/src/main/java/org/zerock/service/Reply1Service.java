package org.zerock.service;

import org.zerock.domain.Criteria;
import org.zerock.domain.Reply1PageDTO;
import org.zerock.domain.Reply1VO;

public interface Reply1Service {
	
	public Reply1PageDTO getReplyList (Criteria cri, int bno);
	public int count(int bno);
	public int addReply(Reply1VO vo);
	public int updateReply(Reply1VO vo);
	public Reply1VO getReplyTuple(int rno);
	public int removeReply(int rno);
	
}
