<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import ="com.bean.cz.*" %>
<%@ page import ="com.bean.goodsinfo.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'goods1.jsp' starting page</title>
  </head>
  <script type="text/javascript">
  function CheckInput(i) {
 // window.event.returnValue=true;
 
 if(i==0){document.getElementById("numbe0").submit();}
    else if(i==1){document.getElementById("numbe1").submit();}
    	else if(i==2){document.getElementById("numbe2").submit();}
    //document.argform.submit();
    //document.getElementById("argsubmit").click();
	}	
  </script>
  <body>
  <%
  goodsegoryCZ goodsegorycz=new goodsegoryCZ();
  Vector vector=new Vector();
	vector=goodsegorycz.query(request.getParameter("egoryid"));
   %>
	<table align="center" width="430px" border="1" style="text-align: center;" cellpadding="2" cellspacing="0" >
	  		<h3 align="center"><%=goodsegorycz.query_egoryname(request.getParameter("egoryid")) %></h3>
		    <tr>
		    	
		    	<td width="70px">商品名</td>
		    	<td width="70px">简介</td>
		    	<td width="40px">价格</td>
		    	<td width="70px">购买数量</td>
		    	<td width="70px">商品剩余</td>
		    	
		    	<td width="80px">操作</td>
		    </tr>
			   <%
				  
				  
				  
				  my_goods my_goodsBean=new my_goods();
				  
				 if(vector!=null&&vector.size()!=0){
				 
					for(int i=0;i<vector.size();i++){
					
						my_goodsBean=(my_goods)vector.elementAt(i);
				%>  
			<tr>
				
				<td><%= my_goodsBean.getGoodsName()%></td>
				<%-- <td><%=goodsegorycz.query_egoryname(my_goodsBean.getEgoryid())%></td> --%>
				<td><%=my_goodsBean.getContent()%>&nbsp;</td>
				<td><%=my_goodsBean.getPrince()%></td>
				<form name="numbe<%=i%>" method="post" id="numbe<%=i%>"  action="addlineitem.jsp">
				<td><input type="text" name="number"  value="1" style="width: 50px"></td>
				<input type="hidden" id="GoodsNo" name="GoodsNo" value="<%=my_goodsBean.getGoodsNo() %>">
				<input type="hidden" id="unitprice" name="unitprice" value="<%=my_goodsBean.getPrince() %>">
				<input type="submit" value="" style="display:none;" name="argsubmit<%=i%>" id="argsubmit<%=i%>">
				<td><%=my_goodsBean.getLeav_number() %></td>
				
				
			<td><a href="javascript:;" onclick="javascript:CheckInput(<%=i%>)">加入购物车</a></td>
			
			</form>
			</tr>
				<%
				
					}
					}
			   	%>
	   </table>

  </body>
</html>
