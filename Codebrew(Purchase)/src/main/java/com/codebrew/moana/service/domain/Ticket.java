package com.codebrew.moana.service.domain;

public class Ticket {

	//Field
	private Party party; //파티도메인
	private Festival festival; //축제도메인
	private int ticketNo; //티켓번호(DB에서 seq_ticket_ticket_no)
	private int ticketPrice; //티켓가격
	private int ticketCount; //티켓수량
	
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
