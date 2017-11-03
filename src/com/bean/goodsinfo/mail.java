package com.bean.goodsinfo;

import java.util.Date;

public class mail {
	private int sendid;
	private int orderid;
	private Date sendtime;
	private String sendaddress;
	private int sendstatus;
	public int getSendid() {
		return sendid;
	}
	public void setSendid(int sendid) {
		this.sendid = sendid;
	}
	public int getOrderid() {
		return orderid;
	}
	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}
	public Date getSendtime() {
		return sendtime;
	}
	public void setSendtime(Date sendtime) {
		this.sendtime = sendtime;
	}
	public String getSendaddress() {
		return sendaddress;
	}
	public void setSendaddress(String sendaddress) {
		this.sendaddress = sendaddress;
	}
	public int getSendstatus() {
		return sendstatus;
	}
	public void setSendstatus(int sendstatus) {
		this.sendstatus = sendstatus;
	}
	
	
}
