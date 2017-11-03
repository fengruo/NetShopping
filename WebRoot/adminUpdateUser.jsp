<%@page import="com.bean.cz.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page language="java" import="java.util.*,com.bean.goodsinfo.*" contentType="text/html; charset=utf-8"%>
<%
String user_name_1=(String)session.getAttribute("adminname");
if(user_name_1==null||user_name_1.equals("")){
	response.sendRedirect("index.jsp");
}
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminUpdateUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="text-align: center;">
   <center>
     <%
     request.setCharacterEncoding("utf-8"); 
          String id=request.getParameter("id");
          System.out.print(id);
         adminCZ re=new adminCZ();
        
         Vector ve=re.queryId(id);
         reguser reg=new reguser();
         for (int i=0;i<ve.size();i++)
         {
            reg=(reguser)ve.elementAt(i);
            }
         %>
             <form  action="" method="post">
             <table >
            
            
                   <tr><td>用户名</td>   <td><input type="text" name="username" value=<%=reg.getUsername() %>></td></tr>
                   <tr><td>密码</td>    <td><input type="text" name="password" value=<%=reg.getPassword() %>></td></tr>
                    <tr> <td>性别</td>  <td><input type="text" name="sex" value=<%=reg.getSex() %>></td></tr>
                 
                <tr> <td>电话</td> <td><input type="text" name="phone" value=<%=reg.getPhone()%>></td></tr>
                  <tr><td>地址</td> <td><input type="text" name="address" value=<%=reg.getAddress() %>></td></tr>
                  
            
              <tr><td></td><td><input type="submit" name="submit" value="提交">  <input type="reset"  value="重置"></td></tr>
             </table>
             </form>
              
         <%    
         //System.out.print("***************************");
         if(request.getParameter("submit")==null){}else{
         %>
         <jsp:useBean id="user" class="com.bean.goodsinfo.reguser"></jsp:useBean>
         <jsp:setProperty property="*" name="user"/>
         <% 
         request.setCharacterEncoding("utf-8"); 
       /*  String user2 =request.getParameter("username");
       
        String password =request.getParameter("password");
        String sex=request.getParameter("sex");
        String phone=request.getParameter("phone");
        String address=request.getParameter("address"); */
     System.out.print("####***********######"+user.getSex()+user.getPassword());
        int a=  re.update(id,user.getUsername(), user.getPassword(),user.getSex(),user.getPhone(), user.getAddress());
       if(a!=0)
       {
          out.print("<script type=\"text/javascript\">alert(\"修改成功\"); window.location.href=\"admin.jsp?lol=4\"; </script>");
         
       }
       
       else 
       
       {
        out.print("修改失败！");
       }
      
       }
      %> 
      </center>
  </body>
</html>
