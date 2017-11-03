package com.bean.goodsinfo;

import java.text.DecimalFormat;
import java.util.Date;

public class my_goods {
	private String GoodsNo;
	private String GoodsName;
	private String egoryid;
	private String Content;
	private int Prince;
	private int Amount;
	private int Leav_number;
	private Date RegTime;
	
	
	public String getGoodsNo() {
		return GoodsNo;
	}
	public void setGoodsNo(String goodsNo) {
		GoodsNo = goodsNo;
	}
	public String getGoodsName() {
		return GoodsName;
	}
	public void setGoodsName(String goodsName) {
		GoodsName = goodsName;
	}
	public String getEgoryid() {
		return egoryid;
	}
	public void setEgoryid(String egoryid) {
		this.egoryid = egoryid;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	
	public int getPrince() {
		return Prince;
	}
	public void setPrince(int prince) {
		Prince = prince;
	}
	public int getAmount() {
		return Amount;
	}
	public void setAmount(int amount) {
		Amount = amount;
	}
	public int getLeav_number() {
		return Leav_number;
	}
	public void setLeav_number(int leavNumber) {
		Leav_number = leavNumber;
	}
	public Date getRegTime() {
		return RegTime;
	}
	public void setRegTime(Date regTime) {
		RegTime = regTime;
	}
	
	
	
}
