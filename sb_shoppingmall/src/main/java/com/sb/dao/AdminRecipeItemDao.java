package com.sb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sb.dto.ModifyProduct;
import com.sb.util.MybatisUtils;
import com.sb.vo.EventItem;
import com.sb.vo.RecipeItem;

public class AdminRecipeItemDao {

	private SqlSessionFactory sqlSessionfactory;
	
	private static AdminRecipeItemDao instance = new AdminRecipeItemDao();
	private AdminRecipeItemDao() {
		this.sqlSessionfactory = MybatisUtils.getSqlSessionFactory();
	}
	public static AdminRecipeItemDao getInstance(){
		return instance;
	}
	
	/**
	 * RecipeItem 객체를 전달받아 새로운 레시피 상품을 추가한다.
	 * @param recipeItem
	 */
	public void insertRecipeItem(RecipeItem recipeItem) {
		SqlSession session = sqlSessionfactory.openSession(true);
		session.insert("adminRecipes.insertRecipeItem", recipeItem);
		session.close();
	}
	
	/**
	 * 레시피 번호를 전달받아 레시피에 등록된 상품을 삭제한다.
	 * @param recipeNo 레시피 번호
	 */
	public void deleteRecipeProduct(int recipeNo) {
		SqlSession session = sqlSessionfactory.openSession(true);
		session.delete("adminRecipes.deleteRecipeProduct", recipeNo);
		session.close();		
	}
		
	/**
	 * 기존에 등록되어 있는 상품을 조회한다.
	 * @param selectedProduct 
	 * @return recipeNo과 categoryNo으로 조회된 상품 목록
	 */
	public List<ModifyProduct> getSelectedProducts(Map<String, Object> selectedProduct){
		SqlSession session = sqlSessionfactory.openSession();
		List<ModifyProduct> selectedProducts = session.selectList("adminRecipes.getSelectedProducts", selectedProduct);
		session.close();			
		return selectedProducts;
	}
}
