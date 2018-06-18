<%@ page language="java" contentType="text/html; charset=UTF-8" errorPage="/error2.jsp"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Leave Management-Login</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	function submitData(){
		
		$("#fm").form("submit",{
			
			url:"${pageContext.request.contextPath}/user/userLogin.action",
			
				onSubmit:function(){
				
					if($("#groupId").combobox("getValue")=="..."){
						
						$.messager.alert("系统提示","请选择用户角色！",'warning');
						return false;
						
					}
					
						return $(this).form("validate");
				},
				
				success:function(result){
				
				/* var result=eval('('+result+')'); */
				
					var result = JSON.parse(result);
				
						if(result.success){
							window.location.href="${pageContext.request.contextPath}/main.jsp";
						}else{
							$.messager.alert("系统提示",result.errorInfo,'error');
							return;
						}
				}
		});
		
	}

	function resetValue(){
/* 		$("#userName").val("");
		$("#password").val(""); */
		
		/* $("#groupId").combobox("setValue",""); */
		/* $("#groupId").combobox("clear"); */
		
		$('#fm').form('reset');
		/* Reset <- EasyUI */
	}

</script>
</head>
<body>
<div style="position: absolute;width: 100%;height: 100%;z-index: -1;left: 0;top: 0">
	<img src="${pageContext.request.contextPath}/static/images/login_bg.jpg" width="100%" height="100%" style="left: 0;top: 0;">
</div>
<div class="easyui-window" 
		title="Leave Process" 
			data-options="iconCls:'icon-user',modal:true,closable:false,collapsible:false,minimizable:false,maximizable:false,resizable:false" 
				style="width: 400px;height: 280px;padding: 10px">
				
				
	<form id="fm" action="" method="post">
	
		<table cellpadding="6px" align="center">
			<tr align="center">
				<th colspan="2" style="padding-bottom: 10px"><big>User Login</big></th>
			</tr>
			<tr>
				<td><label for="userName">Username :</label></td>
				<td>
					<input type="text" id="userName" name="userName" class="easyui-validatebox" required="true" style="width: 200px"/>
				</td>
			</tr>
			<tr>
				<td><label for="password">Password :</label></td>
				<td>
					<input type="password" id="password" name="password" class="easyui-validatebox" required="true" style="width: 200px"/>
				</td>
			</tr>
			<tr>
				<td><label for="groupId">Role :</label></td>
				<td>
					<input  id="groupId" name="groupId" 
					
						class="easyui-combobox" 
						
							data-options="panelHeight:'auto',valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/group/findGroup.action'" 
							
								value="..."/>
				</td>
			</tr>
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<a href="javascript:submitData()" class="easyui-linkbutton" iconCls="icon-submit">Login</a>&nbsp;
					<a href="javascript:resetValue()" class="easyui-linkbutton" iconCls="icon-reset">Reset</a>
				</td>
			</tr>
		</table>
		
	</form>
	
</div>
</body>
</html>