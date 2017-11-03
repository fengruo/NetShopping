<%@ page language="java" import="java.util.*,com.bean.cz.*,com.bean.goodsinfo.*" contentType="text/html; charset=utf-8"%>
<%
String user_name_1=(String)session.getAttribute("adminname");
if(user_name_1==null||user_name_1.equals("")){
	response.sendRedirect("index.jsp");
}
%>
<%
	my_goodsCZ m=new my_goodsCZ();
 	String GoodsNo=request.getParameter("GoodsNo");
 	//out.print(GoodsNo);
	//m.declete_goodsno(GoodsNo);
	out.print("<script type=\"text/javascript\"> window.location.href=\"admin.jsp?lol=1\"; </script>");

%>