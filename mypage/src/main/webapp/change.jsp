<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mypage.memberDAO" %>
<%@ page import="java.sql.*, javax.sql.*, javax.naming.*" %>
<%request.setCharacterEncoding("utf-8");%>

<%
	String login_id = (String) session.getAttribute("login_id");
	String newName = request.getParameter("name");
	String newPass = request.getParameter("new-pass");
	
	memberDAO.modifyPass(login_id, newName, newPass);
	
%>