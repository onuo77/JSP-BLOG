package com.sb.dto;


public class CartitemDto {
	private int no;
	private int cartitemAmount;
	private String userId;
	private int productNo;
	private String productName;
	private int productPrice;
	
	
	public CartitemDto() {}
	

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getCartitemAmount() {
		return cartitemAmount;
	}

	public void setCartitemAmount(int cartitemAmount) {
		this.cartitemAmount = cartitemAmount;
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

	

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}




	
	
}
