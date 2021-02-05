package kr.or.ddit.middle.spring.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.middle.spring.vo.ChargeVO;
import kr.or.ddit.middle.spring.vo.UserVO2;


public interface UserService {
	
	//전체 회원 조회
	public List<UserVO2> AllUser() throws SQLException;
	
	//선택된 회원 조회
	public UserVO2 UserView(String id) throws SQLException;
	
	//회원 삭제
	public int DeleteUser(String id) throws SQLException;
	
	//로그인
	public String loginCheckSelect(String userid) throws SQLException;

	//id찾기
	public String searchid(UserVO2 vo) throws SQLException;
	//pass찾기
	public String searchPass(UserVO2 vo) throws SQLException;
	//이메일 업데이트
	public int emilUpdate(String email) throws SQLException;

	//마지막 로그인 시간 업데이트
	public int lastLogin(String id) throws SQLException;
	
}