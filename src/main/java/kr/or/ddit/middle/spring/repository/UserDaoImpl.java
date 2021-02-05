package kr.or.ddit.middle.spring.repository;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.middle.spring.vo.ChargeVO;
import kr.or.ddit.middle.spring.vo.UserVO2;



@Repository("UserDaoImpl")
public class UserDaoImpl implements UserDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	

	@Override
	public List<UserVO2> AllUser() throws SQLException {
		
		return template.selectList("user.allMem");
	}

	@Override
	public UserVO2 UserView(String id) throws SQLException {
		return(UserVO2)  template.selectOne("user.viewOneMemSelect", id);
	}

	@Override
	public int DeleteUser(String id) throws SQLException {
		return (Integer)template.delete("user.deleteuser", id);
	}
	
	@Override
	public String loginCheckSelect(String userid) throws SQLException {
		return  template.selectOne("user.loginCheckSelect", userid);
	}




	@Override
	public int lastLogin(String id) throws SQLException {
		return  template.update("user.loginDateUpdate",id);
	}



	@Override
	public String searchid(UserVO2 vo) throws SQLException {
		return (String) template.selectOne("user.searchid", vo);
	}

	@Override
	public String searchPass(UserVO2 vo) throws SQLException {
		return (String)   template.selectOne("user.searchPass", vo);
	} 

	@Override
	public int emilUpdate(String email) throws SQLException {
		return (Integer)template.update("user.updateEmail", email);
	}





}
