package org.zerock.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Criteria;
import org.zerock.domain.Reply1PageDTO;
import org.zerock.domain.Reply1VO;
import org.zerock.mapper.Board1Mapper;
import org.zerock.mapper.Reply1Mapper;

@Service
public class Reply1Service_impl implements Reply1Service{

	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private Reply1Mapper replymapper;
	
	@Autowired
	private Board1Mapper boardmapper;
	
	
	@Override
	public Reply1PageDTO getReplyList(Criteria cri, int bno) {
	
		logger.info("서비스입니다. bno 받았는데:" + bno);
		logger.info("서비스입니다. cir 받았는데:" + cri);
		return new Reply1PageDTO(replymapper.count(bno), replymapper.getReplyList(cri, bno));
		
	}

	@Override
	public int count(int bno) {
	
		return replymapper.count(bno);
	}

	@Transactional
	@Override
	public int addReply(Reply1VO vo) {
		
		boardmapper.updateReplyCnt(1, vo.getBno());
		
		return replymapper.addReply(vo);
	}

	@Override
	public int updateReply(Reply1VO vo) {
	
		return replymapper.updateReply(vo);
	}

	@Override
	public Reply1VO getReplyTuple(int rno) {
	
		return replymapper.getReplyTuple(rno);
	}

	@Transactional
	@Override
	public int removeReply(int rno) {
		
		Reply1VO rvo = replymapper.getReplyTuple(rno);
		boardmapper.updateReplyCnt(-1, rvo.getBno());
		return replymapper.removeReply(rno);
	}

}
