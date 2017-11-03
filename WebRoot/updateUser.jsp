
<%@ page language="java"  contentType="text/html; charset=utf-8"%>
<%@page import="com.bean.cz.reguserCZ,java.sql.*"%>
<%@ page import="com.bean.goodsinfo.*,java.util.*" %>
<% request.setCharacterEncoding("utf-8") ;%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
String user_name_1=(String)session.getAttribute("username");
if(user_name_1==null||user_name_1.equals("")){
	response.sendRedirect("index.jsp");
}
%>
<script type="text/javascript">
function tc() {
	if(confirm("是否退出？"))
	{
		window.location.href="index.jsp";
	}
}
</script>
<html>
  <head>
    
    
    <title>My JSP 'updateUser.jsp' starting page</title>
   
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <%--  <script type="text/javascript">
    function check(){
      with(document.all){
if(pwd.value!=repwd.value)
{
alert("你输入两次的密码不正确！请重新输入。")
input1.value = "";
input2.value = "";
}
else document.forms[0].submit();
}
    }
  </script>   --%>
  </head>
  
  <body>
  



<html>
<head>
<title>电子商务　首页</title>
<meta http-equiv="Content-Type" content="textml; charset=utf-8">


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
</table></center>
<center>
<table width="592" border="0" cellspacing="1" cellpadding="1">
<tr>
 <td width="186" height="280">
	   <img src="images/u.gif" width="186" ></td>
<td width="414" align="center">
	
    <h4><b>修改我的个人信息</b></h4> 
   
    
     
     <%
      
  // out.print(session.getAttribute("username"));
   //out.print(session.getAttribute("userid"));
   String userid=(String) session.getAttribute("username");
  //String userid="1";
    reguserCZ reg=new reguserCZ ();
    Vector user_na=reg.query_all(userid);
    reguser user_na1=new reguser();
    for(int i=0;i<user_na.size();i++){
    	user_na1=(reguser)user_na.elementAt(i);
    }
    
     if(request.getParameter("submit")!=null){
     request.setCharacterEncoding("utf-8");
      %>
      <jsp:useBean id="ins" class="com.bean.goodsinfo.reguser"/>
     <jsp:setProperty property="*" name="ins"/>
     
      <% 
      
     int re=reg.update(user_na1.getUsername(), ins.getPassword(), ins.getPhone(), new String (ins.getAddress().getBytes("ISO-8859-1"),"UTF-8"));
      
      if(re!=0)
      {
      
      out.print("<script type=\"text/javascript\"> alert(\"修改成功！\"); window.location.href=\"index_2.jsp\";</script>");
      //out.print(new String (ins.getAddress().getBytes("ISO-8859-1"),"UTF-8"));
      }
      else 
      {out.print("修改失败");}
      }
      %>
     <form action="" methdod="post">
   
     <table >
     <tr><td>用户名</td><td><%=user_na1.getUsername() %></td></tr>
     <tr><td>密码</td><td><input type="password"  id="pwd" name="password" value=<%=user_na1.getPassword() %>></td></tr>
     <tr><td>确认密码</td><td><input type="password" id="repwd" name="pwd" value=<%=user_na1.getPassword() %>></td></tr>
     <tr><td>电话</td><td><input type="text" name="phone" value=<%=user_na1.getPhone() %>></td></tr>
     <tr><td>地址</td><td><input type="text" name="address" value=<%=user_na1.getAddress() %>></td></tr>
     <tr><td></td><td><input type="submit" name="submit" value="提交"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取消"></td></tr>
     </form>
     </table>
    
     </td>

</tr>
</table>
</center>

 <jsp:include page="foot.jsp"></jsp:include>
     
  </body>
</html>
