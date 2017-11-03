<%@ page language="java" import="java.util.*,com.bean.cz.ordersCZ,com.bean.goodsinfo.orders" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.cz.mailCZ" %>
<%
String user_name_1=(String)session.getAttribute("username");
if(user_name_1==null||user_name_1.equals("")){
	response.sendRedirect("index.jsp");
}
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
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
    
    <title>My JSP 'shoperlist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="styles.css">
	

  </head>
  
  <body>
  <%
  String logg=request.getParameter("loggg");
 
   %>
  <jsp:include flush="true" page="head.jsp"></jsp:include>
	<center>
	<table width="592" border="0" cellspacing="1" cellpadding="1">
  <tr>
      <td width="120">亲爱的<b style="color: red;"><%=session.getAttribute("username") %></b>您好！</td>
      <td width="40"><a href="index_2.jsp">首页</a></td>
      <td width="80"><a href="goodslist.jsp?egoryid=0">在线购物</a></td>
      <td width="80"><a href="message_input.jsp">留言簿</a></td> 
      <td width="80"><a href="shoperlist.jsp?loggg=2" >用户信息</td>
	  <td width="80"><a href="javascript:tc()" >退出登陆</a></td>
  </tr>
</table></center>
<center>
<table width="592" border="0" cellspacing="1" cellpadding="1">
<tr>
<td width="186" height="280" style="text-align: center;"> 

<%


 if(logg.equals("1"))
 {
 %>
本店商品分类：<marquee direction="up" scrollamount=3>
     
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
	<%
	}
	else{
	%>
	
	<p><a href="updateUser.jsp">修改用户信息</a></p>
	<p><a href="shoperlist_1.jsp">查看购物车</a></p>
	<% 
	}
	 %>
	
</td>
<td width="414" align="center">
<h4 style="text-align: center;color: blue;">您的订单信息</h4>
<table width="388" border="1" cellspacing="1" cellpadding="1" style="text-align: center;">
<%
	ordersCZ o=new ordersCZ();
	mailCZ m=new mailCZ();
	Vector orderinfo=new Vector();
	orders orderin=new orders();
	String user_name1=(String)session.getAttribute("username");
	orderinfo=o.query(user_name1);
	int send_stu=m.query(user_name1);
	
    		
    			
 %>
<tr>
<td>订单编号</td>
<td>订单日期</td>
<td>金额</td>
<td>是否付款</td>
<td>是否发货</td>
<td>操作</td>
</tr>

<%
if(orderinfo!=null&&orderinfo.size()!=0){
    				for(int i=0;i<orderinfo.size();i++){
    				orderin=(orders)orderinfo.elementAt(i);
    				
 %>
 <tr>
<td><%=orderin.getOrderid() %></td>
<td><%=orderin.getOrderdate() %></td>
<td><%=orderin.getTotalprice() %></td>
<td><%
if(orderin.getStatus()==0)
{
	out.print("未付款");
}else{
	out.print("已付款");
}
 %></td>
 <td>
 <% 
if(send_stu==0)
{
	out.print("未发货");
}else{
	out.print("已发货");
}
 %>
 </td>
 <td><a href="userordersdel.jsp?orderid=<%= orderin.getOrderid()%>">删除</td>
</tr>
<%
}
    			}
    			 %>
</table>

</td>

</tr>
</table>
</center>
<%

 %>
<jsp:include flush="true" page="foot.jsp"></jsp:include>
  </body>
</html>
