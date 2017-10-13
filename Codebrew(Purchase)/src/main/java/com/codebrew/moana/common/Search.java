package com.codebrew.moana.common;


//==>리스트화면을 모델링(추상화/캡슐화)한 Bean 
public class Search {
	
	///Field
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private int pageSize;
	private String searchSoldProd;
	private String searchKeywordPrice; //가격위해서
	private String searchLowPrice;
	private String searchHighPrice;
	private String sortCondition;
	private String sortCondition2;
	//==> 리스트화면 currentPage에 해당하는 회원정보를 ROWNUM 사용 SELECT 위해 추가된 Field 
	//==> UserMapper.xml 의 
	//==> <select  id="getUserList"  parameterType="search"	resultMap="userSelectMap">
	//==> 참조
	private int endRowNum;
	private int startRowNum;
	
	///Constructor
	public Search() {
	}
	
	///Method
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int paseSize) {
		this.pageSize = paseSize;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	//==> Select Query 시 ROWNUM 마지막 값 
	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}
	//==> Select Query 시 ROWNUM 시작 값
	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}

	public String getSearchSoldProd() {
		return searchSoldProd;
	}

	public String getSearchKeywordPrice() {
		return searchKeywordPrice;
	}

	public String getSortCondition() {
		return sortCondition;
	}

	public String getSortCondition2() {
		return sortCondition2;
	}

	public void setSearchSoldProd(String searchSoldProd) {
		this.searchSoldProd = searchSoldProd;
	}

	public void setSearchKeywordPrice(String searchKeywordPrice) {
		this.searchKeywordPrice = searchKeywordPrice;
	}

	public void setSortCondition(String sortCondition) {
		this.sortCondition = sortCondition;
	}

	public void setSortCondition2(String sortCondition2) {
		this.sortCondition2 = sortCondition2;
	}
		
	public String getSearchLowPrice() {
		return searchLowPrice;
	}

	public String getSearchHighPrice() {
		return searchHighPrice;
	}

	public void setSearchLowPrice(String searchLowPrice) {
		this.searchLowPrice = searchLowPrice;
	}

	public void setSearchHighPrice(String searchHighPrice) {
		this.searchHighPrice = searchHighPrice;
	}

	@Override
	public String toString() {
		return "Search [currentPage=" + currentPage + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", pageSize=" + pageSize + ", searchSoldProd=" + searchSoldProd
				+ ", searchKeywordPrice=" + searchKeywordPrice + ", searchLowPrice=" + searchLowPrice
				+ ", searchHighPrice=" + searchHighPrice + ", sortCondition=" + sortCondition + ", sortCondition2="
				+ sortCondition2 + ", endRowNum=" + endRowNum + ", startRowNum=" + startRowNum + "]";
	}

	
	
}