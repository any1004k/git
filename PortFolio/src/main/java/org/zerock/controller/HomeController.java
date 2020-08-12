package org.zerock.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.Helper.GetNews;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.debug("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void list(ModelMap modelMap) {  // 모델 객체를 파라미터로 불러옴.
		logger.debug("메인입니다.");
		String url="http://rss.kmib.co.kr/data/kmibEcoRss.xml";  // 국민일보 경제 rss
		modelMap.put("items", GetNews.getNews(url));
		
		
			
		String url_2="http://rss.segye.com/segye_photo.xml"; //세계일보 포토뉴스 rss
		modelMap.put("photoItems", GetNews.getImageNews(url_2));
		logger.debug("다 보냈어요.");
	}
	
}
