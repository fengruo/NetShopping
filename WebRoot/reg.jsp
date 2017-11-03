<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'reg.jsp' starting page</title>
  </head>
 
  <body>
  
  	<jsp:include flush="true" page="head.jsp"></jsp:include>
	    <center>
			<table width="592" border="0" cellspacing="1" cellpadding="1">
			  <tr>
			      <td width="80"><br/></td>
			      <td width="80"><a href="index.jsp">首页</a></td>
			      <td width="80"><a href="goodslist.jsp?egoryid=0">在线购物</a></td>
			      <td  width="100">
        <a href="adminlogin.jsp">管理员登陆</a></td> 
        <td width="80"><a href="#">联系我们</a></td>
				  <td align="right">当前时间:<br><jsp:include page="sj.jsp"></jsp:include></td>
			  </tr>
			</table>
		</center>
  	
  	<h4 align="center">用户注册</h4>
	<jsp:include page="useradduser.jsp"></jsp:include>
<br/>
	<jsp:include flush="true" page="foot.jsp"></jsp:include>
  </body>
</html>
