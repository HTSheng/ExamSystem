<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.exam.question.QuestionService" %>
<%@ page import="com.exam.question.Question" %>
<%@ page import="com.exam.answer.AnswerService" %>
<%@ page import="com.exam.answer.Answer" %>
<%@ page import="com.exam.user.UserService" %>
<%@ page import="com.exam.user.User" %>
<%@ include file="/checkLogin.jsp" %>
<%
	//清除缓存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	
	String contextPath = request.getContextPath();
	//获取试题列表
	QuestionService qService = new QuestionService();
	AnswerService aService = new AnswerService();
	UserService uService = new UserService();
	List<Question> list = qService.getQuestionList();
	//获取学生个人信息
	String stuCode = request.getParameter("stuCode");
	User student = uService.getUser(stuCode);
	String stuName = student.getRealName();
	//获取登录人员信息
	String userCode = request.getParameter("userCode");
	User user = uService.getUser(userCode);
	String identity = user.getIdentity();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<base target="_self">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=contextPath%>/css/list.css">
		<title>学生作答</title>
		<style>
			div.header {
				margin-left: 100px;
				margin-right: 100px;
				text-align: center;
			}
		</style>
	</head>
	<body>
		<%if(!"学生".equals(identity)) { %>
		<div class="header">
			<h2>学号：<%=stuCode %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名：<%=stuName %></h2>
		</div>
		<%} %>
		<table id="question">
			<thead>
				<tr>
					<th>编号</th>
					<th>类型</th>
					<th>难度</th>
					<th>分数</th>
					<th>状态</th>
					<th>得分</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="data">
			</tbody>
		</table>
		<div class="footer">
			<button onclick="refresh()">刷新</button>
			<button onclick="firstPage()">首页</button>
			<button onclick="pageUp()">上一页</button>
			<button onclick="pageDown()">下一页</button>
			<button onclick="lastPage()">尾页</button>
			<label>&nbsp;&nbsp;第</label>
			<input size="1" id="curPage" style="text-align:center;">
			<label id="totalPage"></label>
			<button onclick="pageJump()">跳转</button>
			<label>&nbsp;&nbsp;每页</label>
			<input size="1" id="pageSize" style="text-align:center;">
			<label>条</label>
			<button onclick="setPageSize()">设置</button>
			<label id="totalNum"></label>
		</div>
		<a id="reload" href="answerList.jsp?userCode=<%=userCode %>&stuCode=<%=stuCode %>" style="display:none"></a>
	</body>
	<script type="text/javascript">
		window.onload = loadData;
		
		//将读取到的数据存入json变量
		var data = [
		<%for(int i = 0; i < list.size(); i++) {
			Question question = list.get(i);
			if(i != list.size() - 1){%>
				{code: "<%=question.getCode()%>", type: "<%=question.getType()%>", difficulty: "<%=question.getDifficulty()%>", 
					point: "<%=question.getPoint()%>", status: "<%=aService.ifCodeExist(stuCode + "-" + question.getCode()) ? "已答" : "未答"%>",
					mark: "<%=aService.ifCodeExist(stuCode + "-" + question.getCode()) && aService.getAnswer(stuCode + "-" + question.getCode()).getFlag() == 1 ? aService.getAnswer(stuCode + "-" + question.getCode()).getMark() : ""%>"},
			<%}else{%>
				{code: "<%=question.getCode()%>", type: "<%=question.getType()%>", difficulty: "<%=question.getDifficulty()%>", 
					point: "<%=question.getPoint()%>", status: "<%=aService.ifCodeExist(stuCode + "-" + question.getCode()) ? "已答" : "未答"%>",
					mark: "<%=aService.ifCodeExist(stuCode + "-" + question.getCode()) && aService.getAnswer(stuCode + "-" + question.getCode()).getFlag() == 1 ? aService.getAnswer(stuCode + "-" + question.getCode()).getMark() : ""%>"}
		<%}}%>
		];
		
		var odd = true;//奇偶行标识
		var totalNum = <%=list.size()%>;//总条数
		var pageSize = 10;//每页显示条数，初始时为10
		var totalPage;//总页数
		var curPage = 1;//当前页码，初始时为1
		
		/*
		 * 加载数据
		 */
		function loadData() {
			odd = true;
			totalPage = (totalNum % pageSize == 0) ? totalNum / pageSize : Math.floor(totalNum / pageSize) + 1;
			var tbody = document.getElementById("data");
			//清空表格
		    trs = tbody.getElementsByTagName("tr");
		    for(var i = trs.length - 1; i >= 0; i--) {
		        tbody.deleteRow(i);
		    }
		    //填充数据
			for(var j = (curPage - 1) * pageSize; j < data.length && j < curPage * pageSize; j++) {
				var trow = getDataRow(data[j]);
				tbody.appendChild(trow);
			}
			document.getElementById("curPage").value = curPage;
			document.getElementById("totalPage").innerHTML = "&nbsp;/&nbsp;" + totalPage + "&nbsp;页";
			document.getElementById("pageSize").value = pageSize;
			document.getElementById("totalNum").innerHTML = "&nbsp;&nbsp;共&nbsp;" + totalNum + "&nbsp;条";
		}
		
		/*
		 * 获取每行信息并添加到表格中
		 */
		function getDataRow(h) {
			var row = document.createElement("tr");
			//实现相邻行的颜色不同
			if(!odd) {
				row.setAttribute("class", "alt");
				odd = true;
			}else {
				odd = false;
			}
			//创建单元格并填充数据
			var codeCell = document.createElement("td");
			codeCell.innerHTML = h.code;
			row.appendChild(codeCell);
			var typeCell = document.createElement("td");
			typeCell.innerHTML = h.type;
			row.appendChild(typeCell);
			var difficultyCell = document.createElement("td");
			difficultyCell.innerHTML = h.difficulty;
			row.appendChild(difficultyCell);
			var pointCell = document.createElement("td");
			pointCell.innerHTML = h.point;
			row.appendChild(pointCell);
			var statusCell = document.createElement("td");
			statusCell.innerHTML = h.status;
			row.appendChild(statusCell);
			var markCell = document.createElement("td");
			markCell.innerHTML = h.mark;
			row.appendChild(markCell);
			//创建操作单元格并填充按钮
			var opeCell = document.createElement("td");
			var btnMark = document.createElement("input");
			btnMark.setAttribute("type", "button");
			btnMark.setAttribute("value", "评分");
			//点击按钮时触发事件，弹出答题页面
			btnMark.onclick = function(){
				var url = "mark.jsp?stuCode=<%=stuCode%>&quesCode=" + h.code;
				open(url, "", "width=650, height=800");
				//refresh();
			};
			var btnView = document.createElement("input");
			btnView.setAttribute("type", "button");
			btnView.setAttribute("value", "查看");
			//点击按钮时触发事件，弹出答题页面
			btnView.onclick = function(){
				var url = "view.jsp?stuCode=<%=stuCode%>&quesCode=" + h.code;
				open(url, "", "width=650, height=800");
			};
			if(h.status == "已答"){
				<%if(identity.equalsIgnoreCase("学生")) {%>
				opeCell.appendChild(btnView);
				<%}else {%>
				opeCell.appendChild(btnMark);
				<%}%>
			}
			row.appendChild(opeCell);
			return row;
		}
		
		/*
		 * 刷新页面
		 */
		function refresh() {
			reload.click();
		}
		
		/*
		 * 页面跳转
		 */
		function pageJump() {
			curPage = document.getElementById("curPage").value;
			if(curPage < 1 || curPage > totalPage) {
				alert("页码已超出范围");
			}else {
				loadData();
			}
		}
		
		/*
		 * 跳转至首页
		 */
		function firstPage() {
			curPage = 1;
			loadData();
		}
		
		/*
		 * 跳转至上一页
		 */
		function pageUp() {
			if(curPage == 1) {
				alert("当前已是最前页");
			} else {
				curPage--;
				loadData();
			}
		}
		
		/*
		 * 跳转至下一页
		 */
		function pageDown() {
			if(curPage == totalPage) {
				alert("当前已是最末页");
			} else {
				curPage++;
				loadData();
			}
		}
		
		/*
		 * 跳转至尾页
		 */
		function lastPage() {
			curPage = totalPage;
			loadData();
		}
		
		/*
		 * 设置每页条数
		 */
		function setPageSize() {
			pageSize = document.getElementById("pageSize").value;
			loadData();
		}
	</script>
</html>