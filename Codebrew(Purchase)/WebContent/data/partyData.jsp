<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.codebrew.moana.service.domain.*" %>
<%
	
	Party party = new Party();
	party.setPartyNo(10001);
	party.setPartyName("����������Ƽ");
	party.setPartyImage("http://tong.visitkorea.or.kr/cms/resource/18/1999118_image2_1.jpg");
	party.setPartyPlace("�����κ��� ����");
	party.setTicketCount(35);
	party.setTicketPrice(50000);
	
	request.setAttribute("party", party);
	
%>