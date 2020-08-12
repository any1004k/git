package org.zerock.mapper;


import org.zerock.domain.Member1VO;

public interface Member1Mapper {

	Member1VO getMemberInfo(Member1VO member);

	int checkId(String checkId);

	int memberRegister(Member1VO member1vo);
	


}
