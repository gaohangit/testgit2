<%@page import="bugmanage.bugbase.bug"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
</head>
<script type="text/javascript">
    function add(){
        window.location.href="add.jsp ";
    }
</script>
<body>
<%
Object o= request.getAttribute("list");
List<bug> list=(List<bug>)o;
    %>
    <%
    Object o1=request.getAttribute("type");
    Integer i=0;
    if(o1==null||o1==""){
    i=0;
    }else{
    i=Integer.parseInt(o1.toString());
    }


    %>
    <div style="border:1px;">
        <form action="chakan.action">
            <p align="center"><span style="margin-right:0px;">所属项目</span>
                <span><select name="type">
<option value="0" <% if(i==0){
	%>
	selected="selected"
	<%
} %>>全部</option>
                    <option value="1" <% if(i==1){
	%>
	selected="selected"
	<%
} %>>图书管理系统</option>
                    <option value="2"<% if(i==2){
	%>
	selected="selected"
	<%
} %>>酒店管理系统</option>
</select></span>
                <span><input type="submit" value="查询"></span>
                <span style="margin-left:150px;"><input type="button" value="新增bug" onclick="add();"></span>
            </p></form>
        <h1 align="center">BUG列表</h1>
        <table align="center">
            <tr style="background-color:blue;">
                <td style="margin-right:-20px;">bug编号</td>
                <td style="margin-right:-20px;">严重性</td>
                <td style="margin-right:-20px;">标题</td>
                <td style="margin-right:-20px;">报告人</td>
                <td style="margin-right:-20px;">报告时间</td>
            </tr>

            <%
            for(bug b:list){
            %>
            <tr>
                <td><%=b.getId() %></td>
                <td>
                    <%
                    if(b.getSeverity()==10){
                    %>
                    <%="严重错误 " %>
                    <%
                    }else if(b.getSeverity()==20){
                    %>
                    <%="文字错误" %>
                    <%
                    }else if(b.getSeverity()==30){
                    %>
                    <%="次要错误" %>
                    <%
                    } %>
                </td>

                <td><%=b.getTitle() %></td>
                <td><%=b.getReportUser() %></td>
                <td><%=b.getCreateDate() %></td>
            </tr>

            <%
            }
            %>
        </table>
        <p align="center">
            <span><a href="index.action?yeshu=1">首页</a></span>
            <span><a href="index.action?yeshu=${yeshu-1 }">上一页</a></span>
            <span><a href="index.action?yeshu=${yeshu+1 }">下一页</a></span>
            <span><a href="index.action?yeshu=${end }">末页</a></span>
            <span>第${yeshu } 页，总 ${end }页</span>
        </p>
    </div>
    <h2 align="center">${info }</h2>
</body>
</html>