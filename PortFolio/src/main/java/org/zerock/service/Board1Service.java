package org.zerock.service;

import java.util.List;

import org.zerock.domain.Board1AttachVO;
import org.zerock.domain.Board1VO;
import org.zerock.domain.Criteria;

public interface Board1Service {

	public List<Board1VO> getList(Criteria cri);
	
	public int getTotalCount();
	
	public void insert(Board1VO vo);
	
	public Board1VO getTuple(int ibno);
	
	public List<Board1AttachVO> getAttachList (int bno);

	public void update(Board1VO vo);

	public void deleteAttach(String uuid, int bno);

	public List<Board1VO> getBnoRank_List1();

	public Object getBnoRank_List2();

	public void delete(int bnoi);
	
}                                 
