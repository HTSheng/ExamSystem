<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//查看用户登录状态，若未登录则跳转至登录页面
	String login = (String)session.getAttribute("login");
	if (!"success".equals(login)) {
		response.sendRedirect(request.getContextPath() + "/logout.jsp");
	}
%>