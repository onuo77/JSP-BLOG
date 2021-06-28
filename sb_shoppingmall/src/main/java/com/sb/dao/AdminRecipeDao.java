package com.sb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sb.dto.EventProduct;
import com.sb.dto.RecipeProduct;
import com.sb.util.MybatisUtils;
import com.sb.vo.Category;
import com.sb.vo.Event;
import com.sb.vo.Product;
import com.sb.vo.Recipe;

public class AdminRecipeDao {
	
	private SqlSessionFactory sqlSessionfactory;
	
	private static AdminRecipeDao instance = new AdminRecipeDao();
	private AdminRecipeDao() {
		this.sqlSessionfactory = MybatisUtils.getSqlSessionFactory();
	}
	public static AdminRecipeDao getInstance(){
		return instance;
	}
	
	/**
	 * Recipe객체를 전달받아 새로운 레시피를 추가한다.
	 * @param recipe
	 */
	public void insertRecipe(Recipe recipe) {
		SqlSession session = sqlSessionfactory.openSession(true);
		session.insert("adminRecipes.insertRecipe", recipe);
		session.close();
	}
	
	/**
	 * 레시피 번호를 전달받아 레시피를 삭제한다.
	 * @param recipeNo 레시피 번호
	 */
	public void deleteRecipe(int recipeNo) {
		SqlSession session = sqlSessionfactory.openSession(true);
		session.delete("adminRecipes.deleteRecipe", recipeNo);
		session.close();		
	}	
	
	/**
	 * 수정된 레시피 정보를 갱신한다.
	 * @param recipeNo 레시피 번호
	 */
	public void updateRecipe(Recipe recipe) {
		SqlSession session = sqlSessionfactory.openSession(true);
		session.update("adminRecipes.updateRecipe", recipe);
		session.close();			
	}
	
	/**
	 * 새로 추가되는 event no를 획득한다.
	 * @return 추가되는 event no
	 */
	public int getRecipeSeqNo() {
		SqlSession session = sqlSessionfactory.openSession();
		int recipeNo = session.selectOne("adminRecipes.getRecipeSeqNo");
		session.close();
		return recipeNo;				
	}
	
	/**
	 * Admin event form에서 추가할 카테고리를 출력한다.
	 * @return 카테고리
	 */	
	public List<Category> getAllCategory(){
		SqlSession session = sqlSessionfactory.openSession();
		List<Category> category = session.selectList("getAllCategory");
		session.close();
		return category;
	}
	
	/**
	 * Admin event form에서 추가할 상품목록을 출력한다.
	 * @param categoryNo 카테고리 번호
	 * @return 카테고리번호로 찾은 상품목록
	 */
	public List<Product> getProductsByCategoryNo(int categoryNo){
		SqlSession session = sqlSessionfactory.openSession();
		List<Product> products = session.selectList("getProductsByCategoryNo", categoryNo);
		session.close();
		return products;
	}
	
	/**
	 * 게시글 갯수 조회하기
	 * @param param 
	 * @return 조회된 게시글 개수
	 */
	public int getTotalRows(Map<String, Object> param) {
		SqlSession session = sqlSessionfactory.openSession();
		int totalRows = session.selectOne("adminRecipes.getTotalRows", param);
		session.close();
		return totalRows;		
	}
	
	/**
	 * Admin page에서 레시피 조회를 눌렀을 때 목록을 반환한다.
	 * @return 범위 내의 레시피 목록
	 */
	public List<Recipe> getRecipes(Map<String, Object> param){
		SqlSession session = sqlSessionfactory.openSession();
		List<Recipe> recipes = session.selectList("adminRecipes.getRecipes", param);
		session.close();
		return recipes;
	}
	
	/**
	 * 레시피에 등록된 정보를 반환한다.
	 * @param RecipeNo 레시피 번호
	 * @return 레시피 번호로 찾은 레시피 정보
	 */
	public Recipe getRecipeInfoByRecipeNo(int recipeNo) {
		SqlSession session = sqlSessionfactory.openSession();
		Recipe recipe = session.selectOne("adminRecipes.getRecipeInfoByRecipeNo", recipeNo);
		session.close();
		return recipe;		
	}
	
	/**
	 * 레시피에 등록된 상품 정보를 반환한다.
	 * @param recipeNo 레시피 번호
	 * @return 레시피 번호로 찾은 레시피 상품 정보
	 */
	public List<RecipeProduct> getProductsByRecipeNo(int recipeNo) {
		SqlSession session = sqlSessionfactory.openSession();
		List<RecipeProduct> products = session.selectList("adminRecipes.getProductsByRecipeNo", recipeNo);
		session.close();
		return products;		
	}
	
	/**
	 * 레시피에 등록된 최근 3건을 조회한다.
	 * @return 최근 3건의 레시피 목록
	 */
	public List<Recipe> getRecentRecipes(){
		SqlSession session = sqlSessionfactory.openSession();
		List<Recipe> recipes = session.selectList("adminRecipes.getRecentRecipes");
		session.close();
		return recipes;
	}
}
