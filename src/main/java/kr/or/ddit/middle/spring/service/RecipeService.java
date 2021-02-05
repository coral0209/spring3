package kr.or.ddit.middle.spring.service;

import java.util.List;

import kr.or.ddit.middle.spring.vo.RecipeReviewVO;
import kr.or.ddit.middle.spring.vo.RecipeVO;



public interface RecipeService {
	
	
	/**
	 * 레시피 전체 조회 select  
	 * 
	 */
	
	
	public List<RecipeVO> viewAllRecipe();
	
	
	/**
	 * 레시피 등록 insert 
	 * 	
	 */
	
	public int recipeInsert(RecipeVO vo);
	
	/**
	 * 
	 * 레시피 삭제 
	 * 
	 */
	
	public int recipeDelete(String code);
	

	/**
	 * 메인페이지에서 클릭한 레시피 조회
	 * 
	 */
	
	public RecipeVO viewOneRecipe(String rbcod);
	
	/**
	 * 하나의 레시피 상세페이지에서 댓글 목록 전부 
	 * 
	 */
	
	public List<RecipeReviewVO> viewRecipeReply(String rb_cod);
	
	

	/**
	 * 레시피 상세에서 댓글 1개 등록하기 
	 * @param vo 객체
	 * @return 완성 됬는지 안됬는지 결과 
	 */
	public  int recipeReplyinsert(RecipeReviewVO vo);
	
	/**
	 * 
	 * 레시피 신고 컬럼에 'x' 입력 ( 사용자가 신고하면 ) 
	 * 
	 */
	
	public int alertRecipe(String rb_cod ); 

	
	/**
	 * 
	 * 레시피 댓글 삭제
	 * 
	 */
	
	public int deleteReply(String ba_cod);
	
	
	/**
	 * 
	 * 레시피 댓글 수정
	 */

	public int updateReply(RecipeReviewVO vo);
	
	
	/**
	 * 
	 * 관련댓글 전부 삭제 
	 * 
	 * @param rb_cod
	 * @return
	 */
	public int deleteAllReply(String rb_cod);
	
	
	/**
	 * 레시피 수정
	 * 
	 */
	
	public int RecipeUpdate(RecipeVO vo);
	
}
