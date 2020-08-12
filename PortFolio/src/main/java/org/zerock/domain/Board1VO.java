package org.zerock.domain;


import java.util.List;

public class Board1VO {
	
	int bno; 
    String title;
    String content;
    String id;
    String regdate;
    String updatedate;
	int replycnt;
	int ranking;
	
	private List<Board1AttachVO> attachList;
	
	
	
	
	




	public int getBno() {
		return bno;
	}









	public void setBno(int bno) {
		this.bno = bno;
	}









	public String getTitle() {
		return title;
	}









	public void setTitle(String title) {
		this.title = title;
	}









	public String getContent() {
		return content;
	}









	public void setContent(String content) {
		this.content = content;
	}









	public String getId() {
		return id;
	}









	public void setId(String id) {
		this.id = id;
	}









	public String getRegdate() {
		return regdate;
	}









	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}









	public String getUpdatedate() {
		return updatedate;
	}









	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}









	public int getReplycnt() {
		return replycnt;
	}









	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}









	public int getRanking() {
		return ranking;
	}









	public void setRanking(int ranking) {
		this.ranking = ranking;
	}









	public List<Board1AttachVO> getAttachList() {
		return attachList;
	}









	public void setAttachList(List<Board1AttachVO> attachList) {
		this.attachList = attachList;
	}









	@Override
	public String toString() {
		return "Board1VO [bno=" + bno + ", title=" + title + ", content=" + content + ", id=" + id + ", regdate="
				+ regdate + ", updatedate=" + updatedate + ", replycnt=" + replycnt + ", ranking=" + ranking
				+ ", attachList=" + attachList + "]";
	}










	
	
	
	
}
