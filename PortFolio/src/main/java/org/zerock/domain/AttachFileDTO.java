package org.zerock.domain;


public class AttachFileDTO {

	private String filename;
	private String uploadpath;
	private String  uuid;
	private boolean image;
	
	
	
	
	
	
	
	
	
	//게터세터 투스트링
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getUploadpath() {
		return uploadpath;
	}
	public void setUploadpath(String uploadpath) {
		this.uploadpath = uploadpath;
	}
	public String getUuid() {
		return uuid;
	}
	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	public boolean isImage() {
		return image;
	}
	public void setImage(boolean image) {
		this.image = image;
	}
	@Override
	public String toString() {
		return "AttachFileDTO [filename=" + filename + ", uploadpath=" + uploadpath + ", uuid=" + uuid + ", image="
				+ image + "]";
	}
	
	
}
