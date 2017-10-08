package com.codebrew.moana.service.ticket;


import com.codebrew.moana.service.domain.Ticket;

public interface TicketDAO {
	public int addTicket(Ticket ticket); //티켓가격,수량 insert
	public Ticket getTicket(Ticket ticket); //축제번호 or 파티번호로 티켓정보 get
	public Ticket getTicketByTicketNo(int ticketNo); //티켓번호로 티켓정보 get
	public int updateTicket(Ticket ticket); //티켓가격,수량 update
	public int updateTicketCount(Ticket ticket); //티켓수량만 update
}
