package com.bean.cz;

import java.sql.SQLException;

import com.bean.DataBase;

public class mailCZ extends DataBase {
	public  int deleteUserinfo (int  orderid)
	{
		sqlStr="delete from mail where orderid= "+orderid;
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

	public int query(String username){
		int senstatus=0;
		sqlStr="select sendstatus from orders,reguser,mail where username='"+username+"' and orders.userid=reguser.userid and orders.orderid=mail.orderid";
		System.out.print(sqlStr);
		try {
			
			rs=stmt.executeQuery(sqlStr);
			while(rs.next()){
				senstatus=rs.getInt("sendstatus");
			}
			rs.close();
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
			}
		return  senstatus;
	}	
}
