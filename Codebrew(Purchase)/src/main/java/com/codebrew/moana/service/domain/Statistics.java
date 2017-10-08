package com.codebrew.moana.service.domain;

public class Statistics {

	//Field
	private Purchase purchase;
	private int totalPrice; //���Ǹűݾ�
	private int totalCount; //���Ǹż���
	private String statFlag;
	private String statDate; //�����
	
	//Constructor
	public Statistics() {
		System.out.println(this.getClass());
	}

	public Purchase getPurchase() {
		return purchase;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public String getStatFlag() {
		return statFlag;
	}

	public void setStatFlag(String statFlag) {
		this.statFlag = statFlag;
	}

	public String getStatDate() {
		return statDate;
	}

	public void setStatDate(String statDate) {
		this.statDate = statDate;
	}

	@Override
	public String toString() {
		return "Statistics [purchase=" + purchase + ", totalPrice=" + totalPrice + ", totalCount=" + totalCount
				+ ", statFlag=" + statFlag + ", statDate=" + statDate + "]";
	}
	
}
