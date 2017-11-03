<%@ page language="java" import="java.util.*,com.bean.cz.*,com.bean.goodsinfo.*" contentType="text/html; charset=utf-8"%>

<%
String user_name_1=(String)session.getAttribute("username");
if(user_name_1==null||user_name_1.equals("")){
	response.sendRedirect("index.jsp");
}
%>
<%
	ordersCZ o=new ordersCZ();
 	int ordid=Integer.parseInt(request.getParameter("orderid"));
	//out.print(request.getParameter("orderid"));
	int a=o.delete(ordid);
	//out.print(a);
	out.print("<script type=\"text/javascript\"> window.location.href=\"shoperlist.jsp?loggg=1\"; </script>");
%>