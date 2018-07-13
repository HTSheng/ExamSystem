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
	String result = (String)request.getAttribute("result");//保存结果
	String errMsg = (String)request.getAttribute("errMsg");//错误信息
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=contextPath%>/css/form.css">
		<title>添加试题</title>
		<style type="text/css">
			
		</style>
		<base target="_self">
	</head>
	<body>
		<div class="header">
			<h2>添加试题</h2>
		</div>
		<form name="questionForm" action="addQuestion" method="post">
			<table>
				<tr>
					<td class="label"><label>编号：</label></td>
					<td><input type="text" name="code" id="code"></td>
				</tr>
				<tr>
					<td class="label"><label>类型：</label></td>
					<td><select name="type" id="type">
						<option value="">--请选择--</option>
						<option value="选择题">选择题</option>
						<option value="填空题">填空题</option>
						<option value="简答题">简答题</option>
						<option value="论述题">论述题</option>
					</select></td>
				</tr>
				<tr>
					<td class="label"><label>难度：</label></td>
					<td><select name="difficulty" id="difficulty">
						<option value="">--请选择--</option>
						<option value="★">★</option>
						<option value="★★">★★</option>
						<option value="★★★">★★★</option>
						<option value="★★★★">★★★★</option>
						<option value="★★★★★">★★★★★</option>
					</select></td>
				</tr>
				<tr>
					<td class="label"><label>题目内容：</label></td>
					<td><textarea name="content" id="content"></textarea></td>
				</tr>
				<tr>
					<td class="label"><label>参考答案：</label></td>
					<td><textarea name="answer" id="answer"></textarea></td>
				</tr>
				<tr>
					<td class="label"><label>分数：</label></td>
					<td><input type="text" name="point" id="point" onchange="checkForm()"></td>
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
			} else if (result == "failure") {
				alert("<%=errMsg%>");
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