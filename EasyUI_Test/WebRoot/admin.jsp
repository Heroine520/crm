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
	   <style type="text/css">
	   		.btnCls{
	   			height:20px;
	   			width:70px;
	   			background-color:white;
	   			border:1px solid lightblue;
	   			margin-left: 20px
	   		}
	   </style>
	   <script type="text/javascript">
	   		//获取cid
	   		function getClassCid(value,row,index){
	   			if (row.classInfo) {
					return row.classInfo.cid;
				}
				return value;
	   		}
	   		
	   		//获取cname
	   		function getClassCname(value,row,index){
	   			if (row.classInfo) {
					return row.classInfo.cname
				}
				return value;
	   		}
	   		
	   		$(function(){
	   			//实现删除 根据编号实现删除
	   			$("#delBtn").click(function(){
	   				var selRows=$("#dg").datagrid("getSelections");
	   				if (selRows.length==1) {
	   					var sidVal=selRows[0].sid;
						$.get("removeAction",{"sid":sidVal},function(result){
							//判断是否删除成功
							if (result=="suc") {
								$.messager.alert("信息","删除成功","info");
								//删除成功后要刷新datagrid
								$("#dg").datagrid("reload");
							}else{
								$.messager.alert("错误","删除失败","error");
							}
						})
					}else{
						$.messager.alert("提示","必须选中一行","warning")
					}
	   			})
	   			
	   			//点击添加按钮显示 添加对话框addDialog
	   			$("#addBtn").click(function(){
	   				//禁止拖动  
	   				$("#addDialog").dialog({
	   					draggable:false,
	   					modal:true,
	   					onClosed:function(){
	   						$("#addForm").form("clear");
	   					}
	   				})
	   				$("#addDialog").dialog("open");
	   			})
	   			//点击取消按钮 关闭窗口
	   			$("#addCannel").click(function(){
	   				$("#addDialog").dialog("close");
	   			})
	   			//点击增加按钮实现增加
	   			$("#addButton").click(function(){
	   				//获取表单所有数据
	   				var parmas=$("#addForm").serialize();
	   				//使用ajax实现增加
	   				$.get("insertAction",parmas,function(result){
						//判断是否增加成功
						if (result=="suc") {
							$.messager.alert("信息","增加成功","info");
							//增加成功后要刷新datagrid
							$("#dg").datagrid("reload");
						}else{
							$.messager.alert("错误","增加失败","error");
						}
						//关闭
						$("#addDialog").dialog("")	
					})
	   			})
	   		})
	   </script>
	  	
   </head>
  <body>
  	<table class="easyui-datagrid" id="dg" title="用户信息" data-options="url:'showAction',
								    				singleSelect:true,
								    				fitColumns:true,	
								    				collapsible:true,
								    				pagination:true,
								    				pageList:[2,3,4],
								    				pageSize:2,
								    				pageNumber:1,
								    				toolbar:'#toolbar'">	
    				
    	<thead>
    		<tr>
    			<th data-options="field:'sid',width:50">学号</th>
    			<th data-options="field:'sname',width:50">姓名</th>
    			<th data-options="field:'cid',width:50" formatter="getClassCid">班级编号</th>
    			<th data-options="field:'cname',width:50" formatter="getClassCname">班级</th>
    		</tr>
    	</thead>
    	
    </table>
    
    <!--删除窗口  -->
    <div id="toolbar">
    	<a id="addBtn" class="easyui-linkbutton" data-options="iconCls:'icon-add'">增加</a>
    	<a id="delBtn" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a>
    	<a id="editBtn" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">修改</a>
    </div>
    
    <!--增加窗口  -->
    <div id="addDialog" title="增加学生" closed="true" class="easyui-dialog" style="width:400px;height:400px">
    	<form method="post" id="addForm">
    		<table align="center" width="300px" height="300px">
    			<tr>
    				<td>学生姓名</td>
    				<td><input class="easyui-textbox" name="sname"></td>
    			</tr>
    			<tr>
    				<td>班级</td>
    				<td>
    					<select name="classInfo.cid" class="easyui-combobox">
    						<option value="1">T65</option>
    						<option value="3">T66</option>
    					</select>
    				</td>
    			</tr>
    			<tr>
    				<td><input type="button" class="btnCls" id="addButton" value="增加"></td>
    				<td><input type="button" class="btnCls" id="addCannel" value="取消"></td>
    			</tr>
    			
    		</table>
    	</form>
    </div>
  </body> 
</html>
