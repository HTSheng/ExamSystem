<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.exam.user.UserService" %>
<%@ page import="com.exam.user.User" %>
<%@ include file="/checkLogin.jsp" %>
<%
	//清除缓存
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	
	String contextPath = request.getContextPath();
	//获取登录人员信息
	String userCode = request.getParameter("userCode");
	//获取用户列表
	UserService service = new UserService();
	List<User> list = service.getUserList();
	int totalNum = 0;
	List<User> stuList = new LinkedList<User>();
	for(int i = 0; i < list.size(); i++) {
		if(list.get(i).getIdentity().equalsIgnoreCase("学生")) {
			totalNum++;
			stuList.add(list.get(i));
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%=contextPath%>/css/list.css">
		<title>成绩管理</title>
	</head>
	<body>
		<table id="question">
			<thead>
				<tr>
					<th>学号</th>
					<th>姓名</th>
					<th>性别</th>
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
	</body>
	<script type="text/javascript">
		window.onload = loadData;
		
		//将读取到的数据存入json变量
		var data = [
		<%for(int i = 0; i < stuList.size(); i++) {
			User user = stuList.get(i);
			if(user.getIdentity().equalsIgnoreCase("学生") && i != stuList.size() - 1) {%>
				{code: "<%=user.getCode()%>", realName: "<%=user.getRealName()%>", gender: "<%=user.getGender()%>"},
			<%}else if(user.getIdentity().equalsIgnoreCase("学生")) {%>
				{code: "<%=user.getCode()%>", realName: "<%=user.getRealName()%>", gender: "<%=user.getGender()%>"}
		<%}}%>
		];
		
		var odd = true;//奇偶行标识
		var totalNum = <%=totalNum%>;//总条数
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
			var realNameCell = document.createElement("td");
			realNameCell.innerHTML = h.realName;
			row.appendChild(realNameCell);
			var genderCell = document.createElement("td");
			genderCell.innerHTML = h.gender;
			row.appendChild(genderCell);
			//创建操作单元格并填充按钮
			var opeCell = document.createElement("td");
			var btnMark = document.createElement("input");
			btnMark.setAttribute("type", "button");
			btnMark.setAttribute("value", "评阅");
			//点击按钮时触发事件，弹出评阅页面
			btnMark.onclick = function(){
				var url = "answerList.jsp?userCode=<%=userCode%>&stuCode=" + h.code;
				open(url, "", "width=1000, height=550");
			};
			opeCell.appendChild(btnMark);
			row.appendChild(opeCell);
			return row;
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