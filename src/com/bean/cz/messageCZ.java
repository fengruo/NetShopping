package com.bean.cz;

import java.sql.SQLException;
import java.util.Vector;

import com.bean.DataBase;
import com.bean.goodsinfo.message;
import com.bean.goodsinfo.reguser;

public class messageCZ extends DataBase{
	public  int insert(String title,String content,String time ,String username){
		int a = 0;
		sqlStr="insert into message set title='"+title+"',content='"+content+"',time='"+time+"',userid=(select userid from reguser where username='"+username+"'),mail=''";
		System.out.print("****-----"+sqlStr);
		try {
			a= stmt.executeUpdate(sqlStr);
			
			return a;
		} catch (SQLException e) {
			e.printStackTrace();
			return a;
		}
	}

	public Vector query_adimin(){
		Vector messages=new Vector();
		sqlStr="select * from message ";
		System.out.print(sqlStr);
		try {
			rs=stmt.executeQuery(sqlStr);
			
			while(rs.next()){
				message mess=new message();
				mess.setId(rs.getInt("id"));
				mess.setTitle(rs.getString("title"));
				mess.setTime(rs.getDate("time"));
				mess.setContent(rs.getString("content"));
				mess.setMail(rs.getString("mail"));
				mess.setUserid(rs.getInt("userid"));
				messages.addElement(mess);
			}
			rs.close();
			return messages;	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	
	}
}
