package kr.or.ddit.user;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Test;

import kr.or.ddit.common.model.PageVo;
import kr.or.ddit.test.config.WebTestConfig;

public class UserControllerTestt extends WebTestConfig {

	@Test
	public void pagingUsetTest() throws Exception {

		mockMvc.perform(get("/user/pagingUser")
				.param("page", "1").param("pageSize", "3"))
				.andExpect(status().isOk())
				.andExpect(view().name("user/pagingUser"))
				.andExpect(model().attributeExists("userList"))
				.andExpect(model().attributeExists("pageVo"))
				.andExpect(model().attributeExists("pagination"))
				.andDo(print());
	}

	
	
	@Test
	public void pagingUset2PageTest() throws Exception {

		mockMvc.perform(get("/user/pagingUser")
				.param("page", "2")
				.param("pageSize", "3"))
				.andExpect(status().isOk())
				.andExpect(view().name("user/pagingUser"))
			//	.andExpect(model().attributeExists("userList"))
				.andExpect(model().attributeExists("pageVo"))
				.andExpect(model().attributeExists("pagination"))
				.andDo(print());
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * @Test public void test() { PageVo pageVo = new PageVo();
	 * System.out.println("pageVo.getPage() : " + pageVo.getPage());
	 * 
	 * //지역변수에서는 에러. 객체를 만들어줄떄 primitive 타입은 0 , null 처럼 기본값으로 처리가 된다. ->
	 * pageVo.getPage() 는 0 으로 초기화 되어 있음
	 * 
	 * 
	 * int page; System.out.println("page : " +| page);
	 * 
	 * }
	 */

}
