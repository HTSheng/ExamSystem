<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.exam.question.QuestionService" %>
<%@ page import="com.exam.question.Question" %>
<%@ include file="/checkLogin.jsp" %>
<%
	//清除缓存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	
	String contextPath = request.getContextPath();
	//获取试题信息
	String code = request.getParameter("code");
	QuestionService service = new QuestionService();
	Question question = service.getQuestion(code);
	String type = question.getType();
	String difficulty = question.getDifficulty();
	String content = question.getContent();
	String answer = question.getAnswer();
	int point = question.getPoint();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=contextPath%>/css/form.css">
		<title>查看试题</title>
		<base target="_self">
	</head>
	<body>
		<div class="header">
			<h2>查看试题</h2>
		</div>
		<form name="questionForm">
			<table>
				<tr>
					<td class="label"><label>编号：</label></td>
					<td><input type="text" name="code" id="code" value="<%=code %>" readOnly></td>
				</tr>
				<tr>
					<td class="label"><label>类型：</label></td>
					<td><input type="text" name="type" id="type" value="<%=type %>" readOnly></td>
				</tr>
				<tr>
					<td class="label"><label>难度：</label></td>
					<td><input type="text" name="difficulty" id="difficulty" value="<%=difficulty %>" readOnly></td>
				</tr>
				<tr>
					<td class="label"><label>题目内容：</label></td>
					<td><textarea name="content" id="content" readOnly><%=content %></textarea></td>
				</tr>
				<tr>
					<td class="label"><label>参考答案：</label></td>
					<td><textarea name="answer" id="answer" readOnly><%=answer %></textarea></td>
				</tr>
				<tr>
					<td class="label"><label>分数：</label></td>
					<td><input type="text" name="point" id="point" value="<%=point %>" readOnly></td>
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