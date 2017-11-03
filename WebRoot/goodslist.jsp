<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script language="JavaScript" type="text/JavaScript" src="sj.js"></script>
<script language="JavaScript">
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
    
    <title>My JSP 'goodslist.jsp' starting page</title>
    
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
  <center>
    	<jsp:include flush="true" page="head.jsp"></jsp:include>
	<center>
	<table width="592" border="0" cellspacing="1" cellpadding="1">
  <tr>
      
      
      <%
      if(session.getAttribute("username")==null){%>
       
       <td width="60"><b style="color: red;">您好！	</b></td>
       <td width="60"><a href="index.jsp">首页</td>
       <td width="90"><a href="goodslist.jsp?egoryid=0">在线购物</a></td>
       <td width="90"><a href="reg.jsp">用户注册</a></td>
       <td width="90"><a href="#">联系我们</a></td>
       <td align="right" style="text-align: center">当前时间:<br><jsp:include page="sj.jsp"></jsp:include></td>
      <% 
      }else{
       %>
       <td width="60" style="text-align: center;"><b style="color: red;text-align: center;">
      <%=session.getAttribute("username") %></b><br/>
      	欢迎你</td>
      	 <td width="40"><a href="index_2.jsp">首页</td>
      <td width="70"><a href="goodslist.jsp?egoryid=0">在线购物</a></td>
      <td width="70"><a href="shoperlist.jsp?loggg=1">我的订单</a></td> 
      <td width="70"><a href="updateUser.jsp" >修改信息</td>
      <td width="70"><a href="javascript:tc()" >退出登陆</a></td>
	  <td align="right" style="text-align: center">当前时间:<br><jsp:include page="sj.jsp"></jsp:include></td>
  	<%} %>
  </tr>
</table></center>

 <table width="592" border="0" cellspacing="1" cellpadding="1" align="center">
<tr>
<td width="186">  本店商品分类：
<table width="100%" border="0" cellspacing="1" cellpadding="1">
          <tr> 
            <td width="20">&nbsp;</td>
            <td></td>
          </tr>	
          <tr> 
            <td width="20">&nbsp;</td>
            <td><a href="goodslist.jsp?egoryid=1">印刷品</a></td>
          </tr>
          
          <tr> 
            <td width="20">&nbsp;</td>
            <td><a href="goodslist.jsp?egoryid=2">运动商品</a></td>
          </tr>
          	
          <tr> 
            <td width="20">&nbsp;</td>
            <td><a href="goodslist.jsp?egoryid=3">电子商品</a></td>
          </tr>
          
          <tr> 
            <td width="20">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table></marquee>
	 <p>友情链接：</p>
       <p><a href="https://www.taobao.com/"><img src="images/icon1.jpg"  ></a></p>
         <p><a href="http://www.fengshibo.com.cn/"><img src="images/icon2.jpg" ></a></p>
</td>



<td>
<%
		System.out.print("********************");
		 String  gossfl=request.getParameter("egoryid");
		 System.out.print(request.getParameter("egoryid")+"************************");
          if(gossfl==null){
          	out.print("<script type=\"text/javascript\"> window.location.href=\"index.jsp\"; </script>");
          }else if(gossfl.equals("1")){
          	%>
          	 <jsp:include page="goods1.jsp"></jsp:include> 
          	<% 
          }else if(gossfl.equals("2")){
          	%>
          	 <jsp:include page="goods1.jsp"></jsp:include> 
          	<% 
          }else if(gossfl.equals("3")){
          	%>
          	 <jsp:include page="goods1.jsp"></jsp:include> 
          	<% 
          }else if(gossfl.equals("0")){
          	%>
          	 <jsp:include page="goods2.jsp"></jsp:include>
          	 
          	<% 
          }
      
		       
 
 %>



</td>
</tr>
</tale>



<jsp:include flush="true" page="foot.jsp"></jsp:include>
</center>
  </body>
</html>
