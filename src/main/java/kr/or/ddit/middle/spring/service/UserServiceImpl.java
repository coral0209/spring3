package kr.or.ddit.middle.spring.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.middle.spring.vo.UserVO2;
import kr.or.ddit.middle.spring.repository.UserDao;
import kr.or.ddit.middle.spring.repository.UserDaoImpl;
import kr.or.ddit.middle.spring.vo.ChargeVO;

@Service("UserServiceImpl")
public class UserServiceImpl implements UserService{
	
	@Resource(name="UserDaoImpl")
	private UserDao userDao; 
	
	@Override
	public List<UserVO2> AllUser() {
		
		List<UserVO2> list = null;
		
		try {
			list = userDao.AllUser();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public UserVO2 UserView(String id) throws SQLException {
		return  userDao.UserView(id);
	}

	@Override
	public int DeleteUser(String id) {
		int res = 0;
		
		try {
			res = userDao.DeleteUser(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public String loginCheckSelect(String userid) throws SQLException {
	
		return userDao.loginCheckSelect(userid);
	}

	


	@Override
	public int lastLogin(String id) {
		int res = 0;
		
		try {
			res = userDao.lastLogin(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return res;
	}
	

	//id찾기
	@Override
	public String searchid(UserVO2 vo) {
		String id = null;
		try {
			id=userDao.searchid(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}

	@Override
	public String searchPass(UserVO2 vo) {
		String pass = null;
		
		try {
			pass = userDao.searchPass(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pass;
	}

	@Override
	public int emilUpdate(String email) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	

	
}
