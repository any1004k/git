package org.zerock.Helper;

import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.zerock.domain.NewsItems;

public class GetNews {
	
	public static List<NewsItems> getNews(String url){
		List<NewsItems> newslist = new ArrayList<NewsItems>();
		try {
			DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();			
			DocumentBuilder documentBuilder	= documentBuilderFactory.newDocumentBuilder();
			Document document = documentBuilder.parse(url);
			XPath xpath = XPathFactory.newInstance().newXPath();
			NodeList nodeList = (NodeList) xpath.compile("//item").evaluate(document,XPathConstants.NODESET);
			for(int i = 0; i< nodeList.getLength(); i++) {
				NewsItems newsItems= new NewsItems();
				newsItems.setCategory(
						xpath.compile("./category").evaluate(nodeList.item(i), XPathConstants.STRING).toString());				
				newsItems.setDescription(
						xpath.compile("./description").evaluate(nodeList.item(i), XPathConstants.STRING).toString());						
				newsItems.setGuide(
						xpath.compile("./guide").evaluate(nodeList.item(i), XPathConstants.STRING).toString());
				newsItems.setLink(
						xpath.compile("./link").evaluate(nodeList.item(i), XPathConstants.STRING).toString());
				newsItems.setTitle(
						xpath.compile("./title").evaluate(nodeList.item(i), XPathConstants.STRING).toString());
				newsItems.setPubDate(
						xpath.compile("./pubDate").evaluate(nodeList.item(i), XPathConstants.STRING).toString());
				
				newslist.add(newsItems);
			}
					
					
		}catch(Exception e) {
			e.printStackTrace();
			newslist = null;
		}
		
		return newslist;
	}
	
	
	
	
	
	// 태그 안에 속성값 가져오는 xpath 문법 익혀서 다시 쓰기.
	public static List<NewsItems> getImageNews(String url){
		List<NewsItems> newslist = new ArrayList<NewsItems>();
		try {
			DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();	//1.문서를 읽기위한 공장을 만들어야 한다.		
			DocumentBuilder documentBuilder	= documentBuilderFactory.newDocumentBuilder(); //2.빌더 생성
			Document document = documentBuilder.parse(url); //3.생성된 빌더를 통해서 xml문서를 Document객체로 파싱해서 가져온다
			
			
			document.getDocumentElement().normalize(); // 4.문서 구조 안정화
		     
		    Element root = document.getDocumentElement();
		     
		    NodeList nodeList = root.getElementsByTagName("item");

		    Element el = null;
		    NodeList sub_nodeList = null; 
		     String value="";
			  
		    		     
		    for(int i=0; i<nodeList.getLength(); i++) {
		    	NewsItems newsItems= new NewsItems();
		    	el = (Element) nodeList.item(i);
		    	sub_nodeList = el.getElementsByTagName("media:content");
		    	
		    	newsItems.setDescription(
		    			el.getAttributes().getNamedItem("description").getNodeValue().toString());		
				newsItems.setGuide(
						el.getAttributes().getNamedItem("guide").getNodeValue().toString());
				newsItems.setLink(
						el.getAttributes().getNamedItem("link").getNodeValue().toString());
				newsItems.setTitle(
						el.getAttributes().getNamedItem("title").getNodeValue().toString());
				newsItems.setPubDate(
						el.getAttributes().getNamedItem("pubDate").getNodeValue().toString());
				
				newsItems.setImgUrl(
						sub_nodeList.item(2).getAttributes().getNamedItem("url").getNodeValue().toString());
				
				
				newslist.add(newsItems);
				
		    }
				
		    	
		       
		      			
			/*XPath xpath = XPathFactory.newInstance().newXPath();
			NodeList nodeList = (NodeList) xpath.compile("//item").evaluate(document,XPathConstants.NODESET);
			for(int i = 0; i< nodeList.getLength(); i++) {
				NewsItems newsItems= new NewsItems();
				newsItems.setCategory(
						xpath.compile("./category").evaluate(nodeList.item(i), XPathConstants.STRING).toString());				
				newsItems.setDescription(
						xpath.compile("./description").evaluate(nodeList.item(i), XPathConstants.STRING).toString());						
				newsItems.setGuide(
						xpath.compile("./guide").evaluate(nodeList.item(i), XPathConstants.STRING).toString());
				newsItems.setLink(
						xpath.compile("./link").evaluate(nodeList.item(i), XPathConstants.STRING).toString());
				newsItems.setTitle(
						xpath.compile("./title").evaluate(nodeList.item(i), XPathConstants.STRING).toString());
				newsItems.setPubDate(
						xpath.compile("./pubDate").evaluate(nodeList.item(i), XPathConstants.STRING).toString());
				
				newsItems.setImgUrl(
						xpath.compile("./media:content ").evaluate(nodeList.item(i).getAttributes().getNamedItem("src").getNodeValue(), XPathConstants.STRING).toString());
				
				newslist.add(newsItems);*/
			
		
					
		}catch(Exception e) {
			e.printStackTrace();
			newslist = null;
		}
		
		return newslist;
	}
	

}
