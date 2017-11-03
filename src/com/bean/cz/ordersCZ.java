package com.bean.cz;

import java.sql.SQLException;
import java.util.Vector;

import com.bean.DataBase;
import com.bean.goodsinfo.orders;
import com.bean.goodsinfo.reguser;

public class ordersCZ extends DataBase {
	public  void update(int ordid,int price){
		sqlStr="update orders set totalprice=totalprice+"+price+" where orderid="+ordid;
		try {
			stmt.executeUpdate(sqlStr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public  void insert(int userid,String orderdate,int totalprice,int status){
		sqlStr="insert into orders (userid,orderdate,totalprice,status)"+"values('"+userid+"','"+orderdate+"','"+totalprice+"','"+status+"')";
		try {
			stmt.executeUpdate(sqlStr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public int selectorderid(int userid,String orderdate){
		int orderid=0;
		sqlStr = "select orderid from orders where orders.userid='"+userid+"' and orders.orderdate = '"+orderdate+"'";
		try {
			rs=stmt.executeQuery(sqlStr);
			while(rs.next()){
			orderid = rs.getInt("orderid");
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return orderid;
	}
	
	public  void insert(int orderid, int userid,String orderdate,int totalprice,int status){
		sqlStr="insert into orders (orderid,userid,orderdate,totalprice,status)"+"values('"+orderid+"','"+userid+"','"+orderdate+"','"+totalprice+"','"+status+"')";
		try {
			stmt.executeUpdate(sqlStr);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public int query_orderid(String id){
		int userinfo=0;
		System.out.println(id);
		sqlStr="select orderid from orders where userid='"+id+"'";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			
			while(rs.next()){
				userinfo=rs.getInt("orderid");
				
			}
			rs.close();
			return userinfo;	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	
	}


	public Vector query(String username){
		Vector userinfo=new Vector();
		sqlStr="select orders.* from orders,reguser where username='"+username+"' and orders.userid=reguser.userid";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			while(rs.next()){
				orders usinfo=new orders();
				
				usinfo.setOrderid(rs.getInt("orderid"));
				usinfo.setOrderdate(rs.getDate("orderdate"));
				usinfo.setTotalprice(rs.getInt("totalprice"));
				usinfo.setStatus(rs.getInt("status"));
				
				userinfo.addElement(usinfo);
			}
			rs.close();
			return userinfo;	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
			}
		}
	public Vector query(){
		Vector userinfo=new Vector();
		sqlStr="select * from orders";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			while(rs.next()){
				orders usinfo=new orders();
				
				usinfo.setOrderid(rs.getInt("orderid"));
				usinfo.setOrderdate(rs.getDate("orderdate"));
				usinfo.setTotalprice(rs.getInt("totalprice"));
				usinfo.setStatus(rs.getInt("status"));
				
				userinfo.addElement(usinfo);
			}
			rs.close();
			return userinfo;	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
			}
		}
	public String query_name(int orderid){
		String username="";
		sqlStr="select distinct username from orders,reguser where orders.userid=reguser.userid and orderid=' "+orderid+"'";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			while(rs.next()){
				username=rs.getString("username");
			}
			rs.close();
			return username;	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
			}
		}
	public int delete_user(int userid){
		
		sqlStr="delete from orders where userid= "+userid;
		System.out.print(sqlStr);
		try {
			
			int b=stmt.executeUpdate(sqlStr);
			stmt.close();
			return b;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
			}
		}
	public int delete(int orderid){
		String sqlStr2="delete from mail where orderid= "+orderid;
		String sqlStr1="delete from lineitem where orderid= "+orderid;
		sqlStr="delete from orders where orderid= "+orderid;
		
		System.out.print(sqlStr1);
		System.out.print(sqlStr);
		try {
			int c=stmt.executeUpdate(sqlStr2);
			int a=stmt.executeUpdate(sqlStr1);
			int b=stmt.executeUpdate(sqlStr);
			stmt.close();
			System.out.print(a+b+c);
			return a+b+c;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
			}
		}

	
}
