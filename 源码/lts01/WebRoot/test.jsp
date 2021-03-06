<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript"> 
function add() {    
var now = new Date();   
var div = document.getElementById('yunxing'); 
div.innerHTML = div.innerHTML + 'time_' + now.getTime() + '<br />'; 
div.scrollTop = div.scrollHeight; 
}
function scrollWindow() { 
scroll(0, 100000);   
setTimeout('scrollWindow()', 200); 
} 
window.onload = function() { scrollWindow();} 
</script>

<div id="yunxing" style="overflow:scroll; height: 100px; width: 400px; border: 1px solid #999;"> </div> 
<input type="button" value="插入一行" onclick="add();">



