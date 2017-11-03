<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="com.bean.cz.*"%>
<%
String user_name_1=(String)session.getAttribute("adminname");
if(user_name_1==null||user_name_1.equals("")){
	response.sendRedirect("index.jsp");
}
%>
<% request.setCharacterEncoding("utf-8"); %>
<html>
<script type="text/javascript">
function tc() {
	if(confirm("是否退出？"))
	{
		window.location.href="index.jsp";
	}
}
</script>
<head>
<meta charset="utf-8">
<title>电子商务管理后台</title>
<style>
body,h1,h2,h3,h4,h5,h6,ul,li{margin:0px;padding:0px;}
h1{text-align:center;background:#090;height:120px;line-height:120px;}

#main{width:1100px;margin:0 auto;}
#main aside{float:left;width:300px;background:#6C0}
#main aside ul li{list-style:none;height:35px;text-align:center;line-height:35px;border-bottom:#060 1px dotted;}
#main aside ul li a{text-decoration:none;font-weight: bold;}
#main article{width:800px;background: #C2F5CB;float:right;}
#main article section{height:325px;}
footer{text-align:center;height:80px;background:#090;line-height:80px;}
</style>
</head>

<body>
   <header>
       <h1>网上商城后台管理系统</h1>
       
   </header>
   <article id="main">
     <aside>
       <nav id="cedaohang">
         <ul>
           <li><a href="admin.jsp?lol=0">首页</a></li>
            <li><a href="admin.jsp?lol=1">商店商品查询</a></li>
            <li><a href="admin.jsp?lol=2">添加商品信息</a></li>
            <li><a href="admin.jsp?lol=3">订单信息查询</a></li>
            <li><a href="admin.jsp?lol=4" >用户信息查询</a></li>
           
            <li><a href="javascript:tc()" >退出登陆</a></li>
         </ul>       
       </nav>
     
     </aside>
     <article>
        <section>
          <h3 style="text-align: center;">信息管理<p><jsp:include page="sj.jsp"></jsp:include></p></h3>
          
          <p style="text-align: center;">
          <%
          String lol=request.getParameter("lol");
          if(lol==null){
          	out.print("<script type=\"text/javascript\"> window.location.href=\"index.jsp\"; </script>");
          }
          else if(lol.equals("0")){
          	out.print("<span style=\"color: red;font-size: 40px\">亲爱的管理员用户，欢迎你！</span> ");
          }else if(lol.equals("1")){
          		%>
          		<jsp:include page="adminselect.jsp"></jsp:include>
          		<%
          }else if(lol.equals("2")){
          		%>
          		<jsp:include page="addGoods.jsp"></jsp:include>
          		<%
          }else if(lol.equals("3")){
          		%>
          		<jsp:include page="adminuse.jsp"></jsp:include>
          		<%
          }else if(lol.equals("4")){
          		%>
          		<jsp:include page="queryUsers.jsp"></jsp:include>
          		<%
          }else if(lol.equals("5")){
          		%>
          		<jsp:include page="adminadduser.jsp"></jsp:include>
          		<%
          }else if(lol.equals("6")){
          		%>
          		<jsp:include page="adminUpdateUser.jsp"></jsp:include>
          		<%
          }else if(lol.equals("7")){
          		%>
          		<jsp:include page="goodsUpdate.jsp"></jsp:include>
          		<%
          }
          
           %>
          
          
          
          
          
          </p>
        </section
        
        >
     </article>
     
   <div style="clear:both"></div>
   
   </article>   
   
   <footer><jsp:include page="foot.jsp"></jsp:include></footer>
</body>
</html>
