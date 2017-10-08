package com.codebrew.moana.test.ticket;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.codebrew.moana.service.domain.Festival;
import com.codebrew.moana.service.domain.Party;
import com.codebrew.moana.service.domain.Purchase;
import com.codebrew.moana.service.domain.Ticket;
import com.codebrew.moana.service.ticket.TicketDAO;
import com.codebrew.moana.service.ticket.TicketService;

import junit.framework.Assert;

/*
 *	FileName :  UserServiceTest.java
 * �� JUnit4 (Test Framework) �� Spring Framework ���� Test( Unit Test)
 * �� Spring �� JUnit 4�� ���� ���� Ŭ������ ���� ������ ��� ���� �׽�Ʈ �ڵ带 �ۼ� �� �� �ִ�.
 * �� @RunWith : Meta-data �� ���� wiring(����,DI) �� ��ü ����ü ����
 * �� @ContextConfiguration : Meta-data location ����
 * �� @Test : �׽�Ʈ ���� �ҽ� ����
 */
@RunWith(SpringJUnit4ClassRunner.class)

// ==> Meta-Data �� �پ��ϰ� Wiring ����...
@ContextConfiguration(locations = { "classpath:config/context-*.xml" })

// @ContextConfiguration(locations = { "classpath:config/context-common.xml" })
public class TicketServiceTest {

	@Autowired
	@Qualifier("ticketDAOImpl")
	TicketDAO ticketDAO;
	
	@Autowired
	@Qualifier("ticketServiceImpl")
	TicketService ticketService;

	//@Test
	public void addTicket() {

		Festival festival = new Festival();
		festival.setFestivalNo(10021); // 2017 �Ҳ� ����
		// festival.setFestivalName("2017 �Ҳ� ����");
		//festival.setFestivalNo(10002); // ���� ���� ����

		Party party = new Party();
		party.setPartyNo(10020); // ������Ƽ
		//party.setPartyNo(10001); // �������� ����
		
		Ticket ticket = new Ticket();
		//ticket.setFestival(festival);
		ticket.setParty(party);
		ticket.setTicketCount(10);
		ticket.setTicketPrice(500);
		
		//int result = ticketDAO.addTicket(ticket);
		
		//Assert.assertEquals(1, result);
		Ticket returnTicket = ticketService.addTicket(ticket);
		
		Assert.assertEquals(500, returnTicket.getTicketPrice());
		Assert.assertEquals(10, returnTicket.getTicketCount());
	}
	
	//@Test
	public void getTicket() {
		
		Festival festival = new Festival();
		festival.setFestivalNo(10006); // 2017 �Ҳ� ����
		// festival.setFestivalName("2017 �Ҳ� ����");
		//festival.setFestivalNo(10002); // ���� ���� ����

		Party party = new Party();
		party.setPartyNo(10000); // ������ ��Ƽ
		//party.setPartyNo(10001); // �������� ����
		
		Ticket ticket = new Ticket();
		//ticket.setFestival(festival);
		ticket.setParty(party);
		//ticket.setTicketCount(10);
		//ticket.setTicketPrice(500);
		
		//Ticket returnTicket = ticketDAO.getTicket(ticket);
		
		//Assert.assertEquals(500, returnTicket.getTicketPrice());
		//Assert.assertEquals(10, returnTicket.getTicketCount());
		
		Ticket returnTicket = ticketService.getTicket(festival.getFestivalNo(), "1");
		
		Assert.assertEquals(500, returnTicket.getTicketPrice());
		Assert.assertEquals(10, returnTicket.getTicketCount());
	}
	
	@Test
	public void getTicketByTicketNo() {
		
		Ticket ticket = new Ticket();
		ticket.setTicketNo(10018);
		
		Ticket returnTicket = ticketDAO.getTicketByTicketNo(ticket.getTicketNo());
		
		Assert.assertEquals(ticket.getTicketNo(), returnTicket.getTicketNo());
		Assert.assertEquals(4444, returnTicket.getTicketPrice());
	}
	
	//@Test
	public void updateTicket() {
		Festival festival = new Festival();
		festival.setFestivalNo(10006); // 2017 �Ҳ� ����
		// festival.setFestivalName("2017 �Ҳ� ����");
		//festival.setFestivalNo(10002); // ���� ���� ����

		Party party = new Party();
		party.setPartyNo(10000); // ������ ��Ƽ
		//party.setPartyNo(10001); // �������� ����
		
		Ticket ticket = new Ticket();
		//ticket.setFestival(festival);
		ticket.setTicketPrice(4444);
		//ticket.setTicketCount(33);
		ticket.setParty(party);
		
		//int result = ticketDAO.updateTicket(ticket);
		
		//Assert.assertEquals(1, result);
		
		Ticket returnTicket = ticketService.updateTicket(ticket);
		
		Assert.assertEquals(4444, returnTicket.getTicketPrice());
		Assert.assertEquals(100, returnTicket.getTicketCount());
		
	}
	
	//@Test
	public void updateTicketCount() {
		
		Festival festival = new Festival();
		festival.setFestivalNo(10006); // 2017 �Ҳ� ����
		// festival.setFestivalName("2017 �Ҳ� ����");
		//festival.setFestivalNo(10002); // ���� ���� ����

		Party party = new Party();
		party.setPartyNo(10000); // ������ ��Ƽ
		//party.setPartyNo(10001); // �������� ����
		
		Purchase purchase = new Purchase();
		purchase.setPurchaseCount(3);
		Ticket ticket = new Ticket();
		ticket.setTicketNo(10011);
		//ticket.setFestival(festival);
		//ticket.setTicketPrice(4444);
		ticket.setTicketCount(33-purchase.getPurchaseCount());
		ticket.setParty(party);
		
		int result = ticketDAO.updateTicketCount(ticket);
		
		Assert.assertEquals(1, result);
	}
	
}