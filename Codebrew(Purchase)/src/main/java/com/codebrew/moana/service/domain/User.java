package com.codebrew.moana.service.domain;

public class User {


	private String userId;
	private String nickname;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", nickname=" + nickname + "]";
	}
	
	
}
