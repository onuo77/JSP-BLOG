package com.sb.vo;

import java.sql.Date;

public class Recipe {

	private int no;
	private String title;
	private String ingredient;
	private String content;
	private String fileName;
	private Date createdDate;
	
	public Recipe() {	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

	public String getContent() {
		return content;
	}

	public String getContentWithBr() {
		return content.replace("\n", "<br>");
	}
	
	public void setContent(String content) {
		this.content = content;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
}
