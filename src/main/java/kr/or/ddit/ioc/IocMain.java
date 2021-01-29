package kr.or.ddit.ioc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.repository.UserDao;
import kr.or.ddit.user.service.UserService;

public class IocMain {

	
	private static final Logger logger = LoggerFactory.getLogger(IocMain.class);

	public static void main(String[] args) {

		
		// 1. 스프링 설정 파일을 이용하여 스프링 컨테이너를 생성(kr/or/ddit/ioc/ioc.xml)
		// 스프링 컨테이너 타입 : ApplicationContext 
		// 2. 스프링 컨테이너에게 만들어진 스프링 빈(객체)을 요청
		//	DL :Dependency Lookup : 스프링 컨테이너에게 스프링 빈을 요청하는 과정 
		// ioc , dl 까지 배웠어! 여기까지 
		// 3. 스프링 컨테이너에서 관리되고 있는 빈이 잘 만들어 졌는지 확인 
		
		//di 는 주입하는거 
		//물리적인 경로 ㅣ d:\\upload / classPath 로 설정하기 class classpath : 
		
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("classpath:/kr/or/ddit/ioc/ioc.xml"); 
		
		//2번 시작 DL
		
		//context(컨테이너)
		
		//USERDAO 는 INTERFACE 고 오른쪽함은 구현체를 준다. 
		//GETBEAN 은 oBJECT 를 반환한다. 형변환을 해주어야 한당... 
		//나는 new 연산자를 이용해서 userdao 객체를 생성하지 않았어도 값이 나옴. 스프링 컨테이너가 대신 해줌 
		UserDao userDao = (UserDao)context.getBean("userDao");
		UserVo userVo = userDao.getUser("brown"); 
		logger.debug("userVo : {} " , userVo);
		
		//스프링 컨테어니로부터 userService 스프링 빈을 DL 을 통해 얻어오고 , 
		//getUser 메소드를 call, 반환값을 logger 를 통해 출력

		UserService userService = (UserService)context.getBean("userService"); 
		UserVo userVo1 = userService.getUser("brown");
		logger.debug("userVo1 :{} " , userVo1);
		
		//위에서 dependency injection 을 하지 않았을떄는 nullpointerException 이 생긴다. 
		
		for( String beanName : context.getBeanDefinitionNames()) {
			logger.debug("beanName : {} " , beanName);
		}
		
	}
}
