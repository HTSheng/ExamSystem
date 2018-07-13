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
	String gender = user.getGender();
	String identity = user.getIdentity();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=contextPath%>/css/form.css">
		<title>查看用户</title>
		<base target="_self">
	</head>
	<body>
		<div class="header">
			<h2>查看用户</h2>
		</div>
		<form name="userForm">
			<table>
				<tr>
					<td class="label"><label>学号/工号：</label></td>
					<td><input type="text" name="code" id="code" value="<%=code %>" readOnly></td>
				</tr>
				<tr>
					<td class="label"><label>用户名：</label></td>
					<td><input type="text" name="userName" id="userName" value="<%=userName %>" readOnly></td>
				</tr>
				<tr>
					<td class="label"><label>姓名：</label></td>
					<td><input type="text" name="realName" id="realName" value="<%=realName %>" readOnly></td>
				</tr>
				<tr>
					<td class="label"><label>性别：</label></td>
					<td><input type="text" name="gender" id="gender" value="<%=gender %>" readOnly></td>
				</tr>
				<tr>
					<td class="label"><label>身份：</label></td>
					<td><input type="text" name="identity" id="identity" value="<%=identity %>" readOnly></td>
				</tr>
			</table>
		</form>
		<div class="bottom">
			<button onclick="closeForm()">关闭</button>
		</div>
	</body>
	<script type="text/javascript">
		/*
		 * 关闭页面
		 */
		function closeForm() {
			window.close();
		}
	</script>
</html>