<%@ page language="java" import="java.util.*,com.bean.goodsinfo.*,java.sql.*,com.bean.splitPage" contentType="text/html; charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
 <script type="text/javascript">

  function Check(i) {
 // window.event.returnValue=true;
 	alert('留言内容为：'+i);
    //document.argform.submit();
    //document.getElementById("argsubmit").click();
	}	
  </script>
<jsp:useBean id="pages" scope="page" class="com.bean.splitPage"/>

<%!	
	//每页显示的记录数
	int pageSize = 5;
	String sqlStr ="select message.id,title,content,time,username from message,reguser where reguser.userid=message.userid";
	
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
    		<p><h2>留言列表</h2></p>
    		<table  border="1" cellspacing="0" cellpadding="0" style="text-align: center">
    			<tr>
    			<td>ID</td>
  				<td>标题</td>
  				<td>留言时间</td>
  				<td>留言人</td>
    			</tr> 
    			<% 
			for(int i=0;i<vData.size();i++)
			{ 
				//显示数据
				String[] sData=(String[])vData.get(i);
		%>
				<tr> 
					<td style="width: 14%"><%=sData[0]%></td> 
					<td style="width: 30%"><a href=" javascript:;" onclick="javascript:Check('<%=sData[2]%>')"><%=sData[1]%></a></td> 
					<td style="width: 30%"><%=sData[3]%></td> 
					<td style="width: 26%"><%=sData[4]%></td>  
				</tr> 	
					
		<%
			}
		%>
		</table>
		<form action="message_input.jsp?lybid=1" method="post" target="_self">	
			共<font color=red><%=pages.getRowCount()%></font>条&nbsp;
			<%=pageSize%>条/页
			第<font color=red><%=showPage%></font>页/共<font 
color=red><%=pages.getPageCount()%></font>页 
<br>
			<a href="message_input.jsp?lybid=1&showPage=1" target="_self">[首
页]</a>		

			<%
				//判断"上一页"链接是否要显示
				if(showPage > 1)
				{				
			%>
					<a 
href="message_input.jsp?lybid=1&showPage
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
href="message_input.jsp?lybid=1&showPage
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
href="message_input.jsp?lybid=1&showPage
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