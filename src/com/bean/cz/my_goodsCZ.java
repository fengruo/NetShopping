package com.bean.cz;

import java.sql.SQLException;
import java.util.Vector;

import com.bean.DataBase;
import com.bean.goodsinfo.my_goods;

public class my_goodsCZ extends DataBase {
	
	 public int update ( String GoodsNo,String goodsName ,String egoryid,String content,float unitprice ,int amount  ,int Leav_number,String  regTime )
	 {
		 sqlStr="update  my_goods set GoodsName='"+goodsName+"',egoryid="+egoryid+",Content='"+content+"',unitprice="+unitprice+",Amount="+amount+", Leav_number="+Leav_number+", RegTime='"+regTime+"'where goodsNo='"+GoodsNo+"'";
		   System.out.println(sqlStr);
		 try {
		int goodsNumber=	stmt.executeUpdate(sqlStr);
		return   goodsNumber;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			 return 0;
		}
		
	 }

	 public Vector query_googsNo(String goodsNo){
			Vector my_goodsinfos=new Vector();
			sqlStr="select * from my_goods where goodsNo='"+goodsNo+"'";
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
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
				}
			}

	public void declete_goodsno(String GoodsNo){
		
		sqlStr="delete from my_goods where GoodsNo='"+GoodsNo+"'";
		System.out.print(sqlStr);
		try {
			stmt.executeUpdate(sqlStr);
			stmt.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			}
		}
	 public int insert (String goodsNo ,String goodsName ,String egoryid,String content, String unitprice ,String   amount  ,String  regTime )
	 {
		 sqlStr="insert into my_goods set GoodsNo='"+goodsNo+"',GoodsName='"+goodsName+"',egoryid='"+egoryid+"',Content='"+content+"',unitprice='"+unitprice+"',Amount='"+amount+"', RegTime='"+regTime+"'";
		   System.out.println(sqlStr);
		 try {
		int goodsNumber=	stmt.executeUpdate(sqlStr);
		return   goodsNumber;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			 return 0;
		}
		
	 }
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
				return my_goodsinfos;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
				}
			}
		public String query_egoryname(String egoryid){
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
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
				}
			}
}
