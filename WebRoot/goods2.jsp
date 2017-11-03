<%@ page language="java" import="java.util.*,com.bean.goodsinfo.*,java.sql.*,com.bean.splitPage" contentType="text/html; charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
 <script type="text/javascript">
  function CheckInput(i) {
 // window.event.returnValue=true;
 
 if(i==0){document.getElementById("numbe0").submit();}
    else if(i==1){document.getElementById("numbe1").submit();}
    	else if(i==2){document.getElementById("numbe2").submit();}
    	else if(i==3){document.getElementById("numbe3").submit();}
    	else if(i==4){document.getElementById("numbe4").submit();}
    //document.argform.submit();
    //document.getElementById("argsubmit").click();
	}	
  </script>
<jsp:useBean id="pages" scope="page" class="com.bean.splitPage"/>
<jsp:useBean id="my_goods" class="com.bean.goodsinfo.my_goods"></jsp:useBean>
<jsp:setProperty property="*" name="my_goods"/>
<%!	
	//每页显示的记录数
	int pageSize = 5;
	String sqlStr = "select * from my_goods";
	
	//当前页
	int showPage=1;
	
	%>
	<%
	String strPage=null;
	//获取跳转到的目的页面
	strPage=request.getParameter("showPage");
	if (strPage==null)
	{
		showPage=1;
	}
	else
	{
		try
		{
			showPage=Integer.parseInt(strPage);
		}
		catch(NumberFormatException e)
		{
			showPage = 1;
		}
		if(showPage<1) 
		{
			showPage=1;
		}
	}
pages.initialize(sqlStr,pageSize,showPage);
	//获取要显示的数据集合
	Vector vData=pages.getPage();
	
	
	 %>
<html>
  <head>
    <title>My JSP 'Student.jsp' starting page</title>
  </head>
  <body>
  <center>
    <%	
    
    		
    		%>
    		<table  border="1" cellspacing="0" cellpadding="0" style="text-align: center">
    			<tr>
    			<td width="70px">商品名</td>
		    	<td width="70px">简介</td>
		    	<td width="40px">价格</td>
		    	<td width="70px">购买数量</td>
		    	<td width="70px">商品剩余</td>
		    	<td width="80px">操作</td>
    			</tr> 
    			<% 
			for(int i=0;i<vData.size();i++)
			{ 
				//显示数据
				String[] sData=(String[])vData.get(i);
		%>
				<tr> 
					<td ><%=sData[1]%></td> 
					<td><%=sData[3]%></td> 
					<td><%=sData[4]%></td> 
					<form name="numbe<%=i%>" method="post" id="numbe<%=i%>"  action="addlineitem.jsp">
				<td><input type="text" name="number"  value="1" style="width: 50px"></td>
				<input type="hidden" id="GoodsNo" name="GoodsNo" value="<%=sData[0]%> ">
				<input type="hidden" id="unitprice" name="unitprice" value="<%=sData[4]%>">
				<input type="submit" value="" style="display:none;" name="argsubmit<%=i%>" id="argsubmit<%=i%>">
					</form>
					<td><%=sData[6]%></td>  
				<td><a href="javascript:;" onclick="javascript:CheckInput(<%=i%>)">加入购物车</a></td>
				</tr> 	
					
		<%
			}
		%>
		</table>
		<form action="goodslist.jsp?egoryid=0" method="post" target="_self">	
			共<font color=red><%=pages.getRowCount()%></font>条&nbsp;
			<%=pageSize%>条/页
			第<font color=red><%=showPage%></font>页/共<font 
color=red><%=pages.getPageCount()%></font>页 
<br>
			<a href="goodslist.jsp?egoryid=0&showPage=1" target="_self">[首
页]</a>		

			<%
				//判断"上一页"链接是否要显示
				if(showPage > 1)
				{				
			%>
					<a 
href="goodslist.jsp?egoryid=0&showPage
=<%=showPage-1%>" target="_self">[上一页]</a>
			<%
				}
				else
				{
			%>
					[上一页]
			<%
				}
				//判断"下一页"链接是否要显示
				if(showPage < pages.getPageCount())
				{				
			%>
					<a 
href="goodslist.jsp?egoryid=0&showPage
=<%=showPage+1%>" target="_self">[下一页]</a>
			<%
				}
				else
				{
			%>
					[下一页]
			<%
				}
			%> 
			<a 
href="goodslist.jsp?egoryid=0&showPage
=<%=pages.getPageCount()%>" target="_self">[尾页]</a>
			<br>转到
			<select name="showPage">
			<%
				for(int x=1;x<=pages.getPageCount();x++)
				{
			%>
					<option value="<%=x%>" <%if(showPage==x) 
out.println("selected");%> ><%=x%></option>
			<%
				}
			%>
			</select>			
			页
			<input  type="submit" name="go" value="提交"/>
		</form>
		<%
			
			
		%>
    </center>		
  </body>
</html>