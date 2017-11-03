package com.bean.goodsinfo;

import java.util.Date;

public class goods {
	private int id;
	private char goodsno;
	private char goodsname;
	private char egoryid;
	private char content;
	private float unitprice;
	private int amount;
	private int leav_number;
	private Date regtime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public char getGoodsno() {
		return goodsno;
	}
	public void setGoodsno(char goodsno) {
		this.goodsno = goodsno;
	}
	public char getGoodsname() {
		return goodsname;
	}
	public void setGoodsname(char goodsname) {
		this.goodsname = goodsname;
	}
	public char getEgoryid() {
		return egoryid;
	}
	public void setEgoryid(char egoryid) {
		this.egoryid = egoryid;
	}
	public char getContent() {
		return content;
	}
	public void setContent(char content) {
		this.content = content;
	}
	public float getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(float unitprice) {
		this.unitprice = unitprice;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getLeav_number() {
		return leav_number;
	}
	public void setLeav_number(int leav_number) {
		this.leav_number = leav_number;
	}
	public Date getRegtime() {
		return regtime;
	}
	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}
	
}
