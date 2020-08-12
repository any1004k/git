package org.zerock.domain;

import java.util.Date;

public class Reply1VO {
	private int rno;
	private int bno;
	private String reply;
	private String id;
	private Date regdate;
	private Date updatedate;
	
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
	
	
	
	
	@Override
	public String toString() {
		return "Reply1VO [rno=" + rno + ", bno=" + bno + ", reply=" + reply + ", id=" + id + ", regdate=" + regdate
				+ ", updatedate=" + updatedate + "]";
	}
	
	
	
	
	
}
