package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Member1VO;
import org.zerock.mapper.Member1Mapper;

@Service
public class Member1Service_impl implements Member1Service{

	
	@Autowired
	private Member1Mapper member1Mapper;
	
	
	
	@Override
	public Member1VO getMemberInfo(Member1VO member) {
		
		
		return member1Mapper.getMemberInfo(member);
	}



	@Override
	public int checkId(String checkId) {
		
		return member1Mapper.checkId(checkId);
	}



	@Override
	public int memberRegister(Member1VO member1vo) {
		
		return member1Mapper.memberRegister(member1vo);
		
	}

}
