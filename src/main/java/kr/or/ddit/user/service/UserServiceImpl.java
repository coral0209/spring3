package kr.or.ddit.user.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.or.ddit.user.model.UserVo;
import kr.or.ddit.user.repository.UserDao;


@Service
public class UserServiceImpl implements UserService {

	@Resource(name="userDao")
	private UserDao userDao;
	
	
	
	//인자가 있는 생성자를 만들어줘서 자동으로 인자가 없는 생성자가 안만들어짐
	
	
	
	//생성자 
	public UserServiceImpl(UserDao userDao) {

		this.userDao = userDao; 
	
	}

	public UserServiceImpl() {
	}

	//ioc.xml 에 dependency 를 설정해 놓으면 (userDao를 ) userDao 를 new 로 객체 생성하지 않아도 사용이 가능하다. 
	@Override
	public UserVo getUser(String userid) {
		return userDao.getUser(userid);
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
