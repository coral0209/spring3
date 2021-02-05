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

	//service 주입을 하겠다. 
	
	@Resource(name="RecipeServiceImpl")
	private RecipeService recipeService; 
	
	@Resource(name="UserServiceImpl")
	private UserService userService;
	
	
	//로그인 부분 
	@RequestMapping("loginView")
	public String loginView() {
		
		return "middleSpring/main/login"; 
	}
	
	//로그인 체크 
	@RequestMapping("login")
	public String login(UserVO2 userVo2 , HttpSession session) throws SQLException {
		String id = userVo2.getId();
		logger.debug("userid체크확인 : {}" , id);
		String dbpass = userService.loginCheckSelect(id);
		String pass = userVo2.getPass();
		if(pass != null && dbpass != null && dbpass.equals(pass)) {
			
			//session 을 저장해 놓는 작업을 해야한다. 
			session.setAttribute("S_USER", id);

			return "middleSpring/main/Cookmarketmain"; 
			
			
			
		}else {      
		
			return "redirect:/middleController/loginView"; 
		}
	}
	
	

	
	
	
	
	//recipe 부분
	@RequestMapping("recipeMain")
	public String recipeMain(Model model) {
		List<RecipeVO> recipeList = recipeService.viewAllRecipe(); 
		model.addAttribute("recipeList" , recipeList); 
		
		return "middleSpring/recipe/recipemain"; 
	}
	
	
	@RequestMapping("viewOneRecipe")
	public String viewOneRecipe(String rbcod , Model model) {
		//게시글 1개 정보 가져오기 
		RecipeVO oneRecipe = recipeService.viewOneRecipe(rbcod); 
		
		//관련된 댓글 1개 정보 가져오기 
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
		
			//원래 사용자가 저장한 파일 이름
			recipeVo.setFilename(originalFilename);
			// uuid 로 만든 파일 네임 + 경로
			recipeVo.setFile_path( "D:\\upload\\"  + filename);
			try {
				profile.transferTo(new File(recipeVo.getFile_path()));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
		
		}
		insertCnt = recipeService.recipeInsert(recipeVo); 
		
		//정상등록
		if(insertCnt == 1) {
			return "redirect:/middleController/recipeMain"; 
		}else{
			return "redirect:/middleController/recipeMain"; 
		}
		
		
	}
	
	
	//레시피 삭제 
	@RequestMapping("deleteRecipe")
	public String deleteRecipe(String rbcod) {
		recipeService.recipeDelete(rbcod); 
		return "redirect:/middleController/recipeMain"; 
	}
	
	
	//레시피수정
	@RequestMapping(path="updateRecipe", method = RequestMethod.POST)
	public String updateRecipe(RecipeVO recipeVo) {
	recipeService.RecipeUpdate(recipeVo); 
	String rbcod = recipeVo.getRb_cod();
		return "redirect:/middleController/viewOneRecipe?rbcod=" + rbcod;
	}
	
	//댓글 등록
	@RequestMapping("insertReply")
	public String insertReply(String rbcod , String replyContent , HttpSession session , Model model ) {
		logger.debug("여기는 잘와?? insertReply");
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
	
	   //답글 삭제
	   @RequestMapping("deleteReply")
	   public String deleteReply(String bacod , String rbcod) {
	      recipeService.deleteReply(bacod);
	      
	      return "redirect:/middleController/viewOneRecipe?rbcod=" + rbcod; 
	   }
	   
	   
	   //답글 수정
	   @RequestMapping("updateReply")
	   public String updateReply(String bacod , String updateCont , String rbcod) {
		   
		   
		   RecipeReviewVO recipeReviewVo = new RecipeReviewVO(); 
		   recipeReviewVo.setBa_cod(bacod);
		   recipeReviewVo.setBa_content(updateCont);
		   recipeService.updateReply(recipeReviewVo); 
		   
		   return "redirect:/middleController/viewOneRecipe?rbcod=" + rbcod;  
	   }
	
	
	   //recipe 저장
	   @RequestMapping("recipepdf")
	   public String recipepdf(String rbcod , Model model) {
		   RecipeVO recipeVo = recipeService.viewOneRecipe(rbcod); 
		   
		   model.addAttribute("recipevo", recipeVo); 
		   
		return "middleSpring/recipe/recipePdf";
		   
		   
	   }
	
	   
	   

	
}
