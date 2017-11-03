package com.bean.cz;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import com.bean.DataBase;
import com.bean.goodsinfo.my_goods;

public class goodsegoryCZ extends DataBase {
	public Vector query(){
		Vector my_goodsinfos=new Vector();
		sqlStr="select * from my_goods";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			while(rs.next()){
				my_goods my_goodsinfo=new my_goods();
				
				my_goodsinfo.setGoodsNo(rs.getString("GoodsNo"));
				my_goodsinfo.setGoodsName(rs.getString("GoodsName"));
				my_goodsinfo.setEgoryid(rs.getString("egoryid"));
				my_goodsinfo.setContent(rs.getString("Content"));
				my_goodsinfo.setPrince(rs.getInt("unitprice"));
				my_goodsinfo.setAmount(rs.getInt("Amount"));
				my_goodsinfo.setLeav_number(rs.getInt("Leav_number"));
				my_goodsinfo.setRegTime(rs.getDate("RegTime"));
				
				my_goodsinfos.addElement(my_goodsinfo);
			}
			rs.close();
			stmt.close();
			return my_goodsinfos;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
			}
		}
	 public  List select_lei ()
     {
   	  List <String >list =new ArrayList<>();
   	  sqlStr="select * from  goodsegory";
   	  try {
			rs=stmt.executeQuery(sqlStr);
			while(rs.next())
			{
				list.add(rs.getString("egoryname"));
			}
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
     }
	
	public Vector query(String egoryid){
		Vector my_goodsinfos=new Vector();
		sqlStr="select * from my_goods,goodsegory where goodsegory.egoryid=my_goods.egoryid and goodsegory.egoryid = '"+egoryid+"'";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			while(rs.next()){
				my_goods my_goodsinfo=new my_goods();
				
				my_goodsinfo.setGoodsNo(rs.getString("GoodsNo"));
				my_goodsinfo.setGoodsName(rs.getString("GoodsName"));
				my_goodsinfo.setEgoryid(rs.getString("egoryid"));
				my_goodsinfo.setContent(rs.getString("Content"));
				my_goodsinfo.setPrince(rs.getInt("unitprice"));
				my_goodsinfo.setAmount(rs.getInt("Amount"));
				my_goodsinfo.setLeav_number(rs.getInt("Leav_number"));
				my_goodsinfo.setRegTime(rs.getDate("RegTime"));
				
				my_goodsinfos.addElement(my_goodsinfo);
			}
			rs.close();
			return my_goodsinfos;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
			}
		}
	public String query_egoryname(String egoryid){
		Vector my_goodsinfos=new Vector();
		String egoryname="";
		sqlStr="select egoryname from goodsegory where egoryid='"+egoryid+"'";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			while(rs.next()){
				egoryname=rs.getString("egoryname");
			}
			rs.close();
			return egoryname;	
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
			}
		}
	public String query_egoryid(String egoryname){
		Vector my_goodsinfos=new Vector();
		String egoryid="";
		sqlStr="select egoryid from goodsegory where egoryname='"+egoryname+"'";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			while(rs.next()){
				egoryid=rs.getString("egoryid");
			}
			rs.close();
			return egoryid;	
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
			}
		}
}
