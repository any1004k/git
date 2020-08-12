package org.zerock.JDBCtest;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.mapper.Board1Mapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MyBatis_test {

	private final Logger logger =  LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private Board1Mapper board1Mapper;
	
	
	@Test
	public void batisTest() {
		Criteria cri = new Criteria();
		logger.debug(""+board1Mapper.getList(cri));
		
	}
	
	
}
