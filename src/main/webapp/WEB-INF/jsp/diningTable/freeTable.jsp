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
	
			function userFreeTable(){
				var ss = $('#freeTable').datagrid('getSelections');
				if(ss.length==0){
					$.messager.alert('提示','请选择一个空闲餐桌!');
				}else{
					var ids = [];
					$.each(ss, function(index,row){
						ids.push(row.id);
					});
					$.messager.confirm('确认','确定使用餐桌吗?',function(r){
						if(r){
							$.ajax({
								url : 'updateDiningTableState',
								type : 'post',
								data : {
									ids : ids
								},
								success : function(){
									$.messager.alert('提示','使用成功!');
									$('#freeTable').datagrid('reload');
								}
							});
						}
					});
				}
			}
		</script>
	</head>
	<body>
		
		<table id = "freeTable" class="easyui-datagrid" data-options="fit:true,
													fitColumns:true,
													striped:true,
													url:'queryDiningTableByState',
													method:'get',
													idField:'id',
													pagination:true,
													rownumbers:true,
													toolbar:[{
														text:'确定',
														handler:userFreeTable
														}]">
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
	</body>
</html>
