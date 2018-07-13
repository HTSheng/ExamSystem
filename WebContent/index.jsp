<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
	//清除缓存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	//获取登录状态
	String login = (String)session.getAttribute("login");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/login.css">
		<title>考试管理系统登录</title>
	</head>
	<body>
		<div id="login">
			<h1>用户登录</h1>
			<form name="loginForm" action="login" method="post">
				<label>用户名：</label>
				<input type="text" name="userName" id="userName">
				<label>密码：</label>
				<input type="password" name="password" id="password">
				<button class="btn" type="submit">登&nbsp;&nbsp;录</button>
			</form>
		</div>
	</body>
	<script type="text/javascript">
		var login = "<%=login%>";
		if (login == "failure") {
			alert("用户名或密码不正确");
		}
	</script>
</html>