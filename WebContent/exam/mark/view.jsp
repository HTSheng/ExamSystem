<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.exam.question.QuestionService" %>
<%@ page import="com.exam.question.Question" %>
<%@ page import="com.exam.answer.AnswerService" %>
<%@ page import="com.exam.answer.Answer" %>
<%@ include file="/checkLogin.jsp" %>
<%
	//清除缓存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	
	String contextPath = request.getContextPath();
	//获取试题信息
	String quesCode = request.getParameter("quesCode");
	QuestionService qService = new QuestionService();
	Question question = qService.getQuestion(quesCode);
	String type = question.getType();
	String difficulty = question.getDifficulty();
	int point = question.getPoint();
	String content = question.getContent();
	String answer = question.getAnswer();
	AnswerService aService = new AnswerService();
	String stuCode = request.getParameter("stuCode");//学号
	String code = stuCode + "-" + quesCode;
	//获取答题信息
	Answer answerEntity = aService.getAnswer(code);
	String stuAnswer = answerEntity.getAnswer();
	int flag = answerEntity.getFlag();
	String mark = "";
	if(flag == 1)
		mark = Integer.toString(answerEntity.getMark());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=contextPath%>/css/form.css">
		<title>试题评阅</title>
		<base target="_self">
	</head>
	<body>
		<div class="header">
			<h2>答题情况</h2>
		</div>
		<form name="questionForm">
			<table>
				<tr>
					<td class="label"><label>编号：</label></td>
					<td><input type="text" name="quesCode" id="quesCode" value="<%=quesCode %>" readOnly></td>
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
					<td class="label"><label>分数：</label></td>
					<td><input type="text" name="point" id="point" value="<%=point %>" readOnly></td>
				</tr>
				<tr>
					<td class="label"><label>题目内容：</label></td>
					<td><textarea rows="5" cols="" name="content" id="content" readOnly><%=content %></textarea></td>
				</tr>
				<tr>
					<td class="label"><label>参考答案：</label></td>
					<td><textarea rows="5" cols="" name="answer" id="answer" readOnly><%=answer %></textarea></td>
				</tr>
				<tr>
					<td class="label"><label>学生作答：</label></td>
					<td><textarea rows="5" cols="" name="stuAnswer" id="stuAnswer" readOnly><%=stuAnswer %></textarea></td>
				</tr>
				<tr>
					<td class="label"><label>得分：</label></td>
					<td><input type="text" name="mark" id="mark" value="<%=mark %>" readOnly></td>
				</tr>
			</table>
			<input type="hidden" name="stuCode" id="stuCode" value="<%=stuCode %>">
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