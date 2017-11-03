<%@ page language="java" import="java.util.*,com.bean.cz.reguserCZ,com.bean.goodsinfo.reguser" contentType="text/html; charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="com.bean.goodsinfo.reguser" />
<jsp:setProperty property="*" name="user"/>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Login.jsp' starting page</title>
    
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
  	<jsp:include flush="true" page="head.jsp"></jsp:include>
    <%
    
    
    	reguserCZ a=new reguserCZ();
    	int log=a.query(user.getUsername(),user.getPassword());
    	if(log<1){	
    	out.print("<script type=\"text/javascript\">alert(\"登陆失败，请重新登录！\"); window.location.href=\"index.jsp\"; </script>");
    		}else{
    		session.setAttribute("username",user.getUsername());
    		session.setAttribute("userid", user.getUserid());
 			out.print("<script type=\"text/javascript\"> window.location.href=\"shoperlist.jsp?loggg=1\"; </script>");
    		 	}
    			
     %>
     <jsp:include flush="true" page="foot.jsp"></jsp:include>
  </body>
</html>
