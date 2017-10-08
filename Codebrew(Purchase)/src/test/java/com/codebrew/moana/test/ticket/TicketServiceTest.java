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
 * ¤· JUnit4 (Test Framework) °ú Spring Framework ÅëÇÕ Test( Unit Test)
 * ¤· Spring Àº JUnit 4¸¦ À§ÇÑ Áö¿ø Å¬·¡½º¸¦ ÅëÇØ ½ºÇÁ¸µ ±â¹İ ÅëÇÕ Å×½ºÆ® ÄÚµå¸¦ ÀÛ¼º ÇÒ ¼ö ÀÖ´Ù.
 * ¤· @RunWith : Meta-data ¸¦ ÅëÇÑ wiring(»ı¼º,DI) ÇÒ °´Ã¼ ±¸ÇöÃ¼ ÁöÁ¤
 * ¤· @ContextConfiguration : Meta-data location ÁöÁ¤
 * ¤· @Test : Å×½ºÆ® ½ÇÇà ¼Ò½º ÁöÁ¤
 */
@RunWith(SpringJUnit4ClassRunner.class)

// ==> Meta-Data ¸¦ ´Ù¾çÇÏ°Ô Wiring ÇÏÀÚ...
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
		festival.setFestivalNo(10021); // 2017 ºÒ²É ÃàÁ¦
		// festival.setFestivalName("2017 ºÒ²É ÃàÁ¦");
		//festival.setFestivalNo(10002); // ¸ÆÁÖ ¹ö¼¸ ÃàÁ¦

		Party party = new Party();
		party.setPartyNo(10020); // °¡Á¾ÆÄÆ¼
		//party.setPartyNo(10001); // ²¿²¿¸¶¶û ³îÀÚ
		
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
		festival.setFestivalNo(10006); // 2017 ºÒ²É ÃàÁ¦
		// festival.setFestivalName("2017 ºÒ²É ÃàÁ¦");
		//festival.setFestivalNo(10002); // ¸ÆÁÖ ¹ö¼¸ ÃàÁ¦

		Party party = new Party();
		party.setPartyNo(10000); // ¼¿¸ùÀÇ ÆÄÆ¼
		//party.setPartyNo(10001); // ²¿²¿¸¶¶û ³îÀÚ
		
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
		festival.setFestivalNo(10006); // 2017 ºÒ²É ÃàÁ¦
		// festival.setFestivalName("2017 ºÒ²É ÃàÁ¦");
		//festival.setFestivalNo(10002); // ¸ÆÁÖ ¹ö¼¸ ÃàÁ¦

		Party party = new Party();
		party.setPartyNo(10000); // ¼¿¸ùÀÇ ÆÄÆ¼
		//party.setPartyNo(10001); // ²¿²¿¸¶¶û ³îÀÚ
		
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
		festival.setFestivalNo(10006); // 2017 ºÒ²É ÃàÁ¦
		// festival.setFestivalName("2017 ºÒ²É ÃàÁ¦");
		//festival.setFestivalNo(10002); // ¸ÆÁÖ ¹ö¼¸ ÃàÁ¦

		Party party = new Party();
		party.setPartyNo(10000); // ¼¿¸ùÀÇ ÆÄÆ¼
		//party.setPartyNo(10001); // ²¿²¿¸¶¶û ³îÀÚ
		
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