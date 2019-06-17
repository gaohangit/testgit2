<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="fm" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript">
function fanhui(){
	window.location.href="index.action";
}
</script>
<script type="text/javascript">
function checktitle(){
	var title=$("#title").val();
	if(title==null||title==""){
		alert("BUG标题不能为空");
		return;
	}
}
function checkusername(){
	var username=$("#username").val();
	if(username==null||username==""){
		alert("报告人不能为空");
		return;
	}
}
</script>


<body>
<!-- 
<form action="add.action" method="post">
 
<h1 align="center">增加BUG</h1>
<p align="center"><span>所属项目</span>
<span><select name="project"><option value="1">图书管理系统</option><option value="2">酒店管理系统</option></select></span>
</p>
<p align="center"><span>严重性</span>
<span><select name="severity"><option value="10">严重错误</option><option value="20">文字错误</option><option value="30">次要做法</option></select></span>
</p>
<p align="center"><span>BUG标题</span><span><input type="text" id="title" name="title" onblur="checktitle()"/></span></p>
<p align="center"><span>报告人</span><span><input type="text" id="username" name="username" onblur="checkusername()"/></span></p>
<p align="center"><span><input type="submit" value="提交"></span><span><input type="button" value="返回" onclick="fanhui()"></span></p>

</form>
-->
<%--@elvariable id="bug" type=""--%>
<fm:form action="add22.action" method="post" modelAttribute="bug">
<h1 align="center">增加BUG</h1>
<p align="center"><span>所属项目</span>
<span>
<fm:select path="projectId">
<fm:option value="1">图书管理系统</fm:option>
<fm:option value="2">酒店管理系统</fm:option>
</fm:select>
</span>
</p>
<p align="center"><span>严重性</span>
<span>
<fm:select path="severity">
<fm:option value="10">严重错误</fm:option>
<fm:option value="20">文字错误</fm:option>
<fm:option value="30">次要错误</fm:option>
</fm:select>
</span>
</p>
<p align="center"><span>BUG标题</span>
<span><fm:input path="title" onblur="checktitle()" id="title"/></span>
<span><fm:errors path="title"></fm:errors></span>
</p>
<p align="center"><span>报告人</span>
<span><fm:input path="reportUser" id="username" onblur="checkusername()"/></span>
</p>
<p align="center">
<span><input type="submit" value="提交"></span>
<span><input type="button" value="返回" onclick="fanhui()"></span></p>
</fm:form>


</body>
</html>