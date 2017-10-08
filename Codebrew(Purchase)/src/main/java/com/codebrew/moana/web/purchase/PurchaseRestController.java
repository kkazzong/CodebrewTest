package com.codebrew.moana.web.purchase;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.codebrew.moana.service.domain.Festival;
import com.codebrew.moana.service.domain.Party;
import com.codebrew.moana.service.domain.Purchase;
import com.codebrew.moana.service.domain.Ticket;
import com.codebrew.moana.service.domain.User;
import com.codebrew.moana.service.purchase.PurchaseService;
import com.codebrew.moana.service.ticket.TicketService;

@RestController
@RequestMapping("/purchaseRest/*")
public class PurchaseRestController {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("ticketServiceImpl")
	TicketService ticketService;
	
	public PurchaseRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping("/json/readyPayment/{ticketNo}")
	public Purchase readyPayment(@RequestBody Purchase purchase, @PathVariable int ticketNo) {
		
		System.out.println(ticketNo);
		System.out.println(purchase);
		
		Ticket ticket = null;
		switch(purchase.getPurchaseFlag()) {
			case "1" : //축제
				Festival festival = new Festival();
				festival.setFestivalNo(ticketNo);
				festival.setFestivalName("2017 불꽃 축제");
				festival.setAddr("경기도 성남시 분당구 188");
				festival.setFestivalImage("http://tong.visitkorea.or.kr/cms/resource/18/1999118_image2_1.jpg");
				festival.setTicketCount(40);
				festival.setTicketPrice(5600);
				
				ticket = ticketService.getTicketByTicketNo(ticketNo);
				//festival = festivalService.getFestival(festival.getFestivalNo());
				//purchase.setFestival(festival);
				purchase.setTicket(ticket);
				purchase.setItemName(ticket.getFestival().getFestivalName());
				break;
			case "2" : //파티
				Party party = new Party();
				party.setPartyNo(ticketNo);
				party.setPartyName("세리찡의파티");
				party.setPartyImage("http://tong.visitkorea.or.kr/cms/resource/18/1999118_image2_1.jpg");
				party.setPartyPlace("서울턱별시 강남");
				party.setTicketCount(35);
				party.setTicketPrice(50000);
				
				ticket = ticketService.getTicketByTicketNo(ticketNo);
				//party = partyService.getParty(party.getPartyNo());
				//purchase.setParty(party);
				purchase.setTicket(ticket);
				purchase.setItemName(ticket.getParty().getPartyName());
				break;
		}
		
		User user = new User();
		user.setUserId("lgj1522@gmail.com");
		user.setNickname("까까종");
		
		purchase.setUser(user);
		return purchaseService.readyPayment(purchase);
	}
	
	@RequestMapping("json/cancelPayment/{purchaseNo}")
	public void cancelPayment(@PathVariable("purchaseNo") int purchaseNo) {
		purchaseService.cancelPayment(purchaseNo);
	}
}
