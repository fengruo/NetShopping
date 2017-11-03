package com.bean.cz;

import java.sql.SQLException;
import java.util.Vector;

import com.bean.DataBase;
import com.bean.goodsinfo.adminuser;
import com.bean.goodsinfo.reguser;

public class adminCZ extends DataBase {
	public Vector query(String adminname){
		Vector admininfo=new Vector();
		sqlStr="select * from adminuser where adminname ='"+adminname+"'";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			
			while(rs.next()){
				adminuser adinfo=new adminuser();
				adinfo.setAdminname(rs.getString("adminname"));
				adinfo.setAdminpwd("adminpwd");
				admininfo.addElement(adinfo);
			}
			rs.close();
			return admininfo;	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}		
	}
	public int query(String adminname,String adminpwd){
		int us=0;
		sqlStr="select * from adminuser where adminname ='"+adminname+"' and adminpwd='"+adminpwd+"'";
		System.out.print(sqlStr);
		try {
			
			rs=stmt.executeQuery(sqlStr);
			while(rs.next()){
				us=1;
			}
			rs.close();
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
			}
		return  us;
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
	public Vector queryId(String id){
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
	public int update(String id, String username ,String password,String sex  ,String phone , String address  )
	{
		sqlStr ="update  reguser set password='"+password+"',sex='"+sex+"',phone='"+phone+"',address='"+address+"',username ='"+username+"'where userid='"+id+"'";
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

}
