package org.zerock.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Member1VO;
import org.zerock.service.Board1Service;
import org.zerock.service.Member1Service;










@Controller
@RequestMapping("/main")
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	private Member1Service member1Service;
	
	@Autowired
	private Board1Service board1service;

	
	
	
	@GetMapping("main")
	public void main(@RequestParam(value="result",required=false, defaultValue="0") String result, Model model) {
	
		
		
		model.addAttribute("newslist", board1service.getBnoRank_List1());
		/*model.addAttribute("newslist2", board1service.getBnoRank_List2());*/
		int result1 = Integer.parseInt(result);
		
		if(result1==1) {
			model.addAttribute("result", result1);
		}
		
	}
	
	
	
	@PostMapping("/login")
	public String login (Member1VO member, HttpSession session, RedirectAttributes rttr){
		
		
		Member1VO yesmember = member1Service.getMemberInfo(member);
		session.setAttribute("yesmember", yesmember);
		
		
		
		
		
		if(session.getAttribute("yesmember")!=null) { //일치하는 정보가 있으면, 회원이니까.
			
			return "redirect:/main/main";
		}else {
			rttr.addFlashAttribute("a", "아이디 또는 비밀번호가 일치하지 않습니다.");
			return "redirect:/main/main";
		}
		
	}//로그인 끝
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("yesmember");
		/*또는 session.invalidate();*/
		return "redirect:/main/main";
	}
	
	@GetMapping("/memberRegister")
	public void memberRegister() {
		
		
	}
	
	@PostMapping("/memberRegister")
	public String memberRegister(Member1VO member1VO,Model model) {
		
		
		
		int result = member1Service.memberRegister(member1VO);
		logger.debug("리절트 값은 : "+result);
		
		model.addAttribute("newslist", board1service.getBnoRank_List1());
		model.addAttribute("newslist2", board1service.getBnoRank_List2());
		
		return "redirect:/main/main?result="+result;
	}
	
	
	
	
	@GetMapping(value="/checkId", produces = {MediaType.APPLICATION_XHTML_XML_VALUE,
											MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody	
	public ResponseEntity<Integer> checkId(String checkId) {
		
		logger.debug("하이. 아이디를 체크할께요.:"+member1Service.checkId(checkId));
		
		int count = member1Service.checkId(checkId);
		
		return new  ResponseEntity<Integer>(count,HttpStatus.OK);
	}



	
	
	

	
	
}
