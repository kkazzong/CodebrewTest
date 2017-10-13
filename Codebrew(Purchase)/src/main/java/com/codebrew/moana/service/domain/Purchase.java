package com.codebrew.moana.service.domain;

import java.util.Date;

public class Purchase {
	
	
	//Field
	private User user;
	private Ticket ticket;
	private QRCode qrCode;
	private int purchaseNo;
	private String tid; //������ȣ
	private String paymentNo; //������ȣ
	private String nextRedirectPcUrl; //�����غ�API
	private String aid; //Request��ȣ
	private String cid; //��������ȣ
	private String partnetOrderId;
	private String partnerUserId;
	private String purchaseMethodType; //��������
	private String itemName; //����������
	private Date purchaseDate; //�����Ͻ�
	private int purchasePrice; //�����ݾ�
	private int purchaseCount; //���ż���
	private String tranCode; //���Ż���
	private String purchaseFlag; //�÷���
	
	//Constructor
	public Purchase() {
		System.out.println(this.getClass());
	}

	//getter, setter
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Ticket getTicket() {
		return ticket;
	}

	public void setTicket(Ticket ticket) {
		this.ticket = ticket;
	}

	public QRCode getQrCode() {
		return qrCode;
	}

	public void setQrCode(QRCode qrCode) {
		this.qrCode = qrCode;
	}

	public String getTranCode() {
		return tranCode;
	}

	public void setTranCode(String tranCode) {
		this.tranCode = tranCode;
	}

	public String getPurchaseFlag() {
		return purchaseFlag;
	}

	public void setPurchaseFlag(String purchaseFlag) {
		this.purchaseFlag = purchaseFlag;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getNextRedirectPcUrl() {
		return nextRedirectPcUrl;
	}

	public void setNextRedirectPcUrl(String nextRedirectPcUrl) {
		this.nextRedirectPcUrl = nextRedirectPcUrl;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getPartnetOrderId() {
		return partnetOrderId;
	}

	public void setPartnetOrderId(String partnetOrderId) {
		this.partnetOrderId = partnetOrderId;
	}

	public String getPartnerUserId() {
		return partnerUserId;
	}

	public void setPartnerUserId(String partnerUserId) {
		this.partnerUserId = partnerUserId;
	}

	public String getPurchaseMethodType() {
		return purchaseMethodType;
	}

	public void setPurchaseMethodType(String purchaseMethodType) {
		this.purchaseMethodType = purchaseMethodType;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Date getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public int getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(int purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public int getPurchaseCount() {
		return purchaseCount;
	}

	public void setPurchaseCount(int purchaseCount) {
		this.purchaseCount = purchaseCount;
	}
	
	public int getPurchaseNo() {
		return purchaseNo;
	}

	public void setPurchaseNo(int purchaseNo) {
		this.purchaseNo = purchaseNo;
	}

	public String getPaymentNo() {
		return paymentNo;
	}

	public void setPaymentNo(String paymentNo) {
		this.paymentNo = paymentNo;
	}

	@Override
	public String toString() {
		return "Purchase [user=" + user + ", ticket=" + ticket + ", qrCode=" + qrCode + ", purchaseNo=" + purchaseNo
				+ ", tid=" + tid + ", paymentNo=" + paymentNo + ", nextRedirectPcUrl=" + nextRedirectPcUrl + ", aid="
				+ aid + ", cid=" + cid + ", partnetOrderId=" + partnetOrderId + ", partnerUserId=" + partnerUserId
				+ ", purchaseMethodType=" + purchaseMethodType + ", itemName=" + itemName + ", purchaseDate="
				+ purchaseDate + ", purchasePrice=" + purchasePrice + ", purchaseCount=" + purchaseCount + ", tranCode="
				+ tranCode + ", purchaseFlag=" + purchaseFlag + "]";
	}

}
