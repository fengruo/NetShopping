<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="com.bean.goodsinfo.*,com.bean.cz.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<script>
function check(){
	var tit=document.getElementById("title").value;
	var content=document.getElementById("content").value;
	if(tit==null || tit == '' ||content==null || content == ''  ){
		alert("标题与内容输入不能为空");
		return false;
	}
	return true;


}
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'uplodMessage.jsp' starting page</title>
  </head>
  
  <body>
  
	<form action="message_up.jsp" onsubmit="return check()">

		<table align="center" border="0">
			<tr >
				<td style="text-align:right;font-weight: bold"> 
				标题: 
				</td>
				<td>
				<input type="text" style="width: 250px" name="title" id="title"/>
				</td>
			</tr>
			<tr >
				<td style="text-align:right;font-weight: bold">内容:</td>
				<td>
				<textarea style="height: 170px;width: 250px" name="content" id="content"></textarea>
				</td>
			</tr>
			<tr  >
				<td colspan="2" style="text-align: center">
					<input type="submit" value="提交" name="submit" />
				
					<input type="submit" value="取消" />
				</td>
			</tr>
		</table>
	<%
	
	
	 %>
	
	</form>
	
  </body>
</html>
