<%@page import="com.bean.cz.reguserCZ,com.bean.goodsinfo.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<style>

td{text-align: center;width: 100px;}
</style>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'queryUsers.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="text-align: center;">
      <table  border="1" cellpadding="0"  align="center" valign="center">
        	<tr><td colspan="7"><b>用户信息</b></td></tr>
          <tr><td>ID</td><td>用户名</td><td>性别</td><td>电话</td><td>地址</td><td>注册时间</td><td>备注</td></tr>
          <% Vector ve=new Vector();
             reguserCZ re=new reguserCZ();
             reguser user=new reguser();
             ve=re.query_adimin();
              for (int i=0;i<ve.size(); i++)
             {
                user=(reguser)ve.elementAt(i);
                
          %>
          <tr><td><%=user.getUserid() %></td><td><%=user.getUsername() %></td><td><%=user.getSex()%></td><td><%=user.getPhone() %></td><td><%=user.getAddress()%></td><td><%=user.getRegtime()%></td><td><a href="admin.jsp?lol=6&id=<%=user.getUserid() %>">修改</a>&<a href="adminDeleteUser.jsp?id=<%=user.getUserid() %>">删除</a></td></tr>
          	
          <%} %>
           
      </table>
     <a  href="admin.jsp?lol=5" style="text-align: center;">添加用户</a>  
  </body>
  
</html>
