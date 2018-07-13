<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.exam.user.UserService" %>
<%@ page import="com.exam.user.User" %>
<%@ include file="/checkLogin.jsp" %>
<%
	//清除缓存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	
	String contextPath = request.getContextPath();
	//获取登录用户信息
	User user = (User)session.getAttribute("user");
	String realName = "", identity = "", userCode = "";
	if (user != null) {
		realName = user.getRealName();
		identity = user.getIdentity();
		userCode = user.getCode();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=contextPath%>/css/toolbar.css">
		<title>导航栏</title>
	</head>
	<body>
		<div class="word">
			<img alt="考试" src="../image/exam.png" height="35px">
			<label>&nbsp;考试管理系统</label>
		</div>
		<div class="toolbar">
			<ul>
				<li><a href="welcome.jsp" target="showframe">
					<img alt="首页" src="../image/welcome.png">首页
				</a></li>
				<%if (identity.equalsIgnoreCase("管理员")) { %>
				<li><a href="question/list.jsp" target="showframe">
					<img alt="试题管理" src="../image/question.png">试题管理
				</a></li>
				<li><a href="user/list.jsp" target="showframe">
					<img alt="用户管理" src="../image/user.png">用户管理
				</a></li>
				<%} else if (identity.equalsIgnoreCase("教师")) { %>
				<li><a href="question/list.jsp" target="showframe">
					<img alt="试题管理" src="../image/question.png">试题管理
				</a></li>
				<li><a href="mark/stuList.jsp?userCode=<%=userCode %>" target="showframe">
					<img alt="成绩管理" src="../image/mark.png">成绩管理
				</a></li>
				<%} else if (identity.equalsIgnoreCase("学生")) { %>
				<li><a href="answer/list.jsp?stuCode=<%=userCode %>" target="showframe">
					<img alt="开始答题" src="../image/answer.png">开始答题
				</a></li>
				<li><a href="mark/answerList.jsp?userCode=<%=userCode %>&stuCode=<%=userCode %>" target="showframe">
					<img alt="查询成绩" src="../image/query.png">查询成绩
				</a></li>
				<%} %>
				<li style="float:right;"><a href="#" onclick="exit()">
					<img alt="退出" src="../image/exit.png">退出
				</a></li>
				<li style="float:right;width:180px;">欢迎您，<%=realName%></li>
			</ul>
		</div>
	</body>
	<script type="text/javascript">
		/*
		 * 退出系统，返回登录界面
		 */
		function exit() {
			parent.location.href = "../logout";
		}
	</script>
</html>