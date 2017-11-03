package com.bean.cz;

import java.sql.SQLException;
import java.util.Vector;

import com.bean.DataBase;
import com.bean.goodsinfo.reguser;

public class reguserCZ extends DataBase {
	public int delete(String  id){
		sqlStr="delete from reguser where userid= '"+id+"'";
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

	public int queryID(String username){
		int a=0;
		sqlStr="select userid from reguser where username ='"+username+"'";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			if(rs.next()){
				a=rs.getInt("userid");
			}else{
				
				a=0;
			}
			rs.close();
			return a;	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
			}
		}
	public Boolean query_name(String username){
		Boolean a=null;
		sqlStr="select username from reguser where username ='"+username+"'";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			if(rs.next()){
				a=true;
			}else{
				
				a=false;
			}
			rs.close();
			return a;	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
			}
		}
	public Vector query(String username){
		Vector userinfo=new Vector();
		sqlStr="select * from reguser where username ='"+username+"'";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			
			while(rs.next()){
				reguser usinfo=new reguser();
				usinfo.setUserid(rs.getInt("userid"));
				usinfo.setUsername(rs.getString("username"));
				usinfo.setPassword(rs.getString("password"));
				usinfo.setSex(rs.getString("sex"));
				usinfo.setPhone(rs.getString("phone"));
				usinfo.setAddress(rs.getString("address"));
				usinfo.setRegtime(rs.getDate("regtime"));
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
	public int query(String username,String password){
		int userid=0;
		sqlStr="select * from reguser where username ='"+username+"' and password='"+password+"'";
		System.out.print(sqlStr);
		try {
			
			rs=stmt.executeQuery(sqlStr);
			while(rs.next()){
				userid=rs.getInt("userid");
			}
			rs.close();
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
			}
		return  userid;
	}	
	public void insert(String username, String password, String sex, String phone, String address,String regtime ) {
		sqlStr = "insert into reguser(username,password,sex,phone,address,regtime)"+"values('"+username+"','"+password+"','"+sex+"','"+phone+"','"+address+"','"+regtime+"')";
		System.out.println(sqlStr);
		try {
			stmt.executeUpdate(sqlStr);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public int update( String username ,String password  ,String phone , String address  )
	{
		sqlStr ="update  reguser set password='"+password+"',phone='"+phone+"',address='"+address+"' where username ='"+username+"'";
		System.out.println(sqlStr);
		try {
			int ins=stmt.executeUpdate(sqlStr);
			return ins;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
	public Vector query_all(String username){
		Vector userinfo=new Vector();
		sqlStr="select * from reguser where username ='"+username+"'";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			
			while(rs.next()){
				reguser usinfo=new reguser();
				usinfo.setUserid(rs.getInt("userid"));
				usinfo.setUsername(rs.getString("username"));
				usinfo.setPassword(rs.getString("password"));
				usinfo.setSex(rs.getString("sex"));
				usinfo.setPhone(rs.getString("phone"));
				usinfo.setAddress(rs.getString("address"));
				usinfo.setRegtime(rs.getDate("regtime"));
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
	public Vector query_all(int id){
		Vector userinfo=new Vector();
		sqlStr="select * from reguser where userid ='"+id+"'";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			
			while(rs.next()){
				reguser usinfo=new reguser();
				usinfo.setUserid(rs.getInt("userid"));
				usinfo.setUsername(rs.getString("username"));
				usinfo.setPassword(rs.getString("password"));
				usinfo.setSex(rs.getString("sex"));
				usinfo.setPhone(rs.getString("phone"));
				usinfo.setAddress(rs.getString("address"));
				usinfo.setRegtime(rs.getDate("regtime"));
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
	public Vector query_adimin(){
		Vector userinfo=new Vector();
		sqlStr="select * from reguser ";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			
			while(rs.next()){
				reguser usinfo=new reguser();
				usinfo.setUserid(rs.getInt("userid"));
				usinfo.setUsername(rs.getString("username"));
				usinfo.setPassword(rs.getString("password"));
				usinfo.setSex(rs.getString("sex"));
				usinfo.setPhone(rs.getString("phone"));
				usinfo.setAddress(rs.getString("address"));
				usinfo.setRegtime(rs.getDate("regtime"));
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

}
