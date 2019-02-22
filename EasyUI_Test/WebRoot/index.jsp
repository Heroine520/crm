<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	   <!-- 引入EasyUI css -->
	   <link rel="stylesheet" href="themes/default/easyui.css" type="text/css"></link>
	   <link rel="stylesheet" href="themes/icon.css" type="text/css"></link>
	  
	   <!--引入 EasyUI js  -->
	   <script type="text/javascript" src="js/jquery.min.js"></script>
	   <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
	   <script type="text/javascript" src="js/easyui-lang-zh_CN.js"></script>
	   
	  	<script type="text/javascript">
	  		$(function(){
	  			$("#delBtn").click(function(){
	  				var selArr=$("#dg").datagrid("getSelections");
	  				if (selArr.length>0) {
						
					}else{
						$.messager.alert("提示","至少选中一行数据进行删除","error");
					}
	  			})
	  			
	  			$("#addBtn").click(function(){
	  				$("#addDialog").dialog("open");
	  			})
	  			
	  			$("#modBtn").click(function(){
	  				var selArr=$("#dg").datagrid("getSelections");
	  				if (selArr.length>0) {
	  					$("#editDialog").dialog("open");
						$("#editForm").form("load",{
							uid:selArr[0].uid,
							username:selArr[0].username,
							age:selArr[0].age
						})
					}else{
						$.messager.alert("提示","至少选中一行数据进行删除","error");
					}
	  				
	  			})
	  		})
	  	</script>
   </head>
  <body>
    <!--编写datagrid 数据表格  -->
    <table class="easyui-datagrid" id="dg" title="用户信息" data-options="url:'1.json',
								    				singleSelect:true,
								    				fitColumns:true,	
								    				collapsible:true,
								    				pagination:true,
								    				pageList:[2,3,5],
								    				pageSize:2,
								    				pageNumber:1,
								    				toolbar:'#tb'">	
    				
    	<thead>
    		<tr>
    			<th data-options="field:'uid',width:50,align:'center'">编号</th>
    			<th data-options="field:'username',width:50,align:'center'">用户名</th>
    			<th data-options="field:'age',width:50,align:'center'">年龄</th>
    		</tr>
    	</thead>
    </table>
    <!--声明工具栏  -->
    <div id="tb" >
    	<a href="#" id="addBtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">增加</a>
    	<a href="#" id="delBtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
    	<a href="#" id="modBtn" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
    </div>
    <!--增加用户面板Dialog  -->	
    <div id="addDialog" class="easyui-dialog" title="增加用户" closed="true"
    	style="width:300px;height:300px">
    	
    </div>
    
    <!--修改  -->
    <div id="editDialog" class="easyui-dialog" title="修改用户" closed="true"
    	style="width:300px;height:300px">
    	<form id="editForm" method="post">
	    	编号：<input type="text" name="uid">
	    	用户名：<input type="text" name="username">
	    	年龄：<input type="text" name="age">
	    	<input type="submit" value="修改">
    	</form>
    </div>
  </body> 
</html>
