package kr.or.ddit.middle.spring.repository;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import kr.or.ddit.middle.spring.vo.RecipeReviewVO;
import kr.or.ddit.middle.spring.vo.RecipeVO;


@Repository("RecipeDaoIm")
public class RecipeDaoImpl implements RecipeDao{

	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	
	
	@Override
	public List<RecipeVO> viewAllRecipe() {
		List<RecipeVO> Recipelist = null ; 
		return template.selectList("recipe.viewAllRecipe");
	}

	
	//insert �뒗 object 濡� 諛쏆븘���꽌 null �씠硫� �꽦怨듯븳寃� 	
	@Override
	public int recipeInsert(RecipeVO vo) {
			
		return template.insert("recipe.recipeInsert" , vo);
	}

	@Override
	public int recipeDelete(String code) {

		
		return template.delete("recipe.recipeDelete", code);
	}


	@Override
	public RecipeVO viewOneRecipe(String rbcod) {
	
		
		
		return (RecipeVO) template.selectOne("recipe.viewOneRecipe", rbcod);
	}


	@Override
	public List<RecipeReviewVO> viewRecipeReply(String rb_cod) {
		return template.selectList("recipe.viewRecipeReply", rb_cod );
	}


	@Override
	public int recipeReplyinsert(RecipeReviewVO vo) {
		
		return  template.insert("recipe.recipeReplyinsert" , vo);
	}


	@Override
	public int alertRecipe(String rb_cod) {
		return template.update("recipe.alertRecipe" , rb_cod);
	}


	@Override
	public int deleteReply(String ba_cod) {
		return template.delete("recipe.deleteReply" , ba_cod);
	}


	@Override
	public int updateReply(RecipeReviewVO vo) {
		return template.update("recipe.updateReply", vo);
	}


	@Override
	public int deleteAllReply(String rb_cod) {

		return template.delete("recipe.deleteAllReply", rb_cod);
	}


	@Override
	public int RecipeUpdate(RecipeVO vo) {
		
		return template.update("recipe.RecipeUpdate", vo);
	}






}
