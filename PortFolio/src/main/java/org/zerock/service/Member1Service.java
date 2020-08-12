package org.zerock.service;

import org.zerock.domain.Member1VO;

public interface Member1Service {
	
	

	public Member1VO getMemberInfo(Member1VO member);

	public int checkId(String checkId);

	public int memberRegister(Member1VO member1vo);
}
