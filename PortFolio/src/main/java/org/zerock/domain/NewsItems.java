package org.zerock.domain;


public class NewsItems {
	
	

	private String title;
	private String description;
	private String link;
	private String guide;
	private String category;
	private String pubDate;
	private String author;
	private String imgUrl;
	
	
	
	
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getGuide() {
		return guide;
	}
	public void setGuide(String guide) {
		this.guide = guide;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	
	@Override
	public String toString() {
		return "NewsItems [title=" + title + ", description=" + description + ", link=" + link + ", guide=" + guide
				+ ", category=" + category + ", pubDate=" + pubDate + ", author=" + author + ", imgUrl=" + imgUrl + "]";
	}
	
	
	
	
	

	
	
	
	
	
	
	
	
	
}
