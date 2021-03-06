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


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>






</head>

<body background="images/bg2.jpg">

<TABLE border=0 cellspacing=0 cellpadding=0 width="580">
<FORM action="method!messageadd" method="post" name="inputform" target="_top" >
<c:if test="${bean!=null}">
<input type="hidden" name="talktoid" value="${bean.id }"/>
</c:if>
<TBODY><TR><TD colspan="3">
对象
<SELECT name="talkto"  style="WIDTH: 88px;" >
<c:if test="${bean!=null}">
<OPTION value="${bean.truename }">${bean.truename }</OPTION>
</c:if>

<OPTION value="所有人">所有人</OPTION>
</SELECT>
<SELECT name="act" >
	<option value='说话' selected>说话</option>
	<option value='请问'>请问</option>
	<option value='歌颂'>歌颂</option>
	<option value='喝采'>喝采</option>
	<option value='轻笑'>轻笑</option>
	<option value='要求'>要求</option>
	<option value='呻吟'>呻吟</option>
	<option value='牢骚'>牢骚</option>
	<option value='自语'>自语</option>
	<option value='悲叹'>悲叹</option>
	<option value='注意'>注意</option>
	<option value='命令'>命令</option>
	<option value='沉思'>沉思</option>
	<option value='撅嘴'>撅嘴</option>
	<option value='祈祷'>祈祷</option>
	<option value='恳求'>恳求</option>
	<option value='大叫'>大叫</option>
	<option value='唱歌'>唱歌</option>
	<option value='微笑'>微笑</option>
	<option value='发誓'>发誓</option>
	<option value='假笑'>假笑</option>
	<option value='哭啼'>哭啼</option>
	<option value='嘲笑'>嘲笑</option>
	<option value='呜咽'>呜咽</option>
	<option value='哈欠'>哈欠</option>
	<option value='大喊'>大喊</option>
</SELECT>
<SELECT name="color" >
	<option value="0" STYLE="COLOR:black" selected>颜色</option>
	<option style="BACKGROUND:#000088" value="#000088"></option>
	<option style="BACKGROUND:#0000ff" value="#0000ff"></option>
	<option style="BACKGROUND:#008800" value="#008800"></option>
	<option style="BACKGROUND:#008888" value="#008888"></option>
	<option style="BACKGROUND:#0088ff" value="#0088ff"></option>
	<option style="BACKGROUND:#00a010" value="#00a010"></option>
	<option style="BACKGROUND:#1100ff" value="#1100ff"></option>
	<option style="BACKGROUND:#111111" value="#111111"></option>
	<option style="BACKGROUND:#333333" value="#333333"></option>
	<option style="BACKGROUND:#50b000" value="#50b000"></option>
	<option style="BACKGROUND:#880000" value="#880000"></option>
	<option style="BACKGROUND:#8800ff" value="#8800ff"></option>
	<option style="BACKGROUND:#888800" value="#888800"></option>
	<option style="BACKGROUND:#888888" value="#888888"></option>
	<option style="BACKGROUND:#8888ff" value="#8888ff"></option>
	<option style="BACKGROUND:#aa00cc" value="#aa00cc"></option>
	<option style="BACKGROUND:#aaaa00" value="#aaaa00"></option>
	<option style="BACKGROUND:#ccaa00" value="#ccaa00"></option>
	<option style="BACKGROUND:#ff0000" value="#ff0000"></option>
	<option style="BACKGROUND:#ff0088" value="#ff0088"></option>
	<option style="BACKGROUND:#ff00ff" value="#ff00ff"></option>
	<option style="BACKGROUND:#ff8800" value="#ff8800"></option>
	<option style="BACKGROUND:#ff0005" value="#ff0005"></option>
	<option style="BACKGROUND:#ff88ff" value="#ff88ff"></option>
	<option style="BACKGROUND:#ee0005" value="#ee0005"></option>
	<option style="BACKGROUND:#ee01ff" value="#ee01ff"></option>
	<option style="BACKGROUND:#3388aa" value="#3388aa"></option>
	<option style="BACKGROUND:#000000" value="#000000"></option>
</SELECT>
<SELECT	name="font"	>


<OPTION	value="16px">16px</OPTION>
<OPTION	value="17px">17px</OPTION>
<OPTION	value="18px">18px</OPTION>
<OPTION	value="19px">19px</OPTION>
<OPTION	value="20px">20px</OPTION>
<OPTION	value="25px">25px</OPTION>
<OPTION	value="30px">30px</OPTION>
</SELECT>

</TD></TR>
<TR><TD colspan="3">信息


<INPUT name="msg" size="45" maxlength="120" id="msg" type="text">
<INPUT type="submit" value="发 送" name="submit1" class="btnStyle"  onclick="checkform()">
<span class="p9"><A href="method!qingping" target="liaotian">清屏</A>
</span>
</TD></TR></TBODY></FORM></TABLE>




</body>
</html>