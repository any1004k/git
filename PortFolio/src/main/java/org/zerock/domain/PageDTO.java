package org.zerock.domain;

public class PageDTO {  // 하단에 페이지 숫자 자동으로 생성하고, 이전 다음 버튼 만들지 말지 정하려고.

	private int startPage; //화면에 보여지는 페이지번호 시작.(1이될지,,11이 될지..)
	private int endPage; // 화면에 보여지는 끝 페이지 (10,,20,,)
	boolean prev, next; // 페이지번호 양 끝에 넣을 버튼을 보여줄지말지 결정.
	
	private int total; // 게시물 총 갯수
	private Criteria cri; // 사용자가 몇번 페이지 클릭했는지,, 페이지당 게시물 몇개인지, 검색어는 뭔지.. 들어있음.
	
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total= total;
		
		this.endPage= (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.startPage = this.endPage-9;
		int realEnd = (int)(Math.ceil(total*1.0/cri.getAmount()));
		
		
		if(realEnd<this.endPage) {
			this.endPage=realEnd;
		}
		
		this.prev = this.startPage>=2; //시작페이지가 2 이상이면 이전 버튼 나오게.
		this.next = this.endPage<realEnd;
		
	}

	/*게터세터 투스트링*/
	
	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public boolean isPrev() {
		return prev;
	}


	public void setPrev(boolean prev) {
		this.prev = prev;
	}


	public boolean isNext() {
		return next;
	}


	public void setNext(boolean next) {
		this.next = next;
	}


	public int getTotal() {
		return total;
	}


	public void setTotal(int total) {
		this.total = total;
	}


	public Criteria getCri() {
		return cri;
	}


	public void setCri(Criteria cri) {
		this.cri = cri;
	}


	@Override
	public String toString() {
		return "PageDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}
	

	
	
	
}
