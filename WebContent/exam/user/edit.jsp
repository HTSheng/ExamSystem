<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.exam.user.UserService" %>
<%@ page import="com.exam.user.User" %>
<%@ include file="/checkLogin.jsp" %>
<%
	//清除缓存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	
	String contextPath = request.getContextPath();
	//获取用户信息
	String code = request.getParameter("code");
	UserService service = new UserService();
	User user = service.getUser(code);
	String userName = user.getUserName();
	String realName = user.getRealName();
	//String password = user.getPassword();
	String gender = user.getGender();
	String identity = user.getIdentity();

	String result = (String)request.getAttribute("result");//保存结果
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=contextPath%>/css/form.css">
		<title>修改用户</title>
		<base target="_self">
	</head>
	<body>
		<div class="header">
			<h2>修改用户</h2>
		</div>
		<form name="userForm" action="editUser" method="post">
			<table>
				<tr>
					<td class="label"><label>学号/工号：</label></td>
					<td><input type="text" name="code" id="code" value="<%=code %>" readOnly></td>
				</tr>
				<tr>
					<td class="label"><label>用户名：</label></td>
					<td><input type="text" name="userName" id="userName" value="<%=userName %>"></td>
				</tr>
				<tr>
					<td class="label"><label>密码：</label></td>
					<td><input type="password" name="password" id="password"></td>
				</tr>
				<tr>
					<td class="label"><label>姓名：</label></td>
					<td><input type="text" name="realName" id="realName" value="<%=realName %>"></td>
				</tr>
				<tr>
					<td class="label"><label>性别：</label></td>
					<td><select name="gender" id="gender">
						<%if(gender.equalsIgnoreCase("男")) { %>
						<option value="男" selected>男</option>
						<option value="女">女</option>
						<%} else if(gender.equalsIgnoreCase("女")) { %>
						<option value="男">男</option>
						<option value="女" selected>女</option>
						<%} else {%>
						<option value="">--请选择--</option>
						<option value="男">男</option>
						<option value="女">女</option>
						<%} %>
					</select></td>
				</tr>
				<tr>
					<td class="label"><label>身份：</label></td>
					<td><select name="identity" id="identity">
						<%if(identity.equalsIgnoreCase("管理员")) { %>
						<option value="管理员" selected>管理员</option>
						<option value="教师">教师</option>
						<option value="学生">学生</option>
						<%} else if(identity.equalsIgnoreCase("教师")) { %>
						<option value="管理员">管理员</option>
						<option value="教师" selected>教师</option>
						<option value="学生">学生</option>
						<%} else if(identity.equalsIgnoreCase("学生")) { %>
						<option value="管理员">管理员</option>
						<option value="教师">教师</option>
						<option value="学生" selected>学生</option>
						<%} else {%>
						<option value="">--请选择--</option>
						<option value="管理员">管理员</option>
						<option value="教师">教师</option>
						<option value="学生">学生</option>
						<%} %>
					</select></td>
				</tr>
			</table>
		</form>
		<div class="bottom">
			<button onclick="saveForm()">确定</button>
			<button onclick="closeForm()">取消</button>
		</div>
	</body>
	<script type="text/javascript">
		window.onload = function() {
			var result = "<%=result%>";
			if (result == "success") {
				alert("保存成功");
				closeForm();
				window.opener.location.reload();
			}
		};
	
		/*
		 * 保存表单信息
		 */
		function saveForm() {
			if (checkForm()) {
				document.userForm.submit();
			}
		}

		/**
		 * 检查表单信息
		 */
		function checkForm() {
			var code = document.userForm.code.value;
			var userName = document.userForm.userName.value;
			//var password = document.userForm.password.value;
			var realName = document.userForm.realName.value;
			var gender = document.userForm.gender.value;
			var identity = document.userForm.identity.value;
			if (code == "" || userName == "" || realName == "" || gender == "" || identity == "") {
				alert("存在未填写的项目");
				return false;
			}
			if (!(/^[a-zA-Z]+$/.test(userName))) {
				alert("用户名请使用全英文字母");
				return false;
			}
			return true;
		}
		
		/*
		 * 关闭页面
		 */
		function closeForm() {
			window.close();
		}
	</script>
</html>