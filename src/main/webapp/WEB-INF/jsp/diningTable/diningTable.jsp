<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<base href="${pageContext.request.contextPath }/">
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
		<link rel="stylesheet" type="text/css" href="easyui/themes/color.css"/>
		<script type="text/javascript" src="easyui/jquery.min.js"></script>
		<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript">
			 var buts = [{
				text : '确定',
				handler : insertDiningTable
				},{
				text : '取消',
				handler : function(){
					$('#showInsertDiningTable').dialog('close');
				}
			}]; 
			 var buts2 = [{
				text : '确定',
				handler : updateDiningTable
				},{
				text : '取消',
				handler : function(){
					$('#showUpdateDiningTable').dialog('close');
				}
			}]; 
			 function insertDiningTable(){
				 $.messager.progress();	// 显示进度条
				 $('#insertDiningTableForm').form('submit', {
						url: 'insertDiningTable',
						onSubmit: function(){
							var isValid = $(this).form('validate');
							if (!isValid){
								$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
							}
							return isValid;	// 返回false终止表单提交
						},
						success: function(){
							$.messager.progress('close');	// 如果提交成功则隐藏进度条
							$('#showInsertDiningTable').dialog('close');
							$.messager.alert('温馨提示','添加成功!');
							$("#diningTable").datagrid('reload');
						}
					});

			 }
			
			var toolbar = [{
				iconCls : 'icon-add',
				text : '添加',
				handler : function(){
					$("#showInsertDiningTable").dialog("open");
				}
			},'-',{
				iconCls : 'icon-edit',
				text : '编辑',
				handler : showUpdate
			},'-',{
				iconCls : 'icon-remove',
				text : '删除',
				handler : deleteDiningTable
			},'-',{
				text : '查询空闲餐桌',
				handler : freeDiningTable
			}];
			function freeDiningTable(){
				$('#freeDiningTable').dialog({
					title:'空闲餐桌信息',
					width:600,
					height:400,
					modal:true,
					content:"<iframe frameborder='0' src='skip.jsp' style='width:100%;height:100%;display:block;'></iframe>"
				});
				$('#freeDiningTable').dialog('open'); 
			}
			function showUpdate(){
				var ss = $('#diningTable').datagrid('getSelections');
				if(ss.length==0){
					$.messager.alert('提示','请选择一条要修改的数据!');
				}else if(ss.length>1){
					$.messager.alert('提示','只能选择一条数据!');
				}else{
					var json = {
							id : ss[0].id,
							tableno : ss[0].tableno,
							state : ss[0].state,
							info : ss[0].info
					}
					alert(111);
					$('#showUpdateDiningTable').window('open');
					$('#updateDiningTableForm').form('load',json);
				}
			}
			function updateDiningTable(){
				 $.messager.progress();	// 显示进度条
				 $('#updateDiningTableForm').form('submit', {
						url: 'updateDiningTable',
						onSubmit: function(){
							var isValid = $(this).form('validate');
							if (!isValid){
								$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
							}
							return isValid;	// 返回false终止表单提交
						},
						success: function(){
							$.messager.progress('close');	// 如果提交成功则隐藏进度条
							$('#showUpdateDiningTable').window('close');
							$.messager.alert('温馨提示','修改成功!');
							$("#diningTable").datagrid('reload');
						}
					});
			}
			function deleteDiningTable(){
				var ss = $('#diningTable').datagrid('getSelections');
				if(ss.length==0){
					$.messager.alert('提示','请选择一条要删除的数据!');
				}else{
					var ids = [];
					$.each(ss, function(index,row){
						ids.push(row.id);
					});
					$.messager.confirm('确认','你确认要删除该条数据吗?',function(r){
						if(r){
							$.ajax({
								url : 'deleteDiningTable',
								type : 'post',
								data : {
									ids : ids,
									_method : 'delete'
								},
								success : function(){
									$.messager.alert('提示','执行成功!');
									$('#diningTable').datagrid('reload');
								}
							});
						}
					});
				}
			}
		</script>
	</head>
	<body>
		<table id = "diningTable" class="easyui-datagrid" data-options="fit:true,
															fitColumns:true,
															striped:true,
															url:'queryDiningTable',
															method:'get',
															idField:'id',
															pagination:true,
															rownumbers:true,
															toolbar:toolbar">
			<thead>
			<tr>
				<th data-options="field:'cb',checkbox:true"></th>
				<th data-options="field:'id',hidden:true"></th>
				<th data-options="field:'tableno',halign:'center',width:1">桌号</th>
				<th data-options="field:'state',halign:'center',width:1">餐桌状态</th>
				<th data-options="field:'info',halign:'center',width:1">餐桌信息</th>
			</tr>
			</thead>
		</table> 
		<div id="freeDiningTable" class="easyui-dialog" data-options="closed:true;" style="width:600px;height:600px;padding:10px">
		
		</div>
		<div id="showInsertDiningTable" class="easyui-dialog" title="添加餐桌信息" data-options="closed:true,buttons:buts" style="width: 450px;height: auto;padding: 10px 50px;">
			<form id="insertDiningTableForm" method="post">
				<p>
					<input class="easyui-textbox" name="tableno" data-options="required:true,label:'餐桌编号'" style="width: 100%"/>
				</p>
				<p>
					<input class="easyui-textbox" name="state" data-options="required:true,label:'餐桌状态'" style="width: 100%"/>
				</p>
				
				<p>
					<input class="easyui-textbox" name="info" data-options="required:true,label:'餐桌信息'" style="width: 100%"/>
				</p>
			</form>
		</div>
		<div id="showUpdateDiningTable" class="easyui-dialog" title="修改餐桌信息" data-options="closed:true,buttons:buts2" style="width: 450px;height: auto;padding: 10px 50px;">
			<form id="updateDiningTableForm" method="post">
					<input type="hidden" name="_method" value="put"/>
					<input type="hidden" name="id" />
				
				<p>
					<input class="easyui-textbox" name="tableno" data-options="required:true,label:'餐桌编号',readonly:true" style="width: 100%"/>
				</p>
				<p>
					<input class="easyui-textbox" name="state" data-options="required:true,label:'餐桌状态'" style="width: 100%"/>
				</p>
				
				<p>
					<input class="easyui-textbox" name="info" data-options="required:true,label:'餐桌信息'" style="width: 100%"/>
				</p>
			</form>
		</div>
	</body>
</html>
