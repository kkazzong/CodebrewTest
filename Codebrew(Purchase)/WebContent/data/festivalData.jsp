<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.codebrew.moana.service.domain.*" %>
<%
	
	Festival festival = new Festival();
	festival.setFestivalNo(10002);
	festival.setFestivalName("2017 불꽃 축제");
	festival.setAddr("경기도 성남시 분당구 188");
	festival.setFestivalImage("http://tong.visitkorea.or.kr/cms/resource/18/1999118_image2_1.jpg");
	festival.setTicketCount(40);
	festival.setTicketPrice(5600);
	
	request.setAttribute("festival", festival);
	
%>