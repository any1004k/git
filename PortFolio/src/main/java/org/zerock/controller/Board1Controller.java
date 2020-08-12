package org.zerock.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Board1AttachVO;
import org.zerock.domain.Board1VO;
import org.zerock.domain.Criteria;
import org.zerock.domain.Member1VO;
import org.zerock.domain.PageDTO;
import org.zerock.service.Board1Service;




@Controller
@RequestMapping("/board1/*")
public class Board1Controller {
	
	private static final Logger logger = LoggerFactory.getLogger(Board1Controller.class);

	@Autowired	
	private Board1Service board1service;

	
	
	
	
	
	//토크 리스트로 화면이동
	@GetMapping("/talkList") 
	public void talkList(Criteria cri, Model model) {
		
				
		model.addAttribute("list", board1service.getList(cri) );
		
		int total = board1service.getTotalCount();
		model.addAttribute("pageMaker", new PageDTO(cri,total));
  }
	
	
	
	
	
	// 토크 입력 화면으로 이동.
	@GetMapping("/talkRegister")   
	public String talkRegister(@RequestParam(value="bno",required=false, defaultValue="0") String bno, HttpSession session, Criteria cri, Model model) {
	
		logger.debug("글수정 컨트롤러"+bno);
	
		if(bno!="0" && session.getAttribute("yesmember")!=null) {
			int ibno = Integer.parseInt(bno);
			model.addAttribute("tuple",board1service.getTuple(ibno));
			int total = board1service.getTotalCount();
			model.addAttribute("pageMaker", new PageDTO(cri,total));
		
			return "/board1/talkRegister";
		}else {
			model.addAttribute("alert", "로그인을 하셔야 글 등록이 가능합니다.");
			model.addAttribute("newslist", board1service.getBnoRank_List1());
			model.addAttribute("newslist2", board1service.getBnoRank_List2());
			return "/main/main";
		}
	}
	
	
	@PostMapping("/talkRegister")
	public String talkRegister(Board1VO vo, Criteria cri, RedirectAttributes rttr) {
		
		logger.debug("보드1컨트롤러: 디비에 입력하고 목록으로 이동. 받은 vo값은 : "+vo);
		
		if(vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach->logger.debug("파일"+attach));
		}
		int total = board1service.getTotalCount();
		rttr.addFlashAttribute("pageMaker",new PageDTO(cri,total));
		board1service.insert(vo);
		 
		return "redirect:/board1/talkList";
	}
	
	
	
	
	//디테일 화면 가져오기.
	@GetMapping("/talkRead")
	public void talkRead(@RequestParam("bno") String bno, HttpSession session, Criteria cri,  Model model, @RequestParam(value="modify",required=false, defaultValue="0") String modify ) {
		
		logger.debug("컨트롤러: 목록에서 bno받아서 디비에서 튜플 가져오기");
		
		int ibno=Integer.parseInt(bno);
		int total = board1service.getTotalCount();
		int modify1 = Integer.parseInt(modify);
		
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		model.addAttribute("tuple", board1service.getTuple(ibno));
		model.addAttribute("modify",modify1);
		
		if(session.getAttribute("yesmember")!=null) {
		Member1VO yesmember=(Member1VO)session.getAttribute("yesmember");
		
		String sessionId = yesmember.getId();
		 
		model.addAttribute("sessionId",sessionId);
		}
		
		
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("bno") String bno,Criteria cri, Model model) {
		
		logger.debug("딜리트 컨트롤러");
		int bnoi = Integer.parseInt(bno);
		board1service.delete(bnoi);
		
		
		model.addAttribute("list", board1service.getList(cri) );		
		int total = board1service.getTotalCount();
		model.addAttribute("pageMaker", new PageDTO(cri,total));
		
		return "/board1/talkList";
	}
	
	
	
	
	
	
	
	
	
	
	//댓글목록 가져오기.
	@GetMapping(value="getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<Board1AttachVO>> getAttachList (int bno){
		
		logger.debug("보드1 컨트롤러(getAttachList) bno는 :"+bno);
		return new ResponseEntity<>(board1service.getAttachList(bno),HttpStatus.OK);
	}
	
	
	
	//글 수정 화면으로 이동.
	@PostMapping("/talkUpdate")
	public String talkUpdate(Board1VO vo, Criteria cri, RedirectAttributes rttr) {
		
		logger.debug("보드1 컨트롤러(talkUpdate) vo는 :"+vo);
				
		
		int ibno = vo.getBno();
		board1service.update(vo);
		
		
		int total = board1service.getTotalCount();
		
		rttr.addFlashAttribute("afterUpdate_pageMaker",new PageDTO(cri,total)); //객체를 담아서 보낼 땐 flash들어간거 써야함.??
		logger.debug("new PageDTO :"+new PageDTO(cri,total)); //페이지번호 맞음.
		
		return "redirect:/board1/talkRead?bno="+ibno+"&modify=1";
				
	}
	
	

}
