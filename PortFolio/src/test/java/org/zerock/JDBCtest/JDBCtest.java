package org.zerock.JDBCtest;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class JDBCtest {   // 데이터베이스에 연결 잘 되는지 테스트 
	
	
	private final Logger logger =  LoggerFactory.getLogger(this.getClass());
	
	
	
	static {     //초기화 블록으로 (클래스 변수를) 초기화 하기.
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@Test // 아래 있는 것을 테스트해라.(즉, 컴파일 방식을 바꾸겠다.. run이 아니라 junit 방식으로)
	public void testConnection() {
		try {
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/teacher_exercise?serverTimezone=Asia/Seoul","root","1234");
			logger.info("연결상태="+conn);
		}catch(Exception e) {
			fail(e.getMessage());
		}

	}
	
 }

