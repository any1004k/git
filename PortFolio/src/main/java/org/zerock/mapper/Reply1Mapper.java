package org.zerock.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.Reply1VO;

public interface Reply1Mapper {

	
	public List<Reply1VO> getReplyList (@Param("cri") Criteria cri, @Param("bno") int bno);
	public int count(int bno);
	
	public int addReply(Reply1VO vo);
	public int updateReply(Reply1VO vo);
	public Reply1VO getReplyTuple(int rno);
	public int removeReply(int rno);
	
}
