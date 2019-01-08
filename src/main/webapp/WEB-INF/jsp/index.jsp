<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<style type="text/css">
	        .easyui-tabs .tabs-panels>.panel>.panel-body {  
		    	overflow: hidden;  
		    } 
	    </style>
		<script>
			$(function(){
				$('.easyui-accordion li a').click(function(){
//					alert($(this).text());
					var title = $(this).text();
					var url = $(this).attr('name');
//					alert(url);
					if($('.easyui-tabs').tabs('exists',title)){
						$('.easyui-tabs').tabs('select',title);
					}else{
						$('.easyui-tabs').tabs('add',{
							title : title,
							closable : true,
							content : "<iframe frameborder=0 style='width:100%;height:100%' scrolling='auto' src='"+url+"'></iframe>"
						});
					}
				});
			})
		</script>
	</head>
	<body class="easyui-layout">
		<div style="height: 10%;background-color:#F5F5F5;padding-top: 20px;" data-options="region:'north'">
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			<input /><a href="#" class="easyui-linkbutton c8">发送</a>
			<span style="font-size:20px;margin-left: 350px;"><img src="easyui/themes/icons/man.png" style="height: 22px;padding-bottom: 5px;" 
			align="AbsMiddle"/>当前身份 [管理员]&emsp;账号:admin&emsp;&emsp;&emsp;<a href="#" style="text-decoration: none;">退出</a></span>
		</div>
		<div style="height: 5%;padding-top: 5px;" data-options="region:'south'" align="center">
			版权所有&emsp;&emsp;违者必究
		</div>
		<div data-options="region:'center'">
			<div class="easyui-tabs" data-options="fit:true,border:false">
				<div title="首页" style="height: 100px;">
					<div style="color:red;text-align: center;"><h1>欢迎使用...</h1></div>
				</div>
			</div>
		</div>
		<div title="导航菜单" data-options="region:'west',split:true" style="width:15%">
			<div class="easyui-accordion" data-options="border:false,fit:false">
				<div title="运营服务">
					<ul class="easyui-tree">
						<li><a name="openDiningTable">排号服务</a></li>
						<li><a name="comm.html">结账服务</a></li>
					</ul>
				</div>
				<div title="餐厅管理" data-options="selected:true">
					<ul class="easyui-tree">
						<li><a  name="showQueryEmp" >员工管理</a></li>
						<li><a  name="showQueryFood" >菜品管理</a></li>
						<li><a  name="showQueryCustomer">客户管理</a></li>
						<li><a  name="https://www.163.com">经营数据</a></li>
					</ul>
				</div>
			</div>			
		</div>
	</body>
</html>
