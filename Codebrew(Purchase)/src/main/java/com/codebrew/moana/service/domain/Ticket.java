package com.codebrew.moana.service.domain;

public class Ticket {

	//Field
	private Party party; //��Ƽ������
	private Festival festival; //����������
	private int ticketNo; //Ƽ�Ϲ�ȣ(DB���� seq_ticket_ticket_no)
	private int ticketPrice; //Ƽ�ϰ���
	private int ticketCount; //Ƽ�ϼ���
	
	//Constructor
	public Ticket() {
		System.out.println(this.getClass());
	}

	//getter, setter
	public Party getParty() {
		return party;
	}

	public void setParty(Party party) {
		this.party = party;
	}

	public Festival getFestival() {
		return festival;
	}

	public void setFestival(Festival festival) {
		this.festival = festival;
	}

	public int getTicketNo() {
		return ticketNo;
	}

	public void setTicketNo(int ticketNo) {
		this.ticketNo = ticketNo;
	}

	public int getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(int ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public int getTicketCount() {
		return ticketCount;
	}

	public void setTicketCount(int ticketCount) {
		this.ticketCount = ticketCount;
	}

	@Override
	public String toString() {
		return "Ticket [party=" + party + ", festival=" + festival + ", ticketNo=" + ticketNo + ", ticketPrice="
				+ ticketPrice + ", ticketCount=" + ticketCount + "]";
	}
	
}
