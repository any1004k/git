package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Board1VO;
import org.zerock.domain.Criteria;

public interface Board1Mapper {

	public List<Board1VO> getList(Criteria cri);

	public int getTotalCount();

	//public void insert(Board1VO vo);

	public Board1VO getTuple(int ibno);
	
	public int updateReplyCnt(@Param("amount") int amount,
							 @Param("bno") int bno);

	public void insertSelectKey(Board1VO vo); 

	public void update(Board1VO vo);
	
	public List<Board1VO> getBnoRank_List1();

	public List<Board1VO> getBnoRank_List2();

	public void delete(int bnoi);
}
