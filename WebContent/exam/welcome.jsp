<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/checkLogin.jsp" %>
<%
	//清除缓存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=contextPath%>/css/welcome.css">
		<title>欢迎页</title>
	</head>
	<body>
		<div id="welcome">
			<h2>欢迎使用考试管理系统</h2>
			<h3>本系统的主要功能：</h3>
			<h3>1.试题信息管理：教师可在系统内进行试题信息的维护；</h3>
			<h3>2.学生考试功能：考生可在系统内进行在线考试；</h3>
			<h3>3.考试成绩管理：教师可进行考试成绩的维护，考生可查看成绩；</h3>
			<h3>4.用户信息管理：用户信息的维护，由管理员负责维护。</h3>
		</div>
	</body>
</html>