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
		user.setNickname("�����");
		
//		System.out.println("������ȣ : "+festivalNo+" | ��Ƽ��ȣ : "+partyNo);
		ModelAndView modelAndView = new ModelAndView();
		if(festivalNo != null) {
			System.out.println("�̰��� �佺Ƽ��");
			Festival festival = new Festival();
			festival.setFestivalNo(Integer.parseInt(festivalNo));
			festival.setFestivalName("2017 �Ҳ� ����");
			festival.setAddr("��⵵ ������ �д籸 188");
			festival.setFestivalImage("http://tong.visitkorea.or.kr/cms/resource/18/1999118_image2_1.jpg");
			festival.setTicketCount(40);
			festival.setTicketPrice(5600);
			//Festival festival = festivalService.getFestival(Integer.parseInt(festivalNo));
			
			Ticket ticket = ticketService.getTicket(festival.getFestivalNo(), "1");
			
			modelAndView.addObject("ticket", ticket);
			modelAndView.addObject("festival", festival);
			modelAndView.addObject("purchaseFlag", "1");
		} else {
			System.out.println("�̰��� �Ƹ���Ƽ");
			Party party = new Party();
			party.setPartyNo(Integer.parseInt(partyNo));
			party.setPartyName("����������Ƽ");
			party.setPartyImage("https://i.ytimg.com/vi/9V7xyUb0NKI/maxresdefault.jpg");
			party.setPartyPlace("�����κ��� ����");
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
		user.setNickname("�����");
		
		if(purchaseFlag == null) {
			purchaseFlag = "1"; //default�� ����Ƽ��
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
		
		System.out.println("Festival ������ : "+festival);
		
		festivalService.addFestival(festival); //���� ���� insert
		
		 Ticket �����ο� setting�� ���ֽø� �ʴ�
		Ticket ticket = new Ticket();
		ticket.setFestival(festival);
		ticket.setTicketPrice(festival.getTicketPrice());
		ticket.setTicketCount(festival.getTicketCount());
		
		�׷��� ���� addTicket()ȣ�� ���ּ�����
		ticketService.addTicket(ticket);
		
		
	}
	
	
	public ModelAndView getFestival(@RequestParam("festivalNo") int festivalNo) {
		
		Ƽ�ϼ���, Ƽ�ϰ��� get�ϰ� ������ ��ȣ�� �÷��� �����ּ���
		Ticket ticket = ticketService.getTicket(festivalNo, "1");
		
		System.out.println("Ƽ�ϵ����� : "+ticket);
		System.out.println("����  = "+ticket.getTicketCount()+", ���� = "+ticket.getTicketPrice());
		
	}
	
	public ModelAndView updateFestival(@ModelAttribute("festival") Festival festival) {
		
		partyService.updateParty(~~~); //��Ƽ���� update
		
		Ƽ�ϼ����� ������ Ƽ�ϵ����ο� ��Ƽ� ��������~
		Ticket ticket = new Ticket();
		ticket.setFestival(festival);
		ticket.setTicketPrice(festival.getTicketPrice());
		ticket.setTicketCount(festival.getTicketCount());
		
		Ticket ticket = ticketService.updateTicket(ticket);
		
		System.out.println("Ƽ�ϵ����� : "+ticket);
		System.out.println("����  = "+ticket.getTicketCount()+", ���� = "+ticket.getTicketPrice());
		
	}
	
	public ModelAndView addParty(@ModelAttribute("party") Party party) {
		
		System.out.println("Festival ������ : "+party);
		
		partyService.addParty(party); //��Ƽ ���� insert
		
		 Ticket �����ο� setting�� ���ֽø� �ʴ�
		Ticket ticket = new Ticket();
		ticket.setParty(party);
		ticket.setTicketPrice(party.getTicketPrice());
		ticket.setTicketCount(party.getTicketCount());
		
		�׷��� ���� addTicket()ȣ�� ���ּ�����
		ticketService.addTicket(ticket);
		
	}
	
	public ModelAndView getParty(@RequestParam("partyNo") int partyNo) {
		
		Ƽ�ϼ���, Ƽ�ϰ��� get�ϰ� ������ ��ȣ�� �÷��� �����ּ���
		Ticket ticket = ticketService.getTicket(partyNo, "2");
		
		System.out.println("Ƽ�ϵ����� : "+ticket);
		System.out.println("����  = "+ticket.getTicketCount()+", ���� = "+ticket.getTicketPrice());
	}	
	
	
	public ModelAndView updateParty(@ModelAttribute("party") Party party) {
		
		partyService.updateParty(~~~); //��Ƽ���� update
		
		Ƽ�ϼ����� ������ Ƽ�ϵ����ο� ��Ƽ� ��������~
		Ticket ticket = new Ticket();
		ticket.setParty(party);
		ticket.setTicketPrice(party.getTicketPrice());
		ticket.setTicketCount(party.getTicketCount());
		
		Ticket ticket = ticketService.updateTicket(ticket);
		
		System.out.println("Ƽ�ϵ����� : "+ticket);
		System.out.println("����  = "+ticket.getTicketCount()+", ���� = "+ticket.getTicketPrice());
		
	}*/
	
}
