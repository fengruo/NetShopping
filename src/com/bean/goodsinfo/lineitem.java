package com.bean.goodsinfo;

import java.text.DecimalFormat;

public class lineitem {
	private int orderid;
	private String goodsno;
	private int quantity;
	private int unitprice;
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public String getGoodsno() {
		return goodsno;
	}
	public void setGoodsno(String goodsno) {
		this.goodsno = goodsno;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(int unitprice) {
		this.unitprice = unitprice;
	}
	
	
	
}
