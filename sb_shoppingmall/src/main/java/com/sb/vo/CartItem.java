package com.sb.vo;

import java.util.Date;

public class CartItem {
	
	private int no;
	private int amountNo;
	private String userId;
	private int productNo;
	private Date createdDate;
	
	public CartItem() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getAmountNo() {
		return amountNo;
	}

	public void setAmountNo(int amountNo) {
		this.amountNo = amountNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	

}
