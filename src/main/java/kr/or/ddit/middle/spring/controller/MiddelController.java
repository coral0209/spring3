package kr.or.ddit.middle.spring.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.batik.apps.svgbrowser.DropDownHistoryModel;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.middle.spring.service.RecipeService;
import kr.or.ddit.middle.spring.service.RecipeServiceImpl;

import kr.or.ddit.middle.spring.vo.RecipeReviewVO;
import kr.or.ddit.middle.spring.vo.RecipeVO;
import kr.or.ddit.middle.spring.vo.UserVO2;
import kr.or.ddit.middle.spring.service.UserService;
@RequestMapping("middleController")
@Controller
public class MiddelController {
	private static final Logger logger = LoggerFactory.getLogger(MiddelController.class);

	//service ������ �ϰڴ�. 
	
	@Resource(name="RecipeServiceImpl")
	private RecipeService recipeService; 
	
	@Resource(name="UserServiceImpl")
	private UserService userService;
	
	
	//�α��� �κ� 
	@RequestMapping("loginView")
	public String loginView() {
		
		return "middleSpring/main/login"; 
	}
	
	//�α��� üũ 
	@RequestMapping("login")
	public String login(UserVO2 userVo2 , HttpSession session) throws SQLException {
		String id = userVo2.getId();
		logger.debug("useridüũȮ�� : {}" , id);
		String dbpass = userService.loginCheckSelect(id);
		String pass = userVo2.getPass();
		if(pass != null && dbpass != null && dbpass.equals(pass)) {
			
			//session �� ������ ���� �۾��� �ؾ��Ѵ�. 
			session.setAttribute("S_USER", id);

			return "middleSpring/main/Cookmarketmain"; 
			
			
			
		}else {      
		
			return "redirect:/middleController/loginView"; 
		}
	}
	
	

	
	
	
	
	//recipe �κ�
	@RequestMapping("recipeMain")
	public String recipeMain(Model model) {
		List<RecipeVO> recipeList = recipeService.viewAllRecipe(); 
		model.addAttribute("recipeList" , recipeList); 
		
		return "middleSpring/recipe/recipemain"; 
	}
	
	
	@RequestMapping("viewOneRecipe")
	public String viewOneRecipe(String rbcod , Model model) {
		//�Խñ� 1�� ���� �������� 
		RecipeVO oneRecipe = recipeService.viewOneRecipe(rbcod); 
		
		//���õ� ��� 1�� ���� �������� 
		List<RecipeReviewVO> replylist = recipeService.viewRecipeReply(rbcod); 
		
		model.addAttribute("oneRecipe", oneRecipe); 
		model.addAttribute("replyList", replylist);
		
		
		return "middleSpring/recipe/recipeone";
	}
	
	
	@RequestMapping(path="recipeInsert" , method = RequestMethod.POST )
	public String recipeInsert( RecipeVO recipeVo , MultipartFile profile , HttpServletRequest request ) {
		HttpSession session = request.getSession(); 
		
		
		int insertCnt = 0 ; 
		String originalFilename = ""; 
		String filename = ""; 
		String id = recipeVo.getId();
		recipeVo.setId(id);
		if(profile.getSize() > 0) {
			originalFilename = profile.getOriginalFilename(); 
			filename = UUID.randomUUID().toString() + "." + 
			originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
		
			//���� ����ڰ� ������ ���� �̸�
			recipeVo.setFilename(originalFilename);
			// uuid �� ���� ���� ���� + ���
			recipeVo.setFile_path( "D:\\upload\\"  + filename);
			try {
				profile.transferTo(new File(recipeVo.getFile_path()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
		
		}
		insertCnt = recipeService.recipeInsert(recipeVo); 
		
		//������
		if(insertCnt == 1) {
			return "redirect:/middleController/recipeMain"; 
		}else{
			return "redirect:/middleController/recipeMain"; 
		}
		
		
	}
	
	
	//������ ���� 
	@RequestMapping("deleteRecipe")
	public String deleteRecipe(String rbcod) {
		recipeService.recipeDelete(rbcod); 
		return "redirect:/middleController/recipeMain"; 
	}
	
	
	//�����Ǽ���
	@RequestMapping(path="updateRecipe", method = RequestMethod.POST)
	public String updateRecipe(RecipeVO recipeVo) {
	recipeService.RecipeUpdate(recipeVo); 
	String rbcod = recipeVo.getRb_cod();
		return "redirect:/middleController/viewOneRecipe?rbcod=" + rbcod;
	}
	
	//��� ���
	@RequestMapping("insertReply")
	public String insertReply(String rbcod , String replyContent , HttpSession session , Model model ) {
		logger.debug("����� �߿�?? insertReply");
		String id = (String) session.getAttribute("S_USER"); 
		RecipeReviewVO recipeReviewVo = new RecipeReviewVO(); 
		String sd = replyContent ; 
		String rb = rbcod;
		recipeReviewVo.setBa_content(replyContent);
		recipeReviewVo.setId(id);
		recipeReviewVo.setRb_cod(rbcod);
		int result = recipeService.recipeReplyinsert(recipeReviewVo); 
		
	
		return "redirect:/middleController/viewOneRecipe?rbcod=" + rb; 		
		
	}
	
	   //��� ����
	   @RequestMapping("deleteReply")
	   public String deleteReply(String bacod , String rbcod) {
	      recipeService.deleteReply(bacod);
	      
	      return "redirect:/middleController/viewOneRecipe?rbcod=" + rbcod; 
	   }
	   
	   
	   //��� ����
	   @RequestMapping("updateReply")
	   public String updateReply(String bacod , String updateCont , String rbcod) {
		   
		   
		   RecipeReviewVO recipeReviewVo = new RecipeReviewVO(); 
		   recipeReviewVo.setBa_cod(bacod);
		   recipeReviewVo.setBa_content(updateCont);
		   recipeService.updateReply(recipeReviewVo); 
		   
		   return "redirect:/middleController/viewOneRecipe?rbcod=" + rbcod;  
	   }
	
	
	   //recipe ����
	   @RequestMapping("recipepdf")
	   public String recipepdf(String rbcod , Model model) {
		   RecipeVO recipeVo = recipeService.viewOneRecipe(rbcod); 
		   
		   model.addAttribute("recipevo", recipeVo); 
		   
		return "middleSpring/recipe/recipePdf";
		   
		   
	   }
	
	   
	   

	
}
