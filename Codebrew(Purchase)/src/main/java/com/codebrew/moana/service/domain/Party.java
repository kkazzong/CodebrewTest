package com.codebrew.moana.service.domain;

public class Party {
	
	private int partyNo;
	private String partyName;
	private String partyPlace;
	private String partyDate;
	private String partyImage;
	private int ticketPrice;
	private int ticketCount;
	
	
	public Party() {
		// TODO Auto-generated constructor stub
	}

	public int getPartyNo() {
		return partyNo;
	}

	public void setPartyNo(int partyNo) {
		this.partyNo = partyNo;
	}

	public String getPartyName() {
		return partyName;
	}

	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}
	
	public String getPartyPlace() {
		return partyPlace;
	}

	public void setPartyPlace(String partyPlace) {
		this.partyPlace = partyPlace;
	}

	public String getPartyDate() {
		return partyDate;
	}

	public void setPartyDate(String partyDate) {
		this.partyDate = partyDate;
	}

	public String getPartyImage() {
		return partyImage;
	}

	public void setPartyImage(String partyImage) {
		this.partyImage = partyImage;
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
		return "Party [partyNo=" + partyNo + ", partyName=" + partyName + ", partyPlace=" + partyPlace + ", partyDate="
				+ partyDate + ", partyImage=" + partyImage + ", ticketPrice=" + ticketPrice + ", ticketCount="
				+ ticketCount + "]";
	}


}
