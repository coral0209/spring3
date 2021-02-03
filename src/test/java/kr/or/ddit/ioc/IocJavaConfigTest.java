package kr.or.ddit.ioc;

import static org.junit.Assert.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.or.ddit.ioc.config.IocJavaConfig;
import kr.or.ddit.user.service.UserService;



@ContextConfiguration(classes = {IocJavaConfig.class})
@RunWith(SpringJUnit4ClassRunner.class)
public class iocJavaConfigTest {

	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="userService")
	private UserService userService2;
	
	@Resource(name="userServiceCons")
	private UserService userServiceCons;
	
	//userServiceCons 스프링 빈이 정상적으로 생성 되었는지 테스트 
	
	@Resource(name="userServiceProtoType")
	private UserService userServiceProtoType; 
	
	@Resource(name="userServiceProtoType")
	private UserService userServiceProtoType2; 
	
	@Resource(name="dbConfig")
	private DbConfig dbconfig;
	
	@Test
	public void userServiceConsTest() {
		/***Given***/
		

		/***When***/

		/***Then***/
		assertNotNull(userServiceCons);
	
	}
	
	
	@Test
	public void banScopeTest() {
		/***Given***/
		

		/***When***/

		/***Then***/
		//디자인 패턴의 singletone 패턴 개념으로 보면 두개의 객체는 한 클래스로부터 나왔기 때문에 동일 해야함
	assertNotEquals(userService, userServiceCons);
	

	}
	

	@Test
	public void banScopeTest2() {
	
	//동일한 스프링 빈을 주입받았으므로 userService 와 userService2 는 같은 객체다. 
	assertEquals(userService, userService2);
	}
	
	
	//scope 가 singleton prototype 이냐 , 인지에 따라서 새롭게 생성되는지 계속 있는지가 달라짐 . 

	@Test
	public void beanScopePrototypeTest2() {
	
	//동일한 userServiceProtype 빈을 주입(scope : prototype) 
	// -> 늘 생성해준다. 
	assertNotEquals(userServiceProtoType, userServiceProtoType2);
	}
	
	
	@Test
	public void propertyPlaceholderTest() {
		
	assertNotNull(dbconfig);
	assertEquals("team3_202008m", dbconfig.getUsername());
	assertEquals("oracle.jdbc.driver.OracleDriver", dbconfig.getDriverClassName());
	assertEquals("jdbc:oracle:thin:@112.220.114.130:1521:xe", dbconfig.getUrl());
	assertEquals("java", dbconfig.getPassword());
		
	}

}
