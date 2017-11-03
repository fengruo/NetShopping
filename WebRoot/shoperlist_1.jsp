<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.cz.lineitemCZ,com.bean.goodsinfo.*" %>
<%
String user_name_1=(String)session.getAttribute("username");
if(user_name_1==null||user_name_1.equals("")){
	response.sendRedirect("index.jsp");
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script type="text/javascript">
function tc() {
	if(confirm("是否退出？"))
	{
		window.location.href="index.jsp";
	}
}
</script>
  <head>
 
    <title>My JSP 'shoperlist.jsp' starting page</title>
  </head>
  
  <body>
  
	   <jsp:include flush="true" page="head.jsp"></jsp:include>
	   <center>
			<table width="592" border="0" cellspacing="1" cellpadding="1">
			  <tr>
			      <td width="120">亲爱的<b style="color: red;"><%=session.getAttribute("username") %></b>您好！</td>
      <td width="40"><a href="index_2.jsp">首页</a></td>
      <td width="80"><a href="goodslist.jsp?egoryid=0">在线购物</a></td>
      <td width="80"><a href="shoperlist.jsp?loggg=1">我的订单</a></td> 
      <td width="80"><a href="shoperlist.jsp?loggg=2" >用户信息</td>
	  <td width="80"><a href="javascript:tc()" >退出登陆</a></td>
			  </tr>
			</table>
		
	   <table border="0">
	   <td width="186" height="280">
	   <img src="images/u.gif" width="186" ></td>
	   
	  
	   <td width="406" style="text-align: center;">
	 <b>您购买的商品在这里</b>
	  <table align="center" border="1" style="text-align: center;">
	  		
		    <tr>
		    	<td>订单编号</td>
		    	<td>商品名称</td>
		    	<td>商品编号</td>
		    	<td>商品数量</td>
		    	<td>商品价格</td>
		    	<td>操作</td>
		    </tr>
			   <%
				  lineitemCZ linecz=new lineitemCZ();
				  Vector vector=new Vector();
				  
				   vector=linecz.query((String)session.getAttribute("username"));
				  
				  
				  //lineitemCZ linecz2=new lineitemCZ();
				 // Vector vector2=new Vector();
				  //vector2=linecz2.query_name("1");
				  
				  lineitem linetemBean=new lineitem(); 
				  my_goods my_goodsBean=new my_goods();
				  
				 if(vector!=null&&vector.size()!=0){
				 
					for(int i=0;i<vector.size();i++){
					
						linetemBean=(lineitem)vector.elementAt(i);
						//my_goodsBean=(my_goods)vector2.elementAt(i);
						
				%>  
			<tr>
				<td><%= linetemBean.getOrderid()%></td>
				<td><%=linecz.query_goodsname(linetemBean.getGoodsno())
				//=my_goodsBean.getGoodsName()
					 %></td>
				<td><%=linetemBean.getGoodsno()%></td>
				<td><%=linetemBean.getQuantity() %></td>
				<td><%=linetemBean.getUnitprice() %></td>
				<td><a href="userorddel.jsp?orderid=<%=linetemBean.getOrderid()%>&GoodsNo=<%=linetemBean.getGoodsno() %>">删除</td>
			</tr>
				<%
					}
					}
			   	%>
	   </table>
	   </td>
	   </table>
	   </center>
	  <jsp:include flush="true" page="foot.jsp"></jsp:include>
  </body>
</html>
