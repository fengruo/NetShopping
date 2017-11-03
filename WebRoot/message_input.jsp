<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script>
function tc() {
	if(confirm("是否退出？"))
	{
		window.location.href="index.jsp";
	}
}
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'message_input.jsp' starting page</title>
    
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
  	<jsp:include page="head.jsp"></jsp:include>
  	<table align="center"  width="582px" height="370" style="text-align: center">
  	<tr>
  	<td width="192px" height="370" valign="top" bgcolor="cyan">
  	<h2>留言簿</h2>
  	
  	<%

  	if(session.getAttribute("username")==null)
  	{
  	%>
  	<p><a href="message_input.jsp?lybid=1">查看留言</a></p>
  	<p><a href="index.jsp">用户登录</a></p>
  	<%
  	}else{
  	%>
  	<p><%=session.getAttribute("username") %>,欢迎你</p>
  	<p><a href="message_input.jsp?lybid=1" >查看留言</a></p>
  	<p><a href="message_input.jsp?lybid=2">发布留言</a></p>
  	<p><a href="javascript:tc()" >退出登陆</a></p>
  	<%
  	}
  	 %>
  	
  	
  	</td>
  	<td width="390px"  >
  	<%
  	String lybid=request.getParameter("lybid");
  	if(lybid==null){
  	out.print("<h1 style=\"color: blue\">欢迎进入留言簿系统！</h1>");
  	}else if(lybid.equals("1")){
  		%>
  		<jsp:include page="message_select.jsp"></jsp:include>
  		<% 
  	}else if(lybid.equals("2")){
  		%>
  		<jsp:include page="uplodMessage.jsp"></jsp:include>
  		<% 
  	}
  	 %>
  	
  	
  	
  	</td>
  	</tr>
  	</table>
  	<jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
