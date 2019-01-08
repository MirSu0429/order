<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
			$(function(){
				
			});
			 var btns = [{
				text : '确定',
				handler : function(){
					insertCustomer();
					}
				},{
				text : '取消',
				handler : function(){
					$('#showInsertCustomer').dialog('close');
				}
			}]; 
			 var buts2 = [{
				text : '确定',
				handler : updateCustomer 
				},{
				text : '取消',
				handler : function(){
					$('#showInsertCustomer').dialog('close');
				}
			}]; 
			 function insertCustomer(){
				 $.messager.progress();	// 显示进度条
				 $('#myInsertCustomerForm').form('submit', {
						url: 'insertCustomer',
						onSubmit: function(){
							var isValid = $(this).form('validate');
							if (!isValid){
								$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
							}
							return isValid;	// 返回false终止表单提交
						},
						success: function(data){
							$.messager.progress('close');	// 如果提交成功则隐藏进度条
							$('#showInsertCustomer').dialog('close');
							$.messager.alert('温馨提示',data,'info');
							$("#customerTable").datagrid('reload');
						}
					});

			 }
			
			function getSex(value,row,index){
				if(value=='m'){
					return "男";
				}else if(value=='f'){
					return "女"
				}
			}
			function getVipState(value,row,index){
				if(value==0){
					return '否';
				}else if(value==1){
					return '是';
				}
			}
			var toolbar = [{
				iconCls : 'icon-add',
				text : '添加',
				handler : function(){
					$("#showInsertCustomer").window("open");
				}
			},'-',{
				iconCls : 'icon-edit',
				text : '编辑',
				handler : showUpdate
			},'-',{
				iconCls : 'icon-remove',
				text : '删除',
				handler : deleteCustomer 
			}];
			function showUpdate(){
				var ss = $('#customerTable').datagrid('getSelections');
				if(ss.length==0){
					$.messager.alert('提示','请选择一条要修改的数据!');
				}else if(ss.length>1){
					$.messager.alert('提示','只能选择一条数据!');
				}else{
						var json = {
								id : ss[0].id,
								name : ss[0].name,
								sex : ss[0].sex,
								mobile : ss[0].mobile,
								eatCount : ss[0].eatCount,
								expendMoney : ss[0].expendMoney,
								vipState : ss[0].vipState,
						}
					$('#myUpdateCustomerForm').form('load',json);
					$('#showUpdateCustomer').window('open');
				}
			}
			function updateCustomer(){
				 $.messager.progress();	// 显示进度条
				 $('#myUpdateCustomerForm').form('submit', {
						url: 'updateCustomer',
						onSubmit: function(){
							var isValid = $(this).form('validate');
							if (!isValid){
								$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
							}
							return isValid;	// 返回false终止表单提交
						},
						success: function(data){
							$.messager.progress('close');	// 如果提交成功则隐藏进度条
							$('#showUpdateCustomer').window('close');
							$.messager.alert('温馨提示',data,'info');
							$("#customerTable").datagrid('reload');
						}
					});
			}
			function deleteCustomer(){
				var ss = $('#customerTable').datagrid('getSelections');
				if(ss.length==0){
					$.messager.alert('提示','请选择一条要删除的数据!');
				}else if(ss.length>1){
					$.messager.alert('提示','只能选择一条数据!');
				}else{
					 var ids = [];
					$.each(ss, function(index,row){
						ids.push(row.id);
						
					}); 
					$.messager.confirm('确认','你确认要删除该条数据吗?',function(r){
						if(r){
							$.ajax({
								url : 'deleteCustomer',
								type : 'post',
								data : {
									ids : ids,
									_method : 'delete'
								},
								success : function(data){
									$.messager.alert('提示','删除成功!');
									$('#customerTable').datagrid('reload');
								}
							});
						}
					})
				}
			}
		</script>
	</head>
	<body>
		<table id = "customerTable" class="easyui-datagrid" data-options="fit:true,
													fitColumns:true,
													striped:true,
													url:'queryCustomer',
													method:'get',
													idField:'id',
													pagination:true,
													rownumbers:true,
													toolbar:toolbar
													">
			<thead>
			<tr>
				<th data-options="field:'cb',checkbox:true"></th>
				<th data-options="field:'id',hidden:true"></th>
				<th data-options="field:'name',halign:'center',width:1">客户姓名</th>
				<th data-options="field:'sex',halign:'center',width:1,formatter:getSex">性别</th>
				<th data-options="field:'mobile',halign:'center',width:1">电话</th>
				<th data-options="field:'eatCount',halign:'center',width:1">用餐次数</th>
				<th data-options="field:'expendMoney',halign:'center',width:1">总消费金额</th>
				<th data-options="field:'vipState',halign:'center',width:1,formatter:getVipState">是否VIP客户</th>
			</tr>
			</thead>
		</table> 
		<div id="showInsertCustomer" class="easyui-dialog" title="新增客户工信息" data-options="closed:true,buttons:btns" style="width: 450px;height: auto;padding: 10px 50px;">
							<form id="myInsertCustomerForm" method="post">
								<p>
									<input class="easyui-textbox" name="name" data-options="required:true,label:'客户姓名'" style="width: 100%"/>
								</p>
								<p>
									<select class="easyui-combobox" name="sex" data-options="label:'性别'"  style="width: 100%">
										<option value="m">男</option>
										<option value="f">女</option>
									</select>
								</p>
								<p>
									<input class="easyui-textbox" name="mobile" data-options="required:true,label:'电话'" style="width: 100%"/>
								</p>
								<p>
									<input class="easyui-textbox" name="eatCount" data-options="required:true,label:'用餐次数'" style="width: 100%"/>
								</p>
								<p>
									<input class="easyui-textbox" name="expendMoney" data-options="required:true,label:'消费金额'" style="width: 100%"/>
								</p>
								<p>
									<select class="easyui-combobox" name="vipState" data-options="label:'是否VIP客户'"  style="width: 100%">
										<option value="0">否</option>
										<option value="1">是</option>
									</select>
								</p>
							</form>
						</div>
						<div id="showUpdateCustomer" class="easyui-dialog" title="修改客户信息" data-options="closed:true,buttons:buts2" style="width: 450px;height: auto;padding: 10px 50px;">
							<form id="myUpdateCustomerForm" method="post">
									<input type="hidden" name="_method" value="put"/>
									<input type="hidden" name="id" />
								
								<p>
									<input class="easyui-textbox" name="name" data-options="required:true,label:'客户姓名'" style="width: 100%"/>
								</p>
								<p>
									<select class="easyui-combobox" name="sex" data-options="label:'性别'"  style="width: 100%">
										<option value="m">男</option>
										<option value="f">女</option>
									</select>
								</p>
								<p>
									<input class="easyui-textbox" name="mobile" data-options="required:true,label:'电话'" style="width: 100%"/>
								</p>
								<p>
									<input class="easyui-textbox" name="eatCount" data-options="required:true,label:'用餐次数'" style="width: 100%"/>
								</p>
								<p>
									<input class="easyui-textbox" name="expendMoney" data-options="required:true,label:'消费金额'" style="width: 100%"/>
								</p>
								<p>
									<select class="easyui-combobox" name="vipState" data-options="label:'是否VIP客户'"  style="width: 100%">
										<option value="0">否</option>
										<option value="1">是</option>
									</select>
								</p>
							</form>
						</div>
	</body>
</html>
