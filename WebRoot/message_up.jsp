<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.bean.goodsinfo.*,com.bean.cz.*" %>

<% request.setCharacterEncoding("utf-8"); %>
		<jsp:useBean id="mess" class="com.bean.goodsinfo.message"></jsp:useBean>
		<jsp:setProperty property="*" name="mess"/>
		<%
		messageCZ mage=new messageCZ();
		int a =mage.insert(new String(mess.getTitle().getBytes("ISO-8859-1"),"UTF-8"),new String(mess.getContent().getBytes("ISO-8859-1"),"UTF-8"),(new java.util.Date()).toLocaleString(),(String)(session.getAttribute("username")));
		if(a==1){
			out.println("<script >alert(\"留言成功！\"); window.location.href=\"message_input.jsp?lybid=2\";</script>");
		}
		%>