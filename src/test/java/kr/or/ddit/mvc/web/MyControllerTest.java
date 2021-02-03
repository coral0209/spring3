package kr.or.ddit.mvc.web;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.fileUpload;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Test;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.web.servlet.MvcResult;

import kr.or.ddit.test.config.WebTestConfig;

public class MyControllerTest extends WebTestConfig {

	@Test
	public void fileUploadViewtest() throws Exception {

		MvcResult mvcResult = mockMvc
				.perform(get("/mvc/fileupload/view"))
				.andExpect(view().name("file/view"))
				.andDo(print())
				.andReturn();
	}

	
	@Test 
	public void fileuploadTest() throws Exception {
		
		//String name , String originalFileName , String contentType , InputStream inputStream  
		ClassPathResource resource = new ClassPathResource("kr/or/ddit/upload/sally.png"); 
		
		MockMultipartFile file= new MockMultipartFile("picture", "sally.png" , "image/png" , resource.getInputStream()); 
		mockMvc.perform(fileUpload("/mvc/fileupload/upload")
				.file(null)
				.param("userid", "brown"))
				.andExpect(view().name("file/view"))
				.andDo(print())
		;
		
	}
	
}
