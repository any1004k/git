package org.zerock.domain;

public class Board1AttachVO {
	private String uuid;
	private String uploadpath;
	private String fileName;
	private boolean filetype;
	private int bno;
	
	
	
	
	
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public String getUploadpath() {
		return uploadpath;
	}
	public void setUploadpath(String uploadpath) {
		this.uploadpath = uploadpath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public boolean isFiletype() {
		return filetype;
	}
	public void setFiletype(boolean filetype) {
		this.filetype = filetype;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	@Override
	public String toString() {
		return "Board1AttatchVO [uuid=" + uuid + ", uploadpath=" + uploadpath + ", fileName=" + fileName + ", filetype="
				+ filetype + ", bno=" + bno + "]";
	}
	
	
	
	
}
