package kr.or.ddit.middle.spring.repository;

import java.util.List;

import kr.or.ddit.middle.spring.vo.RecipeReviewVO;
import kr.or.ddit.middle.spring.vo.RecipeVO;



public interface RecipeDao {

	

	/**
	 * 레시피 전체 조회 select  
	 * @param 없읍
 	 *  @paramlist  에 담겨진 RecipeVO 객체들
	 */	
	public List<RecipeVO> viewAllRecipe();
	
	
	/**
	 *  @param 등록할 내용 담긴 RecipeVO 객체 1개 
	 *  @paramlist 성공시 1 , 실패시 : 0 
	 * 레시피 등록 insert 
	 * 	
	 */
	
	public int recipeInsert(RecipeVO vo);
	
	/**
	 * 
	 * 레시피 삭제 
	 * @param 삭제할 행의 레시피게시판 코드 
	 * @paramlist 성공시 1 , 실패시 : 0 
	 * 
	 * 
	 */
	public int recipeDelete(String code);
	
	
	/**
	 * 사진을 클릭한 레시피 1개 상세보기
	 * @param 클릭한 레시피 1개의 rb_cod (분류코드) 
	 * @paramlist 클릭한 레시피1개의 모든 행의 정보 
	 * 
	 */
	public RecipeVO viewOneRecipe(String rbcod);
	
	
	/**
	 * 
	 * 레시피 상세페이지에서 댓글 전부 가져오기 
	 * @param 파라미터는 상위 recipeb 테이블에서 rb_cod를 가져와야 한다.  
	 * @paramlist : 상위 rb_cod 에 해당하는 모든 댓글 list  
	 */
	public List<RecipeReviewVO> viewRecipeReply(String rb_cod); 

	/**
	 * 레시피 상세페이지에서 댓글 달기 
	 * 
	 * 
	 */
	
	public int recipeReplyinsert(RecipeReviewVO vo);
	
	
	/**
	 * 레시피 신고
	 * 
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
	 * 
	 */
	public int updateReply(RecipeReviewVO vo);
	
	
	/**
	 * 
	 * 레시피댓글 글1개에 ㅡ관련된 댓글 전체 삭제
	 * @param rb_cod
	 * @return
	 */
	
	public int deleteAllReply(String rb_cod);
	
	/**
	 * 
	 * 레시피 수정하기 
	 */
	
	public int RecipeUpdate(RecipeVO vo);
}
