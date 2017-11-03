<%@ page language="java" import="java.util.*,com.bean.cz.adminCZ,com.bean.goodsinfo.adminuser" contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<html>

<script type="text/javascript">
function check(){
   var name = document.getElementById("username").value;
   var pwd = document.getElementById("passwd").value;
   if(name ==  null || name == ''||pwd ==  null || pwd == ''){
        alert("输入不能为空！");
        return false;
   }
   return true;
}
</script>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  <head>
    
    <title>My JSP 'adminlogin.jsp' starting page</title>
    

  </head>
  
  <body>
     <jsp:include flush="true" page="head.jsp"></jsp:include>
	    <center>
			<table width="592" border="0" cellspacing="1" cellpadding="1">
			  <tr>
			      <td width="100"><br/></td>
			      <td width="100"><a href="index.jsp">首页</a></td>
			       <td width="100"><a href="reg.jsp">用户注册</a></td>
				  <td align="right">当前时间:<br><jsp:include page="sj.jsp"></jsp:include></td>
			  </tr>
			</table>
		</center>
		
		
		 
	<form name = "form" action="" method = "post" onsubmit="return check()">
	<!--  
	<input type = "hidden" name = action value=login><!-- 该隐含字段意为：因为是提交到自身，所以要区别是提交过来的还是访问自身的 -->
	
	<table style="height: 280px;" border="0" width = "592" align="center" border="0" cellpadding="2" cellspacing="2">
		<tr><td><table border="0">
		<tr >
			<td colspan="2" align="center"><h2>管理员登陆</h2></td>
			
		</tr>
		<tr>
			<td width = "250" style="text-align: right;"><b>用户名:</b></td>
			<td width = "342" style="text-align:left;">
				<input type="text" id="username" name="adminname" size="30" maxlength="10" style="width: 140px;text-align: center;">
				<div id = usermsg></div>
			</td>
		</tr>
		<tr>
			<td width = "250" style="text-align: right;"><b>密码：</b></td>
			<td width = "342" style="text-align:left;"><input type="password" id="passwd" name="adminpwd" size="15" maxlength="12" style="width: 140px;text-align: center;"/></td>
		</tr>
		<tr>
			
			<td colspan="2" style="text-align: center;">
				<input type="submit" name="submit"  value="登陆"/>
				<input type="reset" value="重置"/>
			</td>
		</tr>
		</table>
		</td></tr>
	</table>
	</form>
	
	
<%

	if(request.getParameter("submit")!=null){ 	
	
	adminCZ ad=new adminCZ();
	int log_ad=0;
	log_ad=ad.query(request.getParameter("adminname"),request.getParameter("adminpwd") );
	if(log_ad==1){
		session.setAttribute("adminname", request.getParameter("adminname"));
    	out.print("<script type=\"text/javascript\"> window.location.href=\"admin.jsp?lol=0\"; </script>");
	}else{
	//	subad="";
		out.print("<script type=\"text/javascript\">alert(\"登陆失败，请核对用户名密码！\"); </script>");
	}
	}
	//}
	 %>
     <jsp:include flush="true" page="foot.jsp"></jsp:include>
  </body>
</html>
