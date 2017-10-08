package com.codebrew.moana.service.domain;

public class Festival {

	private int festivalNo;
	private String festivalName;
	private String festivalImage;
	private String startDate;
	private String endDate;
	private String addr;
	private int ticketPrice;
	private int ticketCount;
	
	public Festival() {
		System.out.println(this.getClass());
	}
	
	
	
	



	public int getFestivalNo() {
		return festivalNo;
	}







	public void setFestivalNo(int festivalNo) {
		this.festivalNo = festivalNo;
	}







	public String getFestivalName() {
		return festivalName;
	}



	public void setFestivalName(String festivalName) {
		this.festivalName = festivalName;
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



	public String getFestivalImage() {
		return festivalImage;
	}



	public void setFestivalImage(String festivalImage) {
		this.festivalImage = festivalImage;
	}



	public String getStartDate() {
		return startDate;
	}



	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}



	public String getEndDate() {
		return endDate;
	}



	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}



	public String getAddr() {
		return addr;
	}



	public void setAddr(String addr) {
		this.addr = addr;
	}

	@Override
	public String toString() {
		return "Festival [festivalNo=" + festivalNo + ", festivalName=" + festivalName + ", festivalImage="
				+ festivalImage + ", startDate=" + startDate + ", endDate=" + endDate + ", addr=" + addr
				+ ", ticketPrice=" + ticketPrice + ", ticketCount=" + ticketCount + "]";
	}
	
}
