<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.codebrew.moana.service.domain.*" %>
<%
	
	User user = new User();
	user.setUserId("lgj1522@gmail.com");
	user.setNickname("�����");
	
	request.setAttribute("user", user);
	
%>