package com.sb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sb.util.MybatisUtils;
import com.sb.vo.Event;
import com.sb.vo.Product;
import com.sb.vo.Recipe;

public class RecipeDao {
	
	private static RecipeDao instance = new RecipeDao();
	
	private RecipeDao() {
		this.sqlSessionFactory = MybatisUtils.getSqlSessionFactory(); 
	}

	private SqlSessionFactory sqlSessionFactory;
	
	public static RecipeDao getInstance() {
		return instance;
	}
	public int getTotalRows(Map<String,Object> param) {
		SqlSession session = sqlSessionFactory.openSession();
		int totalRows = session.selectOne("recipes.getTotalRows", param);
		session.close();
		return totalRows;
	}
	
	public List<Recipe> getRecipes(Map<String, Object> param){
		SqlSession session = sqlSessionFactory.openSession();
		List<Recipe> recipes = session.selectList("recipes.getRecipes", param);
		session.close();
		return recipes;
	}
	
	public Recipe getRecipeByNo(int no) {
		SqlSession session = sqlSessionFactory.openSession();
		Recipe recipe = session.selectOne("recipes.getRecipeByNo",no);
		session.close();
		return recipe;
	}
	
	public List<Recipe> getRecipeByIngredient(String ing){
		SqlSession session = sqlSessionFactory.openSession();
		List<Recipe> recipes = session.selectList("recipes.getRecipeByIngredient", ing);
		session.close();
		return recipes;
	}
	
	public List<Product> getProductByRecipeNo(int no){
		SqlSession session = sqlSessionFactory.openSession();
		List<Product> products = session.selectList("lists.getProductsByRecipe", no);
		session.close();
		return products;
		
	}
	
}
