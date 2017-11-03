<%@ page language="java" import="java.util.*,com.bean.cz.*,com.bean.goodsinfo.*" contentType="text/html; charset=utf-8"%>
<%
String user_name_1=(String)session.getAttribute("username");
if(user_name_1==null||user_name_1.equals("")){
	response.sendRedirect("index.jsp");
}
%>
<%
	lineitemCZ l=new lineitemCZ();
 	int ordid=Integer.parseInt(request.getParameter("orderid"));
 	String GoodsNo=request.getParameter("GoodsNo");
 	out.print(ordid+GoodsNo);
	int a=l.delete(ordid, GoodsNo);
	out.print("<script type=\"text/javascript\"> window.location.href=\"shoperlist_1.jsp\"; </script>");
%>