package org.zerock.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.Board1AttachVO;
import org.zerock.domain.Board1VO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.Board1AttachMapper;
import org.zerock.mapper.Board1Mapper;

@Service
public class Board1Service_impl implements Board1Service{

	
	private static final Logger logger = LoggerFactory.getLogger(Board1Service_impl.class); 
	
	@Autowired
	private Board1Mapper boardmapper;
	
	@Autowired
	private Board1AttachMapper boardAttachmapper;
	
	
	
	@Override
	public List<Board1VO> getList(Criteria cri) {		
		
	   
	return boardmapper.getList(cri);
	}

	@Override
	public int getTotalCount() {
		
		return boardmapper.getTotalCount();
	}

	@Transactional
	@Override
	public void insert(Board1VO vo) {	
		
		//boardmapper.insert(vo);	
		boardmapper.insertSelectKey(vo);
		
		if(vo.getAttachList()==null|| vo.getAttachList().size() <=0) {
			return;
		}
		
		vo.getAttachList().forEach(attach->{
			
			attach.setBno(vo.getBno());
			boardAttachmapper.insert(attach);
		});		
	}
	
	

	@Override
	public Board1VO getTuple(int ibno) {
		logger.debug("서비스");
		return boardmapper.getTuple(ibno);
	}

	@Override
	public List<Board1AttachVO> getAttachList(int bno) {
		 logger.debug("서비스임다. getAttachList. 받은 bno는 : "+ bno);
		 
		return boardAttachmapper.findByBno(bno);
	}

	
	@Transactional
	@Override
	public void update(Board1VO vo) {
		
		boardmapper.update(vo);
		
		if(vo.getAttachList()==null|| vo.getAttachList().size() <=0) {
			return;
		}
		
		if(boardAttachmapper.countTuple(vo.getBno())==0) {
			vo.getAttachList().forEach(attach->{
				boardAttachmapper.insert(attach);
			});
		}else {		
			vo.getAttachList().forEach(attach->{
				boardAttachmapper.update(attach);
			});
				
		}
		
	}

	@Override
	public void deleteAttach(String uuid, int bno) {
		
		boardAttachmapper.delete(uuid, bno);
		
	}

	@Override
	public List<Board1VO> getBnoRank_List1() {
		
		return boardmapper.getBnoRank_List1();
	}

	@Override
	public List<Board1VO> getBnoRank_List2() {
		
		return boardmapper.getBnoRank_List2();
	}

	@Override
	public void delete(int bnoi) {
		boardmapper.delete(bnoi);
		
	}

	
	
	
	
}
