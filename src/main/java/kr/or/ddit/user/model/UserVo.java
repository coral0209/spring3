package kr.or.ddit.user.model;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

public class UserVo {

	private String userid; 
	private String usernm;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reg_dt; 
	
	@DateTimeFormat(pattern = "MM-dd-yyyy")
	private Date hire_dt; 

	@NumberFormat(pattern = "#,###")
	private int price; 
	
	
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getHire_dt() {
		return hire_dt;
	}

	public void setHire_dt(Date hire_dt) {
		this.hire_dt = hire_dt;
	}

	//인자가 있는 생성자가 있었으니까 인자가 없는 생성자 만들어 놓기 !!!!! 
	public UserVo() {}
	
	public UserVo(String userid, String usernm) {
	
		setUserid(userid);
		setUsernm(usernm);
	
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsernm() {
		return usernm;
	}
	public void setUsernm(String usernm) {
		this.usernm = usernm;
	}
	
	
	
	

	public Date getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}

	@Override
	public String toString() {
		return "UserVo [userid=" + userid + ", usernm=" + usernm + ", reg_dt=" + reg_dt + ", hire_dt=" + hire_dt
				+ ", price=" + price + "]";
	}

	
	
	
	



	
	
}
