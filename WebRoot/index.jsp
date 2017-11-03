<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page session="true" %>
<html>
<script type="text/javascript">
function first(){
	alert("请登陆后查看！");
	window.location.href="index.jsp";

}
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
<body  style="padding: 0px;margin: 0px">
<center>



<%
session.removeAttribute("adminname");
session.removeAttribute("username");
session.removeAttribute("time");
 %>
	<jsp:include flush="true" page="head.jsp"></jsp:include>
	<center>
	<table width="592" border="0" cellspacing="1" cellpadding="1" style="background-color: gray;padding: 0px;margin: 0px">
  <tr>
      <td width="100"><br/></td>
      <td width="100"><a href="goodslist.jsp?egoryid=0">在线购物</a></td>
      <td width="100"><a href="message_input.jsp">留言簿</a></td> 
      <td align="center" width="80">
        <a href="adminlogin.jsp">管理员登陆</a></td>
	  <td align="right">当前时间:<br><jsp:include page="sj.jsp"></jsp:include> &nbsp;</td>
  </tr>
</table></center>

  	<center>
  	<table border="0" >
  	<tr style="text-align: center;">
  	<td style="width:200px">
	 <table width="592"  border="0" cellspacing="1" cellpadding="1" >
    <tr style="text-align: center;"> 
      <td width="186">  本店商品分类：<marquee direction="up" scrollamount=3 >
     
        <table width="100%" border="0" cellspacing="1" cellpadding="1">
          <tr>  </tr>	
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
  	<marquee direction="left" scrollamount=3>
	<span style="font-family:KaiTi, "楷体";font-style: 楷体;">请相信，走过流年的山高水长，总有一处风景，会因为我们而美丽；
	总有一个笑脸，是为我们而绽放；总有一份遇见，唯美了整个曾经；
	总会有一个人知你冷暖，懂你悲欢；
	所有相遇的千回百转，为的是来到世上，遇到那个懂你的人；
	所有的过往，都值得我们珍惜。</span>
	</marquee>
	<br/>
	<br/>
	<br/>
	<center><b>新生的太阳</b></center><br/> &nbsp;&nbsp;对世界上的一切学问与知识的掌握也并非难事，只要持之以恒地学习，努力掌握规律，达到熟悉的境地，就能融会贯通，运用自如了。<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; —— 高士其
	<br/><br/><br/>
  	</td>
  	<td style="text-align: center;width:200px;" >
  	<form name="form1" method="post" action="Login.jsp" onsubmit="return check()">
          用户登录 
          <table width="100%" border="0" cellspacing="0" cellpadding="3">
            <tr> 
              <td align="right" width=90px>用户名：</td>
              <td> 
                <input type="text" id="username" name="username" size="10" maxlength="25" style="width:110px">
             </td>
              
            </tr>
            
            <tr> 
              <td align="right"width=90px>密码：</td>
              <td> 
                <input type="password" id="passwd" name="password" size="10" maxlength="25" style="width: 110px">
              </td>
            </tr>
          
            <tr> 
              <td colspan="2" align="center"> 
                <input type="submit" name="Submit" value="登录" >
                <input type="reset" name="Submit2" value="取消" >
              </td>
            </tr>
            <tr style="text-align: center;"> 
              <td colspan="2" >若非本站会员,请<a href="reg.jsp">点此注册</a>。</td>
            </tr>
          </table>
        </form>
        
       <p><img src="images/icon.png" width="100%" height="100%"></p>
        </td>
  	
  	</td>
  	</tr>
  	</table>
  	</center>
 	<jsp:include flush="true" page="foot.jsp"></jsp:include>
  

</center>
</body>
</html>
