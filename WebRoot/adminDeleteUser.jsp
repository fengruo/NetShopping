<%@ page language="java" import="java.util.*,com.bean.cz.*,com.bean.goodsinfo.*" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
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
    
    <title>My JSP 'adminDeleteUser.jsp' starting page</title>
    
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
      <% 
     
      String   id= request.getParameter("id");
         Vector ve=new Vector();
             ordersCZ ord=new ordersCZ();
           orders order=new orders();
           int  b=ord.query_orderid(id);
              // out.print( orderid);
            
              
           /*    for (int i=0;i<ve.size(); i++)
             {
                order=(orders)ve.elementAt(i);
             int  orderid=  order.getOrderid();
             out.print( order.getOrderid());
     
      
       
           } */
      
     //  out.print(id);    //即orders 中 userid 
      // ordersCZ orde=new ordersCZ();
            //   即lineatem 和mail的orderid
           lineitemCZ line=new lineitemCZ();     
          line.deleteUserinfo(b);       //删除lineitem的信息
          mailCZ  mail=new mailCZ();
          mail.deleteUserinfo( b);        //删除mail信息
          ordersCZ or=new ordersCZ();
          or.delete_user(Integer.parseInt(id) );                //删除orders的信息
          reguserCZ   reg= new reguserCZ();
           int a =  reg.delete(id);
        if (a!=0)
        {
       out.print("<script type=\"text/javascript\">window.location.href=\"admin.jsp?lol=4\";</script>");
        //admin.jsp?lol=4
        }
        else 
        {
       out.print("<script type=\"text/javascript\">alert(\"删除失败！\"); window.location.href=\"admin.jsp?lol=4\";</script>");
        }
       
       %>
     
  </body>
</html>
