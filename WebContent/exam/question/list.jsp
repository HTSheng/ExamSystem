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
	//获取试题列表
	QuestionService service = new QuestionService();
	List<Question> list = service.getQuestionList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=contextPath%>/css/list.css">
		<title>试题信息管理</title>
	</head>
	<body>
		<table id="question">
			<thead>
				<tr>
					<th>编号</th>
					<th>类型</th>
					<th>难度</th>
					<th>分数</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="data">
			</tbody>
		</table>
		<div class="footer">
			<button onclick="addData()">添加试题</button>
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
		<form name="deleteForm" action="deleteQuestion" method="get">
			<input type="hidden" name="code" id="code">
		</form>
	</body>
	<script type="text/javascript">
		window.onload = loadData;
		
		//将读取到的数据存入json变量
		var data = [
		<%for(int i = 0; i < list.size(); i++) {
			Question question = list.get(i);
			if(i != list.size() - 1){%>
				{code: "<%=question.getCode()%>", type: "<%=question.getType()%>", difficulty: "<%=question.getDifficulty()%>", point: "<%=question.getPoint()%>"},
			<%}else{%>
				{code: "<%=question.getCode()%>", type: "<%=question.getType()%>", difficulty: "<%=question.getDifficulty()%>", point: "<%=question.getPoint()%>"}
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
			//创建操作单元格并填充按钮
			var opeCell = document.createElement("td");
			var btnView = document.createElement("input");
			btnView.setAttribute("type", "button");
			btnView.setAttribute("value", "查看");
			//点击按钮时触发事件，弹出查看页面
			btnView.onclick = function(){
				var url = "view.jsp?code=" + h.code;
				open(url, "", "width=650, height=620");
			};
			opeCell.appendChild(btnView);
			var btnEdit = document.createElement("input");
			btnEdit.setAttribute("type", "button");
			btnEdit.setAttribute("value", "修改");
			//点击按钮时触发事件，弹出修改页面
			btnEdit.onclick = function(){
				var url = "edit.jsp?code=" + h.code;
				open(url, "", "width=660, height=620");
			};
			opeCell.appendChild(btnEdit);
			var btnDel = document.createElement("input");
			btnDel.setAttribute("type", "button");
			btnDel.setAttribute("value", "删除");
			//点击按钮时触发事件，删除当前数据
			btnDel.onclick = function(){
				if(confirm("是否要删除该试题？")){
					document.deleteForm.code.value = h.code;
					document.deleteForm.submit();
					alert("删除成功");
					refresh();
				}
			}
			opeCell.appendChild(btnDel);
			row.appendChild(opeCell);
			return row;
		}
		
		/*
		 * 弹出添加页面
		 */
		function addData() {
			open("add.jsp", "", "width=660, height=620");
		}
		
		/*
		 * 刷新页面
		 */
		function refresh() {
			location.reload();
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