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

	String result = (String)request.getAttribute("result");//保存结果
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=contextPath%>/css/form.css">
		<title>修改试题</title>
		<base target="_self">
		</head>
	<body>
		<div class="header">
			<h2>修改试题</h2>
		</div>
		<form name="questionForm" action="editQuestion" method="post">
			<table>
				<tr>
					<td class="label"><label>编号：</label></td>
					<td><input type="text" name="code" id="code" value="<%=code %>" readOnly></td>
				</tr>
				<tr>
					<td class="label"><label>类型：</label></td>
					<td><select name="type" id="type">
						<%if(type.equalsIgnoreCase("选择题")) { %>
						<option value="选择题" selected>选择题</option>
						<option value="填空题">填空题</option>
						<option value="简答题">简答题</option>
						<option value="论述题">论述题</option>
						<%} else if(type.equalsIgnoreCase("填空题")) { %>
						<option value="选择题">选择题</option>
						<option value="填空题" selected>填空题</option>
						<option value="简答题">简答题</option>
						<option value="论述题">论述题</option>
						<%} else if(type.equalsIgnoreCase("简答题")) { %>
						<option value="选择题">选择题</option>
						<option value="填空题">填空题</option>
						<option value="简答题" selected>简答题</option>
						<option value="论述题">论述题</option>
						<%} else if(type.equalsIgnoreCase("论述题")) { %>
						<option value="选择题">选择题</option>
						<option value="填空题">填空题</option>
						<option value="简答题">简答题</option>
						<option value="论述题" selected>论述题</option>
						<%} else {%>
						<option value="">--请选择--</option>
						<option value="选择题">选择题</option>
						<option value="填空题">填空题</option>
						<option value="简答题">简答题</option>
						<option value="论述题">论述题</option>
						<%} %>
					</select></td>
				</tr>
				<tr>
					<td class="label"><label>难度：</label></td>
					<td><select name="difficulty" id="difficulty">
						<%if(difficulty.equalsIgnoreCase("★")) { %>
						<option value="★" selected>★</option>
						<option value="★★">★★</option>
						<option value="★★★">★★★</option>
						<option value="★★★★">★★★★</option>
						<option value="★★★★★">★★★★★</option>
						<%} else if(difficulty.equalsIgnoreCase("★★")) { %>
						<option value="★">★</option>
						<option value="★★" selected>★★</option>
						<option value="★★★">★★★</option>
						<option value="★★★★">★★★★</option>
						<option value="★★★★★">★★★★★</option>
						<%} else if(difficulty.equalsIgnoreCase("★★★")) { %>
						<option value="★">★</option>
						<option value="★★">★★</option>
						<option value="★★★" selected>★★★</option>
						<option value="★★★★">★★★★</option>
						<option value="★★★★★">★★★★★</option>
						<%} else if(difficulty.equalsIgnoreCase("★★★★")) { %>
						<option value="★">★</option>
						<option value="★★">★★</option>
						<option value="★★★">★★★</option>
						<option value="★★★★" selected>★★★★</option>
						<option value="★★★★★">★★★★★</option>
						<%} else if(difficulty.equalsIgnoreCase("★★★★★")) { %>
						<option value="★">★</option>
						<option value="★★">★★</option>
						<option value="★★★">★★★</option>
						<option value="★★★★">★★★★</option>
						<option value="★★★★★" selected>★★★★★</option>
						<%} else {%>
						<option value="">--请选择--</option>
						<option value="★">★</option>
						<option value="★★">★★</option>
						<option value="★★★">★★★</option>
						<option value="★★★★">★★★★</option>
						<option value="★★★★★">★★★★★</option>
						<%} %>
					</select></td>
				</tr>
				<tr>
					<td class="label"><label>题目内容：</label></td>
					<td><textarea name="content" id="content"><%=content %></textarea></td>
				</tr>
				<tr>
					<td class="label"><label>参考答案：</label></td>
					<td><textarea name="answer" id="answer"><%=answer %></textarea></td>
				</tr>
				<tr>
					<td class="label"><label>分数：</label></td>
					<td><input type="text" name="point" id="point" value="<%=point %>"></td>
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
				document.questionForm.submit();
			}
		}

		/**
		 * 检查表单信息
		 */
		function checkForm() {
			var code = document.questionForm.code.value;
			var type = document.questionForm.type.value;
			var difficulty = document.questionForm.difficulty.value;
			var content = document.questionForm.content.value;
			var answer = document.questionForm.answer.value;
			var point = document.questionForm.point.value;
			if (code == "" || type == "" || difficulty == "" || content == "" || answer == "" || point == "") {
				alert("存在未填写的项目");
				return false;
			}
			if (!(/(^[1-9]\d*$)/.test(point))) {
				alert("分数需为正整数");
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