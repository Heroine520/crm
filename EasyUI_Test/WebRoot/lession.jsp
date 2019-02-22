<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'lession.jsp' starting page</title>
	
  <link rel="stylesheet" href="themes/default/easyui.css" type="text/css"></link>
  <link rel="stylesheet" href="themes/icon.css" type="text/css"></link>
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
  <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
  </head>
  
  <body>
    <table class="easyui-datagrid" 
    		data-options="url:'1.json',
    		singleSelect:true,
    		fitColumns:true,
    		collapsible:true,
    		rownumbers:true,
    		pagination:true,
    		toolbar:'#tb'
    		">
    	<thead>
    		<tr>
    			<th data-options="field:'uid',width:50,align:'center'">编号</th>
    			<th data-options="field:'username',width:50,align:'center'">姓名</th>
    			<th data-options="field:'age',width:50,align:'center'">年龄</th>
    		</tr>
    	</thead>
    </table>
    <!--声明工具栏  -->
    <div id="tb">
    	<a href="" id="add" class="esasyui-linkbutton" data-options="iconCls:'icon-add'">增加</a>
    	<a href="" id="del" class="esasyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
    	<a href="" id="mod" class="esasyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
    </div>
  </body>
</html>
