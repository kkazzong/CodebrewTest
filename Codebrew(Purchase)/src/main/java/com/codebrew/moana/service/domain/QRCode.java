package com.codebrew.moana.service.domain;

public class QRCode {

	private String qrCodeImage;
	private String qrCodeResult;
	
	public QRCode() {
		System.out.println(this.getClass());
	}

	public String getQrCodeImage() {
		return qrCodeImage;
	}

	public void setQrCodeImage(String qrCodeImage) {
		this.qrCodeImage = qrCodeImage;
	}

	public String getQrCodeResult() {
		return qrCodeResult;
	}

	public void setQrCodeResult(String qrCodeResult) {
		this.qrCodeResult = qrCodeResult;
	}

	@Override
	public String toString() {
		return "QRCode [qrCodeImage=" + qrCodeImage + ", qrCodeResult=" + qrCodeResult + "]";
	}
}
