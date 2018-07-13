<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//清除缓存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="css/login.css">
		<title>用户未登录</title>
	</head>
	<body>
		<div id="logout">
			<img alt="未登录" src="image/logout.png">
			<h2>您还未登录系统<br><a href="index.jsp" target="_parent">前往登录</a></h2>
		</div>
	</body>
</html>