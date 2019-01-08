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
					insertEmp();
					}
				},{
				text : '取消',
				handler : function(){
					$('#showInsertEmp').dialog('close');
				}
			}]; 
			 var buts2 = [{
				text : '确定',
				handler : updateEmp 
				},{
				text : '取消',
				handler : function(){
					$('#showInsertEmp').dialog('close');
				}
			}]; 
			 var buts3 = [{
				text : '确定',
				handler : updateEmpImage 
				},{
				text : '取消',
				handler : function(){
					$('#showInsertEmpImage').dialog('close');
				}
			}]; 
			 function showInsertEmpImage(){
					var ss = $('#empTable').datagrid('getSelections');
					if(ss.length==0){
						$.messager.alert('提示','请选择一条要修改的数据!');
					}else if(ss.length>1){
						$.messager.alert('提示','只能选择一条数据!');
					}else{
							var json = {
									id : ss[0].id,
							}
						$('#myInsertEmpImageForm').form('load',json);
						$('#showInsertEmpImage').window('open');
					}
				}
			 function updateEmpImage(){
				 $.messager.progress();	// 显示进度条
				 $('#myInsertEmpImageForm').form('submit', {
					 url: 'insertOrUpdateEmpImage',
						onSubmit: function(){
							var isValid = $(this).form('validate');
							if (!isValid){
								$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
							}
							return isValid;	// 返回false终止表单提交
						},
						success: function(data){
							$.messager.progress('close');	// 如果提交成功则隐藏进度条
							$('#showInsertEmpImage').window('close');
							$.messager.alert('温馨提示',data,'info');
							$("#empTable").datagrid('reload');
						}
					});
			 }
			 function insertEmp(){
				 $.messager.progress();	// 显示进度条
				 $('#myInsertEmpForm').form('submit', {
						url: 'insertEmp',
						onSubmit: function(){
							var isValid = $(this).form('validate');
							if (!isValid){
								$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
							}
							return isValid;	// 返回false终止表单提交
						},
						success: function(data){
							$.messager.progress('close');	// 如果提交成功则隐藏进度条
							$('#showInsertEmp').dialog('close');
							$.messager.alert('温馨提示',data,'info');
							$("#empTable").datagrid('reload');
						}
					});

			 }
			
			function getImage(value,row,index){
				if(value=='' || value==null){
					return "<a href='javascript:showInsertEmpImage()'>添加头像</a>";
				}else{
					var path = value.imgPath;
					path = "/up"+path.replace(/\\/g, '/');
					return "<img alt='我是图片' src= "+ path + " height='60px' width='60px'>"
				}
			}
			function getSex(value,row,index){
				if(value=='m'){
					return "男";
				}else{
					return "女"
				}
			}
			function getPlevel(value,row,index){
				if(value==0){
					return '管理员';
				}else if(value==1){
					return '服务员';
				}else{
					return '后厨';
				}
			}
			var toolbar = [{
				iconCls : 'icon-add',
				text : '添加',
				handler : function(){
					$("#showInsertEmp").window("open");
				}
			},'-',{
				iconCls : 'icon-edit',
				text : '编辑',
				handler : showUpdate
			},'-',{
				iconCls : 'icon-remove',
				text : '删除',
				handler : deleteEmp 
			}];
			
			function showUpdate(){
				var ss = $('#empTable').datagrid('getSelections');
				if(ss.length==0){
					$.messager.alert('提示','请选择一条要修改的数据!');
				}else if(ss.length>1){
					$.messager.alert('提示','只能选择一条数据!');
				}else{
						var json = {
								id : ss[0].id,
								empno : ss[0].empno,
								password : ss[0].password,
								plevel : ss[0].plevel,
								ename : ss[0].ename,
								age : ss[0].age,
								sex : ss[0].sex,
								mobile : ss[0].mobile,
								address : ss[0].address,
								hiredate : ss[0].hiredate
						}
					$('#myUpdateEmpForm').form('load',json);
					$('#showUpdateEmp').window('open');
				}
			}
			function updateEmp(){
				 $.messager.progress();	// 显示进度条
				 $('#myUpdateEmpForm').form('submit', {
						url: 'updateEmp',
						onSubmit: function(){
							var isValid = $(this).form('validate');
							if (!isValid){
								$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
							}
							return isValid;	// 返回false终止表单提交
						},
						success: function(data){
							$.messager.progress('close');	// 如果提交成功则隐藏进度条
							$('#showUpdateEmp').window('close');
							$.messager.alert('温馨提示',data,'info');
							$("#empTable").datagrid('reload');
						}
					});
			}
			function deleteEmp(){
				var ss = $('#empTable').datagrid('getSelections');
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
								url : 'deleteEmp',
								type : 'post',
								data : {
									ids : ids,
									_method : 'delete'
								},
								success : function(data){
									$.messager.alert('提示','删除成功!');
									$('#empTable').datagrid('reload');
								}
							});
						}
					})
				}
			}
		</script>
	</head>
	<body>
		<table id = "empTable" class="easyui-datagrid" data-options="fit:true,
													fitColumns:true,
													striped:true,
													url:'queryEmp',
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
				<th data-options="field:'image',halign:'center',width:1,formatter:getImage">员工头像</th>
				<th data-options="field:'empno',halign:'center',width:1">员工编号</th>
				<th data-options="field:'password',halign:'center',width:1">密码</th>
				<th data-options="field:'plevel',halign:'center',width:1,formatter:getPlevel">职位</th>
				<th data-options="field:'ename',halign:'center',width:1">员工姓名</th>
				<th data-options="field:'age',halign:'center',width:1">年龄</th>
				<th data-options="field:'sex',halign:'center',width:1,formatter:getSex">性别</th>
				<th data-options="field:'mobile',halign:'center',width:1">电话</th>
				<th data-options="field:'address',halign:'center',width:2">住址</th>
				<th data-options="field:'hiredate',halign:'center',width:1">入职日期</th>
			</tr>
			</thead>
		</table> 
		<div id="showInsertEmpImage" class="easyui-dialog" title="员工头像信息" data-options="closed:true,buttons:buts3" style="width: 450px;height: auto;padding: 10px 50px;">
							<form id="myInsertEmpImageForm" method="post" enctype="multipart/form-data">
								<input id="emp_id" type="hidden" name="id" />
								<input class="easyui-filebox" name="file" data-options="required:true,buttonText:'选择文件',label:'员工头像'" style="width: 100%"/>
							</form>
		</div>
		<div id="showInsertEmp" class="easyui-dialog" title="新增员工信息" data-options="closed:true,buttons:btns" style="width: 450px;height: auto;padding: 10px 50px;">
							<form id="myInsertEmpForm" method="post">
								<p>
									<input class="easyui-textbox" name="empno" data-options="required:true,label:'员工编号'" style="width: 100%"/>
								</p>
								<p>
									<input class="easyui-passwordbox" name="password" data-options="required:true,label:'密码'" style="width: 100%"/>
								</p>
								<p>
									<select class="easyui-combobox" name="plevel" data-options="label:'岗位'"  style="width: 100%">
										<option value="0">管理员</option>
										<option value="1">服务员</option>
										<option value="2">后厨</option>
									</select>
								</p>
								<p>
									<input class="easyui-textbox" name="ename" data-options="required:true,label:'姓名'" style="width: 100%"/>
								</p>
								<p>
									<input class="easyui-textbox" name="age" data-options="required:true,label:'年龄'" style="width: 100%"/>
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
									<input class="easyui-textbox" name="address" data-options="required:true,label:'地址'" style="width: 100%"/>
								</p>
								<p>
									<input class="easyui-datebox" name="hiredate" data-options="required:true,label:'入职日期'" style="width: 100%"/>
								</p>
							</form>
						</div>
						<div id="showUpdateEmp" class="easyui-dialog" title="修改员工信息" data-options="closed:true,buttons:buts2" style="width: 450px;height: auto;padding: 10px 50px;">
							<form id="myUpdateEmpForm" method="post">
									<input type="hidden" name="_method" value="put"/>
									<input type="hidden" name="id" />
								
								<p>
									<input class="easyui-textbox" name="empno" data-options="required:true,label:'员工编号',readonly:true" style="width: 100%"/>
								</p>
								<p>
									<input class="easyui-passwordbox" name="password" data-options="required:true,label:'密码'" style="width: 100%"/>
								</p>
								<p>
									<select class="easyui-combobox" name="plevel" data-options="label:'岗位'"  style="width: 100%">
										<option value="0">管理员</option>
										<option value="1">服务员</option>
										<option value="2">后厨</option>
									</select>
								</p>
								<p>
									<input class="easyui-textbox" name="ename" data-options="required:true,label:'姓名'" style="width: 100%"/>
								</p>
								<p>
									<input class="easyui-textbox" name="age" data-options="required:true,label:'年龄'" style="width: 100%"/>
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
									<input class="easyui-textbox" name="address" data-options="required:true,label:'地址'" style="width: 100%"/>
								</p>
								<p>
									<input class="easyui-datebox" name="hiredate" data-options="required:true,label:'入职日期'" style="width: 100%"/>
								</p>
							</form>
						</div>
	</body>
</html>
