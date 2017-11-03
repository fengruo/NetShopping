<%@page import="com.bean.cz.*,com.bean.goodsinfo.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addGoods.jsp' starting page</title>
    
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
        <jsp:useBean id ="goods" class="com.bean.goodsinfo.my_goods"/>
        <jsp:setProperty property="*" name="goods"/>
        <form action="" method="post">
        <table align="center">
        <tr><td style="text-align: center;" colspan="2"><b>添加商品</b></td></tr>
       <tr> <td>商品编号：</td><td><input type="text" name="GoodsNo"></td></tr>
       <tr> <td>商品名称：</td><td><input type="text" name="GoodsName"></td></tr>
      <tr><td>商品类别</td><td>  <select  name="egoryid">
             <% 
             goodsegoryCZ goodss=new goodsegoryCZ();
           List li=  goodss.select_lei();
           for (int i=0; i<li.size(); i++)
           {
           %>
           <option values="<%=i %>"><%=li.get(i) %></option>
           <% 
           }
              %>
             
             
             
             </select>
             
             </td></tr>
       <tr> <td>详情：</td><td><input type="text" name="Content"></td></tr>
       <tr> <td>单价：</td><td><input type="text " name="unitprice"></td></tr>
       <tr> <td>添加数量：</td><td><input type="text" name="Amount"></td></tr>
      
       
       <tr><td></td><td><input type="submit" name="submit" value="提交"> <input  type="reset" value="重置"></td></tr>
        </table>
          
        </form>
         <%
         if(request.getParameter("submit")!=null){ 	
         goodsegoryCZ ge=new goodsegoryCZ();
          String  GoodsNo= request.getParameter("GoodsNo");
          String GoodsName= request.getParameter("GoodsName");
          //String  Egoryid= request.getParameter("egoryid");
            String Egoryid=ge.query_egoryid(request.getParameter("egoryid"));
          String  Content= request.getParameter("Content");
          String  Prince= request.getParameter("unitprice");
        //  String leave_number=request.getParameter("leave_number");
          String Amount= request.getParameter("Amount");
          
            
          String regtime = (new java.util.Date()).toLocaleString();
           my_goodsCZ  good=new my_goodsCZ();
           int a= good.insert(GoodsNo,GoodsName, Egoryid, Content,Prince, Amount,regtime);
           if (a!=0)
           {
            out.print("商品插入成功！");
           }
           else 
           {
            out.print("商品插入失败！");
           }
           }
         %>
     
  </body>
</html>
