package com.sb.vo;

import java.util.Date;

public class Product {
		
	private int no;
    private String name;
    private int price;
    private int stock;
    private int categoryNo;
    private String type;
    private String producer;
    private String location;
    private Date mfdDate;
    private Date expDate;
    private String cs_num;
    private Date createdDate;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getProducer() {
		return producer;
	}
	public void setProducer(String producer) {
		this.producer = producer;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public Date getMfdDate() {
		return mfdDate;
	}
	public void setMfdDate(Date mfdDate) {
		this.mfdDate = mfdDate;
	}
	public Date getExpDate() {
		return expDate;
	}
	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}
	public String getCs_num() {
		return cs_num;
	}
	public void setCs_num(String cs_num) {
		this.cs_num = cs_num;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
    
    
}

