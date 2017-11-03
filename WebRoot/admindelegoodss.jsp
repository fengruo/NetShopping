<%@ page language="java" import="java.util.*,com.bean.cz.*,com.bean.goodsinfo.*" contentType="text/html; charset=utf-8"%>
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
    
    <title>My JSP 'admindelegoodss.jsp' starting page</title>
    
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
    <%
    my_goodsCZ m=new my_goodsCZ();
 	//String GoodsNo=request.getParameter("GoodsNo");
 	//out.print(GoodsNo);
	m.declete_goodsno(request.getParameter("GoodsNo"));
	out.print("<script type=\"text/javascript\"> window.location.href=\"admin.jsp?lol=1\"; </script>");
    
    
     %>
  </body>
</html>
