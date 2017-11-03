<%@ page contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.util.*,com.bean.cz.*,com.bean.goodsinfo.*" %>
<%@ page session="true" %>
<html>
<%
String user_name_1=(String)session.getAttribute("username");
if(user_name_1==null||user_name_1.equals("")){
	response.sendRedirect("index.jsp");
}
%>
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
function tc() {
	if(confirm("是否退出？"))
	{
		window.location.href="index.jsp";
	}
}
</script>
<body>
	<jsp:include flush="true" page="head.jsp"></jsp:include>
	<center>
	<table width="592" border="0" cellspacing="1" cellpadding="1">
  <tr>
      
      <td width="100"><b style="color: red;"><%=session.getAttribute("username") %></b>您好！</td>
      <td width="100"><a href="goodslist.jsp?egoryid=0">在线购物</a></td>
      <td width="100"><a href="shoperlist.jsp?loggg=1">我的订单</a></td> 
      <td width="80"><a href="updateUser.jsp" >修改信息</td>
      <td width="80"><a href="javascript:tc()" >退出登陆</a></td>
	  <td width="120">当前时间:<br><jsp:include page="sj.jsp"></jsp:include></td>
  </tr>
</table></center>



  	<center>
  	<table border="0" >
  	<tr style="text-align: center;">
  	<td style="width:200px">
	 <table width="592" border="0" cellspacing="1" cellpadding="1">
    <tr style="text-align: center;"> 
      <td width="186">  本店商品分类：<marquee direction="up" scrollamount=3>
     
        <table width="100%" border="0" cellspacing="1" cellpadding="1">
          <tr> 
            <td width="20">&nbsp;</td>
            <td></td>
          </tr>	
          <tr> 
            <td width="20">&nbsp;</td>
            <td><a href="goodslist.jsp?egoryid=1">印刷品</a></td>
          </tr>
          
          <tr> 
            <td width="20">&nbsp;</td>
            <td><a href="goodslist.jsp?egoryid=2">运动商品</a></td>
          </tr>
          	
          <tr> 
            <td width="20">&nbsp;</td>
            <td><a href="goodslist.jsp?egoryid=3">电子商品</a></td>
          </tr>
          
          <tr> 
            <td width="20">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table></marquee>
	 <p>友情链接：</p>
      <p><a href="https://www.taobao.com/"><img src="images/icon1.jpg"  ></a></p>
         <p><a href="http://www.fengshibo.com.cn/"><img src="images/icon2.jpg" ></a></p>
	
  	</td>
  	<td style="width:200px">
	<center>
	<p><img src="images/222.jpg" width="100%" height="100%"></p>
	
	</center>
	
  	</td>
  	<td style="text-align: center;width:200px;" >
  	<%
  	reguserCZ re=new reguserCZ();
  	Vector reinfo=new Vector();
  	reguser res=new reguser();
  	String usename=(String)session.getAttribute("username");
  	reinfo=re.query(usename);
  	if(reinfo!=null||reinfo.size()!=0){
  	for(int i=0;i<reinfo.size();i++){
    				res=(reguser)reinfo.elementAt(i);
  	}
  	}
  	 %>
  	 <div style="border-right:dashed 2px;">
       <table align="center" style="text-align: center;" >
       <tr><td colspan="2"><b>您的信息</b></td></tr>
       <tr><td>用户名:</td><td><%=res.getUsername() %></td></tr>
       <tr><td>性别:</td><td><%=res.getSex() %></td></tr>
       <tr><td>手机:</td><td><%=res.getPhone() %></td></tr>
       <tr><td>地址:</td><td><%=res.getAddress()%></td></tr>
       <tr><td>注册时间:</td><td><%=res.getRegtime() %></td></tr>
       </table> 
       </div>
       <p><img src="images/icon.png" width="100%" height="100%"></p>
        </td>
  	
  	</td>
  	</tr>
  	</table>
  	</center>
 	<jsp:include flush="true" page="foot.jsp"></jsp:include>
  

</body>
</html>
