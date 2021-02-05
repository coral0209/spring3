package kr.or.ddit.middle.spring.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.middle.spring.repository.RecipeDao;
import kr.or.ddit.middle.spring.repository.RecipeDaoImpl;
import kr.or.ddit.middle.spring.vo.RecipeReviewVO;
import kr.or.ddit.middle.spring.vo.RecipeVO;

@Service("RecipeServiceImpl")
public class RecipeServiceImpl implements RecipeService{

	@Resource(name="RecipeDaoIm")
	private RecipeDao recipeDao;
	
		
	//�쟾泥� �젅�떆�뵾 紐⑸줉 議고쉶 
	@Override
	public List<RecipeVO> viewAllRecipe() {
		return recipeDao.viewAllRecipe();
	}
	
	
	// �젅�떆�뵾 �븯�굹 異붽� 
	@Override
	public int recipeInsert(RecipeVO vo) {
		return recipeDao.recipeInsert(vo);
	}

	
	//�젅�떆�뵾 �궘�젣 
	@Override
	public int recipeDelete(String code) {
		return recipeDao.recipeDelete(code);
	}

	//�겢由��븳 �젅�떆�뵾 1媛쒖쓽 �젙蹂� 媛��졇�삤湲� 
	@Override
	public RecipeVO viewOneRecipe(String rbcod) {
		return recipeDao.viewOneRecipe(rbcod);
	}

	@Override
	public List<RecipeReviewVO> viewRecipeReply(String rb_cod) {
		return recipeDao.viewRecipeReply(rb_cod);
	}

	@Override
	public int recipeReplyinsert(RecipeReviewVO vo) {
		// TODO Auto-generated method stub
		return recipeDao.recipeReplyinsert(vo);
	}

	@Override
	public int alertRecipe(String rb_cod) {
		return recipeDao.alertRecipe(rb_cod);
	}

	@Override
	public int deleteReply(String ba_cod) {
		return recipeDao.deleteReply(ba_cod);
	}

	@Override
	public int updateReply(RecipeReviewVO vo) {
		return recipeDao.updateReply(vo);
	}

	@Override
	public int deleteAllReply(String rb_cod) {
		return recipeDao.deleteAllReply(rb_cod);
	}

	@Override
	public int RecipeUpdate(RecipeVO vo) {
		// TODO Auto-generated method stub
		return recipeDao.RecipeUpdate(vo);
	}



}
