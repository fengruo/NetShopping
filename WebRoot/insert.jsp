<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="com.bean.cz.*"%>

<jsp:useBean id="user" class="com.bean.goodsinfo.reguser"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'insert.jsp' starting page</title>
  </head>
  
  <body>
	<%
	String regtime = (new java.util.Date()).toLocaleString();
	reguserCZ reg= new reguserCZ();
	//out.print(user.getUsername());
	//out.print(reg.query_name(user.getUsername()));
	if(!reg.query_name(user.getUsername())){
	reg.insert(user.getUsername(),user.getPassword(),user.getSex(),user.getPhone(),user.getAddress(),regtime);
	session.setAttribute("username",user.getUsername());
	out.println("<script type=\"text/javascript\"> window.location.href=\"index_2.jsp\"; </script>");
	}else{
	out.print("<script type=\"text/javascript\">alert(\"用户名已存在，请重新输入！\"); window.location.href=\"reg.jsp\"; </script>");
	}
%>
  </body>
</html>
