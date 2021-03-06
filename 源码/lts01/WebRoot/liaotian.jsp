<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if((bishe.model.User)session.getAttribute("user")==null){
	response.sendRedirect("login.jsp");
	return;
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--  
<meta http-equiv="refresh"   content="5;url=<%=basePath%>liaotian.jsp"> 
-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<style type="text/css">

</style>

<script type="text/javascript">
    var req;
   
    function shanxuan(){//当第一个下拉框的选项发生改变时调用该函数
    	

      var now = new Date();
      var url = "method!messagelist?t="+now.getTime();
      if(window.XMLHttpRequest){
        req = new XMLHttpRequest();
      }else if(window.ActiveXObject){
        req = new ActiveXObject("Microsoft.XMLHTTP");
      }
      if(req){
        //指定回调函数为callback
      	req.onreadystatechange = callback;
        req.open("GET",url,true);
        req.send(null);
      }
    }
    //回调函数
    function callback(){
      if(req.readyState ==4){
        if(req.status ==200){
 
        document.getElementById('divvaule').innerHTML=req.responseText;
        
        var div = document.getElementById('divvaule'); 
        div.scrollTop = div.scrollHeight; 
        
        
 		setTimeout("shanxuan()", 1000);
        }else{
          alert("不能得到描述信息:" + req.statusText);
        }
      }
    }
       


function scrollWindow() { 
scroll(0, 100000);   
setTimeout('scrollWindow()', 500); 
} 
window.onload = function() { scrollWindow();} 

</script>




</head>

<body  onload="shanxuan()">





<div id="divvaule" style="overflow:scroll; height: 400px; width: 1150px; border: 1px solid #999;"> </div> 


</body>
</html>