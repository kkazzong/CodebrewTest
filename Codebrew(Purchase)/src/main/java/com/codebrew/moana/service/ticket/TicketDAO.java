package com.codebrew.moana.service.ticket;


import com.codebrew.moana.service.domain.Ticket;

public interface TicketDAO {
	public int addTicket(Ticket ticket); //Ƽ�ϰ���,���� insert
	public Ticket getTicket(Ticket ticket); //������ȣ or ��Ƽ��ȣ�� Ƽ������ get
	public Ticket getTicketByTicketNo(int ticketNo); //Ƽ�Ϲ�ȣ�� Ƽ������ get
	public int updateTicket(Ticket ticket); //Ƽ�ϰ���,���� update
	public int updateTicketCount(Ticket ticket); //Ƽ�ϼ����� update
}
