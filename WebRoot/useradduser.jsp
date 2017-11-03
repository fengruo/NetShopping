<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% request.setCharacterEncoding("utf-8"); %>
<script type="text/javascript">
 
function pwd() {
	 var pwd1 = document.getElementById("password1").value;
	 var pwd2 = document.getElementById("password2").value;
   	 var username=document.getElementById("username").value;
   	  var sex=document.getElementById("sex").value;
   	   var phone=document.getElementById("phone").value;
   	    var address=document.getElementById("address").value;
   	   if(username!=null&&username!=""&&pwd1!=null&&pwd1!=""&&pwd2!=null&&pwd2!=""&&sex!=null&&sex!=""&&phone!=null&&phone!=""&&address!=null&&address!=""){
   if(pwd1!= pwd2){
        alert("密码不同！");
        return false;
   }else{
   return true;
   }
  }else{
   	alert("输入不能为空！");
       return false;
   }
}

</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminadduser.jsp' starting page</title>
    
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
    <form action="insert.jsp" method="post" onsubmit="return pwd()">
	<h3 align="center">新生的太阳期待你的参与</h3>
	<input type="hidden" name="modify" value="modify" />
	
	<table align="center" border="0">
	<tr></tr>
		
		<tr>
			<td>用户名: </td>
			<td><input type="text" id="username" name="username"  /></td>
		</tr>
		<tr>
			<td>密码: </td>
			<td><input type="password" id="password1" name="password"  /></td>
		</tr>
		<tr>
			<td>确认密码: </td>
			<td><input type="password" id="password2" name="password2"  /></td>
		</tr>
		<tr>
			<td>性别: </td>
			<td>
			<input type="radio" id="sex" name="sex" value="男" /> man
			<input type="radio" id="sex" name="sex" value="女" />Female
			</td>
		</tr>
		<tr>
			<td>联系电话: </td>
			<td><input type="text" id="phone" name="phone" /></td>
		</tr>
		<tr>
			<td>联系地址: </td>
			<td><input type="text" id="address" name="address"  /></td>
		</tr>
		<tr style="text-align: center;">
			<td colspan="2">
			    <input align="center" type="submit" value="提交" />
			    &nbsp;&nbsp;&nbsp;
				<input align="center" type="reset" value="重置" />
			</td>
		</tr>
	</table>
</form>
  </body>
</html>
