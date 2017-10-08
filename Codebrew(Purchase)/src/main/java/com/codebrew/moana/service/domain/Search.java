package com.codebrew.moana.service.domain;

public class Search {

	//Field
	private String searchCondition;
	private String orderCondition;
	private String searchKeyword;
	
	//Constructor
	public Search() {
		System.out.println(this.getClass());
	}

	//getter, setter
	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getOrderCondition() {
		return orderCondition;
	}

	public void setOrderCondition(String orderCondition) {
		this.orderCondition = orderCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", orderCondition=" + orderCondition + ", searchKeyword="
				+ searchKeyword + "]";
	}
	
}
