<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>新用户注册</title>
<%
		response.addHeader("Cache-Control", "no-store, must-revalidate"); 
		response.addHeader("Expires", new java.util.Date().getTime()+"");
		%>
		



		<script language="javascript" type="text/javascript"src="js/jquery.min.js"></script>
		<script language="javascript" type="text/javascript"> 
		
		
		var code ; //在全局 定义验证码
function createCode(){ 
code = "";
var codeLength = 4;//验证码的长度
var checkCode = document.getElementById("checkCode");
checkCode.value = "";

var selectChar = new Array(2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');

for(var i=0;i<codeLength;i++) {
   var charIndex = Math.floor(Math.random()*32);
   code +=selectChar[charIndex];
}
if(code.length != codeLength){
   createCode();
}
checkCode.value = code;
}
		
		

		function checkregisterform(){
		
		var inputCode = document.getElementById("input1").value.toUpperCase();

if(inputCode.length <=0) {
   alert("请输入验证码！");
   return false;
}
else if(inputCode != code ){
   alert("验证码输入错误！");
   createCode();
   return false;
		
		
		
}
	 
	 if (document.getElementById('usernameid').value=="")
	{
		alert("用户名不能为空");
		return false;
	}
	var valid=/^\w+$/;
	if(!valid.test(document.getElementById('usernameid').value)){
		alert("用户名必须是数字、字母或下划线");
		return false;
	}

	if (document.getElementById('passwordid').value=="")
	{
		alert("密码不能为空");
		return false;
	}
	if (document.getElementById('passwordid').value.length<6)
	{
		alert("密码长度必须大于6位");
		return false;
	}
	if (document.getElementById('password2id').value != document.getElementById('passwordid').value)
	{
		alert("确认密码与密码不一致");
		return false;
	}	 
	if (document.getElementById('truenameid').value=="")
	{
		alert("真实姓名不能为空");
		return false;
	}

	if (document.getElementById('phoneid').value=="")
	{
		alert("手机不能为空");
		return false;
	}
	
	valid=/^0?1[3,5,8][0,1,2,3,4,5,6,7,8,9]\d{8}$/;  
	if(!valid.test(document.getElementById('phoneid').value)){
		alert("请输入正确的手机格式");
		return false;
	}
	
	if (document.getElementById('emailid').value=="")
	{
		alert("email不能为空");
		return false;
	}
 


	var reg = new RegExp('^[a-zA-Z0-9]+@[a-zA-Z0-9]+.[a-z][a-z.]{2,8}$');

	if(!reg.test(document.getElementById('emailid').value)){
		alert("请输入正确的email格式");
		return false;
	}
	if (document.getElementById('qqid').value=="")
	{
		alert("qq不能为空");
		return false;
	}
	valid = /^\d{1,20}$/;
	if(!valid.test(document.getElementById('qqid').value)){
		alert("请输入正确的qq格式");
		return false;
	}
	
	
	return true;
	
}




	</script>

	</head>

	<body background="images/bg2.jpg"  onload="createCode();">
		<div align="center">
			
				<div id="Layer1">
					<div id="Layer2">
						<a href="."><span style="font-size: 30px;color: #f4a431;"><br/>网络聊天室</span>
						</a>
					</div>

				<div id="Layer20">
				<div align="center">
				<span style="color: #1880c0;font-weight: bold;font-size: 40px; ">新用户注册</span>
				</div>
				
				<form action="method!register" onsubmit="return checkregisterform()" method="post" >
				
				<table border="1">
				
				<tr>
				<td width="250" background="img/bg7.jpg" height="35">
				用户名：
				</td>
   				<td width="300" background="img/bg7.jpg" height="35">
   					<input type="text" name="username" size="25"  id="usernameid"/>
   				</td>
				</tr>

				<tr>
				<td width="250" background="img/bg7.jpg" height="35">
				密码：
				</td>
   				<td width="300" background="img/bg7.jpg" height="35">
   					<input type="password" name="password" size="25" id="passwordid"/>
   				</td>
				</tr>
				
				
				<tr>
				<td width="250" background="img/bg7.jpg" height="35">
				确认密码：
				</td>
   				<td width="300" background="img/bg7.jpg" height="35">
   					<input type="password" name="password2" size="25" id="password2id"/>
   				</td>
				</tr>
				
				
				<tr>
				<td width="250" background="img/bg7.jpg" height="35">
				真实姓名:
				</td>
   				<td width="300" background="img/bg7.jpg" height="35">
   					<input type="text" name="truename" size="25" id="truenameid"/>
   				</td>
				</tr>
				
				
				<tr>
				<td width="250" background="img/bg7.jpg" height="35">
				性别
				</td>
   				<td width="300" background="img/bg7.jpg" height="35">
   				<select name="xingbie">
   				<option value="男">男</option>
   				<option value="女">女</option>
   				</select>
   					
   				</td>
				</tr>
				
				
				<tr>
				<td width="250" background="img/bg7.jpg" height="35">
				手机
				</td>
   				<td width="300" background="img/bg7.jpg" height="35">
   					<input type="text" name="phone" size="25" id="phoneid" />
   				</td>
				</tr>
				
				<tr>
				<td width="250" background="img/bg7.jpg" height="35">
				email
				</td>
   				<td width="300" background="img/bg7.jpg" height="35">
   					<input type="text" name="email" size="25" id="emailid"/>
   				</td>
				</tr>
				
				<tr>
				<td width="250" background="img/bg7.jpg" height="35">
				qq
				</td>
   				<td width="300" background="img/bg7.jpg" height="35">
   					<input type="text" name="qq" size="25" id="qqid"/>
   				</td>
				</tr>
				
				
				
				
				
				<tr>
				<td width="250" background="img/bg7.jpg" height="35">
				请输入验证码
				</td>
   				<td width="300" background="img/bg7.jpg" height="35">
   					<input type="text" id="input1" size="25"/>
   					
   				</td>
				</tr>
				<tr>
				<td width="250" background="img/bg7.jpg" height="35">
				验证码
				</td>
   				<td width="300" background="img/bg7.jpg" height="35">
   					<input type="text" id="checkCode" class="code" style="width: 55px" size="20"/> <a href="####" onclick="createCode()">看不清楚</a>
   				</td>
				</tr>
				
				
				<tr>
				<td width="250" background="img/bg7.jpg" height="35">
				操作
				</td>
   				<td width="300" background="img/bg7.jpg" height="35">
   					<input type="submit" value="注册" />
   					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   					<input type="reset" value="重置" />
   				</td>
				</tr>
				</table>
				</form>
				</div>
				
				
				
				
			
				



				
	
		</div>
	</body>
	
</html>