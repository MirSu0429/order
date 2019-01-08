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
					insertFood();
					}
				},{
				text : '取消',
				handler : function(){
					$('#showInsertFood').dialog('close');
				}
			}]; 
			 var buts2 = [{
				text : '确定',
				handler : updateFood 
				},{
				text : '取消',
				handler : function(){
					$('#showInsertFood').dialog('close');
				}
			}]; 
			 var buts3 = [{
					text : '确定',
					handler : updateFoodImage 
					},{
					text : '取消',
					handler : function(){
						$('#showInsertFoodImage').dialog('close');
					}
				}]; 
				 function showInsertFoodImage(){
						var ss = $('#foodTable').datagrid('getSelections');
						if(ss.length==0){
							$.messager.alert('提示','请选择一条要修改的数据!');
						}else if(ss.length>1){
							$.messager.alert('提示','只能选择一条数据!');
						}else{
								var json = {
										id : ss[0].id,
								}
							$('#myInsertFoodImageForm').form('load',json);
							$('#showInsertFoodImage').window('open');
						}
					}
				 function updateFoodImage(){
					 $.messager.progress();	// 显示进度条
					 $('#myInsertFoodImageForm').form('submit', {
						 url: 'insertOrUpdateFoodImage',
							onSubmit: function(){
								var isValid = $(this).form('validate');
								if (!isValid){
									$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
								}
								return isValid;	// 返回false终止表单提交
							},
							success: function(data){
								$.messager.progress('close');	// 如果提交成功则隐藏进度条
								$('#showInsertFoodImage').window('close');
								$.messager.alert('温馨提示',data,'info');
								$("#foodTable").datagrid('reload');
							}
						});
				 }
			 function insertFood(){
				 $.messager.progress();	// 显示进度条
				 $('#myInsertFoodForm').form('submit', {
						url: 'insertFood',
						onSubmit: function(){
							var isValid = $(this).form('validate');
							if (!isValid){
								$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
							}
							return isValid;	// 返回false终止表单提交
						},
						success: function(data){
							$.messager.progress('close');	// 如果提交成功则隐藏进度条
							$('#showInsertFood').dialog('close');
							$.messager.alert('温馨提示',data,'info');
							$("#foodTable").datagrid('reload');
						}
					});

			 }
			 function getImage(value,row,index){
					if(value=='' || value==null){
						return "<a href='javascript:showInsertFoodImage()'>添加头像</a>";
					}else{
						var path = value.imgPath;
						path = "/up"+path.replace(/\\/g, '/');
						return "<img alt='我是图片' src= "+ path + " height='60px' width='60px'>"
					}
				}
			function getRecommend(value,row,index){
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
					$("#showInsertFood").window("open");
				}
			},'-',{
				iconCls : 'icon-edit',
				text : '编辑',
				handler : showUpdate
			},'-',{
				iconCls : 'icon-remove',
				text : '删除',
				handler : deleteFood 
			}];
			function showUpdate(){
				var ss = $('#foodTable').datagrid('getSelections');
				if(ss.length==0){
					$.messager.alert('提示','请选择一条要修改的数据!');
				}else if(ss.length>1){
					$.messager.alert('提示','只能选择一条数据!');
				}else{
						var json = {
								id : ss[0].id,
								name : ss[0].name,
								price : ss[0].price,
								recommend : ss[0].recommend,
								intro : ss[0].intro,
								decription : ss[0].decription,
						}
					$('#myUpdateFoodForm').form('load',json);
					$('#showUpdateFood').window('open');
				}
			}
			function updateFood(){
				 $.messager.progress();	// 显示进度条
				 $('#myUpdateFoodForm').form('submit', {
						url: 'updateFood',
						onSubmit: function(){
							var isValid = $(this).form('validate');
							if (!isValid){
								$.messager.progress('close');	// 如果表单是无效的则隐藏进度条
							}
							return isValid;	// 返回false终止表单提交
						},
						success: function(data){
							$.messager.progress('close');	// 如果提交成功则隐藏进度条
							$('#showUpdateFood').window('close');
							$.messager.alert('温馨提示',data,'info');
							$("#foodTable").datagrid('reload');
						}
					});
			}
			function deleteFood(){
				var ss = $('#foodTable').datagrid('getSelections');
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
								url : 'deleteFood',
								type : 'post',
								data : {
									ids : ids,
									_method : 'delete'
								},
								success : function(data){
									$.messager.alert('提示','删除成功!');
									$('#foodTable').datagrid('reload');
								}
							});
						}
					})
				}
			}
		</script>
	</head>
	<body>
		<table id = "foodTable" class="easyui-datagrid" data-options="fit:true,
													fitColumns:true,
													striped:true,
													url:'queryFood',
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
				<th data-options="field:'image',halign:'center',width:1,formatter:getImage">菜品图片</th>
				<th data-options="field:'name',halign:'center',width:1">菜品名称</th>
				<th data-options="field:'price',halign:'center',width:1">价格</th>
				<th data-options="field:'recommend',halign:'center',width:1,formatter:getRecommend">是否推荐</th>
				<th data-options="field:'intro',halign:'center',width:1">简介</th>
				<th data-options="field:'decription',halign:'center',width:2">菜品描述</th>
			</tr>
			</thead>
		</table> 
		<div id="showInsertFoodImage" class="easyui-dialog" title="员工头像信息" data-options="closed:true,buttons:buts3" style="width: 450px;height: auto;padding: 10px 50px;">
							<form id="myInsertFoodImageForm" method="post" enctype="multipart/form-data">
								<input id="food_id" type="hidden" name="id" />
								<input class="easyui-filebox" name="file" data-options="required:true,buttonText:'选择文件',label:'菜品图片'" style="width: 100%"/>
							</form>
		</div>
		<div id="showInsertFood" class="easyui-dialog" title="新增菜品信息" data-options="closed:true,buttons:btns" style="width: 450px;height: auto;padding: 10px 50px;">
							<form id="myInsertFoodForm" method="post">
								<p>
									<input class="easyui-textbox" name="name" data-options="required:true,label:'菜品名称'" style="width: 100%"/>
								</p>
								<p>
									<input class="easyui-textbox" name="price" data-options="required:true,label:'价格'" style="width: 100%"/>
								</p>
								<p>
									<select class="easyui-combobox" name="recommend" data-options="label:'是否推荐'"  style="width: 100%">
										<option value="0">是</option>
										<option value="1">否</option>
									</select>
								</p>
								<p>
									<input class="easyui-textbox" name="intro" data-options="required:true,label:'简介'" style="width: 100%"/>
								</p>
								<p>
									<input class="easyui-textbox" name="decription" data-options="required:true,label:'菜品描述'" style="width: 100%"/>
								</p>
							</form>
						</div>
						<div id="showUpdateFood" class="easyui-dialog" title="修改菜品信息" data-options="closed:true,buttons:buts2" style="width: 450px;height: auto;padding: 10px 50px;">
							<form id="myUpdateFoodForm" method="post">
									<input type="hidden" name="_method" value="put"/>
									<input type="hidden" name="id" />
								
								<p>
									<input class="easyui-textbox" name="name" data-options="required:true,label:'菜品名称'" style="width: 100%"/>
								</p>
								<p>
									<input class="easyui-textbox" name="price" data-options="required:true,label:'价格'" style="width: 100%"/>
								</p>
								<p>
									<select class="easyui-combobox" name="recommend" data-options="label:'是否推荐'"  style="width: 100%">
										<option value="0">是</option>
										<option value="1">否</option>
									</select>
								</p>
								<p>
									<input class="easyui-textbox" name="intro" data-options="required:true,label:'简介'" style="width: 100%"/>
								</p>
								<p>
									<input class="easyui-textbox" name="decription" data-options="required:true,label:'菜品描述'" style="width: 100%"/>
								</p>
							</form>
						</div>
	</body>
</html>
