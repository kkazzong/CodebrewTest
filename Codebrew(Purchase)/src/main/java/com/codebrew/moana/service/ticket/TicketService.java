package com.codebrew.moana.service.ticket;


import com.codebrew.moana.service.domain.Ticket;

public interface TicketService {
	public Ticket addTicket(Ticket ticket); //티켓가격,수량 insert
	public Ticket getTicket(int num, String ticketFlag); //num은 (축제번호 or 파티번호), ticketFlag는 (축제 1, 파티 2)
	public Ticket getTicketByTicketNo(int ticketNo); //티켓번호로 티켓정보 get
	public Ticket updateTicket(Ticket ticket); //티켓가격,수량 update
	public Ticket updateTicketCount(Ticket ticket); //티켓수량만 update
}
