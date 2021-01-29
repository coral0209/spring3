package kr.or.ddit.user.repository;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.ddit.user.model.UserVo;


//eclipse 에서 자체적으로 내장 / maven 빌드 에도 있는데 : compile -> test code 도 compile
//-> 복사 -> maven 에서 main 실행  -> testcode 실행
//스프링 환경에서 junit 코드를 실행 -> junit 코드도 스프링 빈으로 등록 
//이름을 별도로 등록하지 않아도 됨 . 
// runwith 는 다른환경에서 실행하라 라고 하는 것 
//설정정보를 알려주는 것contextConfiguration -> 이렇게 2개를 하면 빈이 되는것. 
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/kr/or/ddit/ioc/ioc.xml")
public class UserDaoTest {

	
	//annotation 주입 
	//주입이 되는이유를 잘 생각해봐야하는데 , 빈이 되어야 하기 때문에
	@Resource(name="userDaoImpl")
	private UserDao userDao; 
	
	
	
	@Test
	public void getUsertest() {

	/***Given***/
	String userid  = "brown"; 
	/***When***/
	UserVo userVo = userDao.getUser(userid);
	/***Then***/
	assertEquals("브라운", userVo.getUsernm());
	
	}

}
