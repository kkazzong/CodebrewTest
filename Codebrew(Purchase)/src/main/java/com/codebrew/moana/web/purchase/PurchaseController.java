package com.codebrew.moana.web.purchase;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.codebrew.moana.service.domain.Festival;
import com.codebrew.moana.service.domain.Party;
import com.codebrew.moana.service.domain.Purchase;
import com.codebrew.moana.service.domain.Ticket;
import com.codebrew.moana.service.domain.User;
import com.codebrew.moana.service.purchase.PurchaseService;
import com.codebrew.moana.service.ticket.TicketService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	@Autowired
	@Qualifier("purchaseServiceImpl")
	PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("ticketServiceImpl")
	TicketService ticketService;
	
	public PurchaseController() {
		System.out.println(this.getClass());
	}

	@RequestMapping(value="addPurchase", method=RequestMethod.GET)
	public ModelAndView addPurchase(@RequestParam(value="festivalNo", required=false) String festivalNo,
																@RequestParam(value="partyNo", required=false) String partyNo) {
		
		User user = new User();
		user.setUserId("lgj1522@gmail.com");
		user.setNickname("까까종");
		
//		System.out.println("축제번호 : "+festivalNo+" | 파티번호 : "+partyNo);
		ModelAndView modelAndView = new ModelAndView();
		if(festivalNo != null) {
			System.out.println("이것은 페스티벌");
			Festival festival = new Festival();
			festival.setFestivalNo(Integer.parseInt(festivalNo));
			festival.setFestivalName("2017 불꽃 축제");
			festival.setAddr("경기도 성남시 분당구 188");
			festival.setFestivalImage("http://tong.visitkorea.or.kr/cms/resource/18/1999118_image2_1.jpg");
			festival.setTicketCount(40);
			festival.setTicketPrice(5600);
			//Festival festival = festivalService.getFestival(Integer.parseInt(festivalNo));
			
			Ticket ticket = ticketService.getTicket(festival.getFestivalNo(), "1");
			
			modelAndView.addObject("ticket", ticket);
			modelAndView.addObject("festival", festival);
			modelAndView.addObject("purchaseFlag", "1");
		} else {
			System.out.println("이것은 아모르파티");
			Party party = new Party();
			party.setPartyNo(Integer.parseInt(partyNo));
			party.setPartyName("세리찡의파티");
			party.setPartyImage("https://i.ytimg.com/vi/9V7xyUb0NKI/maxresdefault.jpg");
			party.setPartyPlace("서울턱별시 강남");
			party.setTicketCount(35);
			party.setTicketPrice(50000);
			//Party party = partyService.getParty(partyNo);
			
			Ticket ticket = ticketService.getTicket(party.getPartyNo(), "2");
			
			modelAndView.addObject("ticket", ticket);
			modelAndView.addObject("party", party);
			modelAndView.addObject("purchaseFlag", "2");
		}
		modelAndView.addObject("user", user);
		modelAndView.setViewName("/view/purchase/addPurchase.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="approvePayment")
	public ModelAndView approvePurchase(@RequestParam("pg_token") String pgToken) {
		
		System.out.println(pgToken);
		
		Purchase purchase = purchaseService.approvePayment(pgToken);
		purchase = purchaseService.addPurchase(purchase);
		System.out.println(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase", purchase);
		modelAndView.setViewName("/view/purchase/approvePayment.jsp");
		
		return modelAndView;
		
	}
	
	@RequestMapping(value="getPurchaseList")
	public ModelAndView getPurchaseList(@RequestParam("userId") String userId,
																	@RequestParam(value="purchaseFlag", required=false) String purchaseFlag) {
		
		System.out.println(userId);
		User user = new User();
		user.setUserId(userId);
		user.setNickname("까까종");
		
		if(purchaseFlag == null) {
			purchaseFlag = "1"; //default는 축제티켓
		} 
		System.out.println(purchaseFlag);
		
		Map<String, Object> map = purchaseService.getPurchaseList(userId, purchaseFlag);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.setViewName("/view/purchase/getPurchaseList.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="getSaleList", method=RequestMethod.GET)
	public ModelAndView getSaleList() {
		
		Map<String, Object> map = purchaseService.getSaleList();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.setViewName("/view/purchase/getSaleList.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="getPurchase", method=RequestMethod.GET)
	public ModelAndView getPurchase(@RequestParam("purchaseNo") int purchaseNo) {
		
		System.out.println(purchaseNo);
		
		Purchase purchase = purchaseService.getPurchase(purchaseNo);
		Ticket ticket = ticketService.getTicketByTicketNo(purchase.getTicket().getTicketNo());
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("purchase", purchase);
		modelAndView.addObject("ticket", ticket);
		modelAndView.setViewName("/view/purchase/getPurchase.jsp");
		
		return modelAndView;
		
	}
	
	
	
	/*public ModelAndView addFestival(@ModelAttribute("festival") Festival festival) {
		
		System.out.println("Festival 도메인 : "+festival);
		
		festivalService.addFestival(festival); //축제 정보 insert
		
		 Ticket 도메인에 setting만 해주시면 됨다
		Ticket ticket = new Ticket();
		ticket.setFestival(festival);
		ticket.setTicketPrice(festival.getTicketPrice());
		ticket.setTicketCount(festival.getTicketCount());
		
		그러고 나서 addTicket()호출 해주세염욤
		ticketService.addTicket(ticket);
		
		
	}
	
	
	public ModelAndView getFestival(@RequestParam("festivalNo") int festivalNo) {
		
		티켓수량, 티켓가격 get하고 싶으면 번호랑 플래그 보내주세염
		Ticket ticket = ticketService.getTicket(festivalNo, "1");
		
		System.out.println("티켓도메인 : "+ticket);
		System.out.println("수량  = "+ticket.getTicketCount()+", 가격 = "+ticket.getTicketPrice());
		
	}
	
	public ModelAndView updateFestival(@ModelAttribute("festival") Festival festival) {
		
		partyService.updateParty(~~~); //파티정보 update
		
		티켓수량과 가격은 티켓도메인에 담아서 업데이투~
		Ticket ticket = new Ticket();
		ticket.setFestival(festival);
		ticket.setTicketPrice(festival.getTicketPrice());
		ticket.setTicketCount(festival.getTicketCount());
		
		Ticket ticket = ticketService.updateTicket(ticket);
		
		System.out.println("티켓도메인 : "+ticket);
		System.out.println("수량  = "+ticket.getTicketCount()+", 가격 = "+ticket.getTicketPrice());
		
	}
	
	public ModelAndView addParty(@ModelAttribute("party") Party party) {
		
		System.out.println("Festival 도메인 : "+party);
		
		partyService.addParty(party); //파티 정보 insert
		
		 Ticket 도메인에 setting만 해주시면 됨다
		Ticket ticket = new Ticket();
		ticket.setParty(party);
		ticket.setTicketPrice(party.getTicketPrice());
		ticket.setTicketCount(party.getTicketCount());
		
		그러고 나서 addTicket()호출 해주세염욤
		ticketService.addTicket(ticket);
		
	}
	
	public ModelAndView getParty(@RequestParam("partyNo") int partyNo) {
		
		티켓수량, 티켓가격 get하고 싶으면 번호랑 플래그 보내주세염
		Ticket ticket = ticketService.getTicket(partyNo, "2");
		
		System.out.println("티켓도메인 : "+ticket);
		System.out.println("수량  = "+ticket.getTicketCount()+", 가격 = "+ticket.getTicketPrice());
	}	
	
	
	public ModelAndView updateParty(@ModelAttribute("party") Party party) {
		
		partyService.updateParty(~~~); //파티정보 update
		
		티켓수량과 가격은 티켓도메인에 담아서 업데이투~
		Ticket ticket = new Ticket();
		ticket.setParty(party);
		ticket.setTicketPrice(party.getTicketPrice());
		ticket.setTicketCount(party.getTicketCount());
		
		Ticket ticket = ticketService.updateTicket(ticket);
		
		System.out.println("티켓도메인 : "+ticket);
		System.out.println("수량  = "+ticket.getTicketCount()+", 가격 = "+ticket.getTicketPrice());
		
	}*/
	
}
