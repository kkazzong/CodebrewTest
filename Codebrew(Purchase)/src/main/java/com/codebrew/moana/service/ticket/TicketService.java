package com.codebrew.moana.service.ticket;


import com.codebrew.moana.service.domain.Ticket;

public interface TicketService {
	public Ticket addTicket(Ticket ticket); //Ƽ�ϰ���,���� insert
	public Ticket getTicket(int num, String ticketFlag); //num�� (������ȣ or ��Ƽ��ȣ), ticketFlag�� (���� 1, ��Ƽ 2)
	public Ticket getTicketByTicketNo(int ticketNo); //Ƽ�Ϲ�ȣ�� Ƽ������ get
	public Ticket updateTicket(Ticket ticket); //Ƽ�ϰ���,���� update
	public Ticket updateTicketCount(Ticket ticket); //Ƽ�ϼ����� update
}
