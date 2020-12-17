package kr.or.ddit.member.repository;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.ModelTestConfig;
import kr.or.ddit.member.model.MemberVo;

public class MemberJpaTest extends ModelTestConfig{

	@Autowired
	private MemberJpa memberJpa;
	
	@Test
	public void findByUseridTest() {
		/*****GIVEN*****/
		

		/*****WHEN*****/
		MemberVo memberVo = memberJpa.findOne("brown");

		/*****THEN*****/
		assertEquals("브라운", memberVo.getUsernm());
	}

}