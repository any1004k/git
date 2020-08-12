package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Board1AttachVO;
import org.zerock.domain.Board1VO;

public interface Board1AttachMapper {
	
	public void insert(Board1AttachVO vo);
	public void update(Board1AttachVO vo);
	public void delete(@Param("uuid") String uuid,@Param("bno")  int bno); // Param 붙여줘야함.
	public List<Board1AttachVO> findByBno(int bno);
	public int countTuple(int bno);
	
	
	/*public void update(Board1AttachVO attach);*/
	
}
