<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.cz.*,com.bean.goodsinfo.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String user_name_1=(String)session.getAttribute("username");
if(user_name_1==null||user_name_1.equals("")){
	response.sendRedirect("index.jsp");
}
%>
%>
<html>
  <head>
    <title>My JSP 'addlineitem.jsp' starting page</title>
  </head>
  
  <body>
 		<%
 			
      if(session.getAttribute("username")==null){
     out.print("<script type=\"text/javascript\">alert(\"请注册后购买！\");	window.location.href=\"reg.jsp\";</script>");
      

      }else{
      		String userna=(String)session.getAttribute("username");
      		//out.println(userna);
      		reguserCZ usercz=new reguserCZ();
      		int u_id=usercz.queryID(userna);
      		//out.println(u_id);
 			String GoodsNo = request.getParameter("GoodsNo");
 			int unitprice = Integer.parseInt(request.getParameter("unitprice"));
 			int number =Integer.parseInt(request.getParameter("number"));;
 			
 			ordersCZ ordercz = new ordersCZ();
 			

 			int totalprice = unitprice*number;
 			if(session.getAttribute("time")==null){
 			String time = (new java.util.Date()).toLocaleString();
 			session.setAttribute("time", time);
 			ordercz.insert(u_id,time,0,1);
 			}else{
 			int ordid=ordercz.selectorderid(u_id, (String)session.getAttribute("time"));
 			ordercz.update(ordid,totalprice);
 			}
 			//out.println(ordercz.selectorderid(u_id,time));
 			
 			lineitemCZ lineitemcz = new lineitemCZ();
 			lineitemcz.insert(ordercz.selectorderid(u_id, (String)session.getAttribute("time")),GoodsNo,number,unitprice);
 			response.sendRedirect("shoperlist_1.jsp");
 			}
 			%>

</html>
