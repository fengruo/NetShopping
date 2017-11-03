
<%@ page language="java" import="java.util.*,com.bean.cz.*,com.bean.goodsinfo.*" contentType="text/html; charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
String user_name_1=(String)session.getAttribute("adminname");
if(user_name_1==null||user_name_1.equals("")){
	response.sendRedirect("index.jsp");
}
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminuse.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  
   
     <table border="1" style="text-align: center;" align="center">
     <tr><td colspan="6" style="text-align: center;"><b>订单信息查询</b></td></tr>
    <tr><td>订单编号</td><td>用户名</td><td>订单日期</td><td>订单金额</td><td>是否付款</td><td>操作</td></tr>
    <%
  ordersCZ o=new ordersCZ();
  Vector orde=new Vector();
  orders ord_e=new orders();
  orde=o.query();
 if(orde!=null&&orde.size()!=0){
    				for(int i=0;i<orde.size();i++){
    				ord_e=(orders)orde.elementAt(i);
    				int ordid=ord_e.getOrderid();
    				//String user_nm=;
    				%>  
    				<tr><td><%= ord_e.getOrderid()%></td>
    				<td><%=o.query_name(ordid) %></td>
    				<td><%=ord_e.getOrderdate()%></td>
    				<td><%=ord_e.getTotalprice() %></td>
    				<td><%=ord_e.getStatus() %></td>
    				<td><a href="admorddel.jsp?orderid=<%=ord_e.getOrderid() %>">删除</td>
    				</tr>
    				<%
    				}
    		}
   %>
    </table>
    
  </body>
</html>
