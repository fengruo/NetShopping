<%@ page language="java" import="java.util.*,com.bean.goodsinfo.*,java.sql.*,com.bean.splitPage" contentType="text/html; charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
String user_name_1=(String)session.getAttribute("adminname");
if(user_name_1==null||user_name_1.equals("")){
	response.sendRedirect("index.jsp");
}
%>
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
    			<td>商品编号</td>
		    	<td>商品名称</td>
		    	<td>商品类别</td>
		    	<td>商品介绍</td>
		    	<td>商品价格</td>
		    	<td>商品数量</td>
		    	<td>商品剩余</td>
		    	<td>更改时间</td>
		    	<td>操作</td>
		    	<td>操作</td>
    			</tr> 
    			<% 
			for(int i=0;i<vData.size();i++)
			{ 
				//显示数据
				String[] sData=(String[])vData.get(i);
		%>
				<tr> 
					<td ><%=sData[0]%></td> 
					<td ><%=sData[1]%></td>
					<td><%=sData[2]%></td>  
					<td><%=sData[3]%></td> 
					<td><%=sData[4]%></td> 
					<td><%=sData[5]%></td> 
					<td><%=sData[6]%></td> 
					<td><%=sData[7]%></td> 
					<td><a href="admin.jsp?lol=7&GoodsNo=<%=sData[0] %>">修改</td>
				<td><a href="admindelegoodss.jsp?GoodsNo=<%=sData[0] %>">删除</td>
				</tr> 		
		<%
			}
		%>
		</table>
		<form action="admin.jsp?lol=1" method="post" target="_self">	
			共<font color=red><%=pages.getRowCount()%></font>条&nbsp;
			<%=pageSize%>条/页
			第<font color=red><%=showPage%></font>页/共<font 
color=red><%=pages.getPageCount()%></font>页 
<br>
			<a href="admin.jsp?lol=1&showPage=1" target="_self">[首
页]</a>			
			<%
				//判断"上一页"链接是否要显示
				if(showPage > 1)
				{				
			%>
					<a 
href="admin.jsp?lol=1&showPage
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
href="admin.jsp?lol=1&showPage
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
href="admin.jsp?lol=1&showPage
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