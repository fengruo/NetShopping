package com.bean.cz;

import java.sql.SQLException;
import java.util.Vector;

import com.bean.DataBase;
import com.bean.goodsinfo.lineitem;
import com.bean.goodsinfo.my_goods;

public class lineitemCZ extends DataBase {
	public  void insert(int orderid, String GoodsNo,int quantity,int unitprice){
		sqlStr="insert into lineitem values("+orderid+",'"+GoodsNo+"',"+quantity+","+unitprice+") on duplicate key update orderid="+orderid+",GoodsNo='"+GoodsNo+"' ,quantity=quantity+"+quantity+" ,unitprice="+unitprice;
		try {
			stmt.executeUpdate(sqlStr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public  int deleteUserinfo (int  orderid)
	{
		sqlStr="delete from lineitem where orderid= "+orderid;
		System.out.print(sqlStr);
		try {
			int a=stmt.executeUpdate(sqlStr);
			stmt.close();
			return a;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
			}
	}


	public Vector query(String username){
		Vector userinfo=new Vector();
		sqlStr="select * from lineitem,reguser,orders where reguser.userid=orders.userid and orders.orderid=lineitem.orderid and reguser.username = '"+username+"'";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			while(rs.next()){
				lineitem lineinfo=new lineitem();
				
				lineinfo.setOrderid(rs.getInt("orderid"));
				lineinfo.setGoodsno(rs.getString("goodsno"));
				lineinfo.setQuantity(rs.getInt("quantity"));
				lineinfo.setUnitprice(rs.getInt("unitprice"));
				
				userinfo.addElement(lineinfo);
			}
			rs.close();
			return userinfo;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
			}
		}
//	public Vector query_name(String userid){
//		Vector userinfo2=new Vector();
//		String username=null;
//		sqlStr="select GoodsName from my_goods,orders,lineitem,reguser where reguser.userid=orders.userid and orders.orderid=lineitem.orderid and lineitem.GoodsNo=my_goods.GoodsNo and reguser.userid = '"+userid+"'";
//		System.out.print(sqlStr);
//		try {
//			rs=stmt.executeQuery(sqlStr);
//			while(rs.next()){
//				my_goods goodsinfo=new my_goods();
//				goodsinfo.setGoodsName(rs.getString("GoodsName"));
//				
//				userinfo2.addElement(goodsinfo);
//			}
//			rs.close();
//			return userinfo2;	
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return null;
//			}
//		}
	public String query_goodsname(String GoodsNo){
		String username="";
		sqlStr="select GoodsName from my_goods where GoodsNo='"+GoodsNo+"'";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			while(rs.next()){
				username=rs.getString("GoodsName");
			}
			rs.close();
			return username;	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
			}
		}
	public int delete(int orderid,String GoodsNo){
		sqlStr="delete from lineitem where orderid= "+orderid+" and GoodsNo='"+GoodsNo+"'";
		System.out.print(sqlStr);
		try {
			int a=stmt.executeUpdate(sqlStr);
			stmt.close();
			return a;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
			}
		}
}
