<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft FrontPage 4.0">
<TITLE>网络聊天室</TITLE>
</HEAD>
<BODY bgcolor="#ddddff" >
<Div align=Center>
<BR><BR>
<P><h1><font color=red>网络聊天室</font></h1><BR>
<FORM action="method!login" method="post" name="Login" >
昵 称：<INPUT name="username" maxlength="10"><BR> 
密 码：<INPUT name="password" type="password" maxlength="10"><BR> 
<BR> 
<INPUT name="submit" type="submit" value="进入聊天室"> 
</FORM> 
<p align='center'> 
当前在线 <font color=red>${zaixianrenshu }</font> 人<BR> 

<BR> 
<BR> 
<a href="register.jsp" >新用户注册</a> 
<a href="method!userlist" target="_blank">在线用户名单</a> 
</p> 

</BODY> 
</HTML> 
