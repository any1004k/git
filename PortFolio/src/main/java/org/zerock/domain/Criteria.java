package org.zerock.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria { // 사용자가 페이지 번호를 눌렀을때 보여지는 화면, 검색어 적고 게시물 검색할 때

	int pageNum;// 사용자가 화면에서 몇 변의 페이지 수를 클릭했는지에 대한 값.
	private int amount =10;// 한 페이지 당 출력되는 게시물 수.
	
	private String type; //검색종류(제목만, 내용만, 제목+내용..)
	private String keyword;//검색어
	
	
	public Criteria() {
		this(1,10);
	}

	public Criteria(int pageNum, int amount) {
		
		this.pageNum = pageNum;
		this.amount = amount;
	}
	

	public String[] getTypeArray() {  // 검색조건을 배열로 만들어서 한번에 처리하기 위함.
		
		return type == null? new String[] {} : type.split("");
	}
	
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
										.queryParam("pageNum", this.pageNum)
										.queryParam("amount", this.amount)
										.queryParam("type", this.type)
										.queryParam("keyword", this.keyword);
		return builder.toUriString();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", type=" + type + ", keyword=" + keyword + "]";
	}
	
	
	
	
}
