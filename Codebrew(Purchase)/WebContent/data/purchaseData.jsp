<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.codebrew.moana.service.domain.*" %>
<%
	
	User user = new User();
	user.setUserId("lgj1522@gmail.com");
	user.setNickname("�����");
	
	Festival festival = new Festival();
	festival.setFestivalNo(10002);
	festival.setFestivalName("2017 �Ҳ� ����");
	festival.setAddr("��⵵ ������ �д籸 188");
	festival.setStartDate("20170909");
	festival.setEndDate("20170910");
	festival.setFestivalImage("http://tong.visitkorea.or.kr/cms/resource/18/1999118_image2_1.jpg");
	festival.setTicketCount(40);
	festival.setTicketPrice(5600);
	
	Ticket ticket = new Ticket();
	ticket.setFestival(festival);
	
	QRCode qrCode = new QRCode();
	qrCode.setQrCodeImage("qrcode.png");
	
	Purchase purchase = new Purchase();
	purchase.setUser(user);
	//purchase.setFestival(festival);
	purchase.setTicket(ticket);
	purchase.setQrCode(qrCode);
	purchase.setTid("T2407444030137217754");
	purchase.setPurchaseNo(10057);
	purchase.setPurchaseCount(2);
	purchase.setTranCode("1");
	purchase.setItemName(festival.getFestivalName());
	
	request.setAttribute("purchase", purchase);
	
%>