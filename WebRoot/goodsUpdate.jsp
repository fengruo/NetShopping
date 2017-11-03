<%@page import="com.bean.goodsinfo.my_goods"%>
<%@page import="com.bean.cz.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
String user_name_1=(String)session.getAttribute("adminname");
if(user_name_1==null||user_name_1.equals("")){
	response.sendRedirect("index.jsp");
}
%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodsUpdate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body style="text-align: center;" >
  <center>
  <h3>信息修改</h3>
   <%
           String goodsNo=   request.getParameter("GoodsNo");   ///传值
            
             my_goodsCZ   goodsno=new my_goodsCZ();
             my_goods g=new my_goods();
             Vector ve= goodsno.query_googsNo(goodsNo);
             for(int i=0;i<ve.size();i++)
             {
                 g=(my_goods)ve.elementAt(i);
             
             }
         
          %>
           <form action=""  method="post">
          <table >
             <tr><td>商品名:</td><td><input type="text" name="GoodsName" value=<%=g.getGoodsName() %>></td></tr>
             <tr><td>商品类别</td><td>  <select name="egoryid" >
             <% 
             goodsegoryCZ good=new goodsegoryCZ();
           List li=  good.select_lei();
           for (int i=0; i<li.size(); i++)
           {
           %>
           <option  values="<%=i %>"><%=li.get(i) %></option>
           <% 
           }
              %>
             
             
             
             </select>
             
             </td></tr>
             <tr><td>商品介绍：</td><td><input type="text" name="Content" value=<%=g.getContent() %>></td></tr>
             <tr><td>商品价格：</td><td><input type="text" name="unitrince" value=<%=g.getPrince() %>></td></tr>
             <tr><td>商品数量：</td><td><input type="text" name="Amount" value=<%=g.getAmount()%>></td></tr>
             <tr><td>商品剩余：</td><td><input type="text" name="Leav_number" value=<%=g.getLeav_number() %>></td></tr>
             <tr><td>更改时间：</td><td><%=g.getRegTime() %></td></tr>
             <tr><td colspan="2" style="text-align: center;"><input type="submit" name="submit" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset"  value="重置"></td></tr>
             
          </table>
          </form>
       
          <% 
          goodsegoryCZ ge=new goodsegoryCZ();
          
          if(request.getParameter("submit")!=null)
          {
          request.setCharacterEncoding("utf-8");
          System.out.print("****************("+request.getParameter("GoodsName")+")****************");
        String GoodsName= request.getParameter("GoodsName") ;
        System.out.print("****************("+GoodsName+")****************");
        String egoryid=ge.query_egoryid(request.getParameter("egoryid"));
        String Content=  request.getParameter("Content");
        String unitrince=  request.getParameter("unitrince");
        String Amount=  request.getParameter("Amount");
        String Leav_number=  request.getParameter("Leav_number");
       // (new java.util.Date()).
           String regtime = (new java.util.Date()).toLocaleString() ;
          // String regtime ="2016-15-12";
              my_goodsCZ goo=new my_goodsCZ();
            int a=  goo.update(goodsNo,GoodsName,egoryid, Content, Integer.parseInt(unitrince),  Integer.parseInt(Amount), Integer.parseInt(Leav_number),regtime );
            if (a!=0)
            {
            out.print("<script type=\"text/javascript\">alert(\"修改成功！\"); window.location.href=\"admin.jsp?lol=1\"; </script>");
            }
            else 
            {
            out.print("修改失败"); 
            }
             
             
             
             }
    
           
    %>
    </center>
  </body>
</html>
