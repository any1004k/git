package org.zerock.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.Reply1PageDTO;
import org.zerock.domain.Reply1VO;
import org.zerock.service.Reply1Service;

@RestController
@RequestMapping("/reply1")
public class Reply1Controller {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private Reply1Service service;
	
	
	
	
	
	
	@GetMapping(value="/pages/{bno}/{page}", produces = { MediaType.APPLICATION_XHTML_XML_VALUE,
														 MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Reply1PageDTO> getList(@PathVariable("bno") int bno,
												 @PathVariable("page") int page
			                                    ){
		
		logger.debug("레스트컨트롤러 : 댓글리스트 불러오기. bno와 page는"+bno + page);
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<>(service.getReplyList(cri,bno),HttpStatus.OK); 
	}
	
	
	@PostMapping(value="/new")
	public ResponseEntity<String> add(@RequestBody Reply1VO vo) {
		logger.debug("레스트컨트롤러 : 댓글추가히기.vo는 : " +vo);
		return service.addReply(vo)==1? new ResponseEntity<>("success", HttpStatus.OK) 
				                     : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
	
	@DeleteMapping(value="/{rno}")
	public ResponseEntity<String> remove(@PathVariable("rno")int rno) {
		logger.debug("레스트컨트롤러 : 댓글 지우기. rno는 :"+rno);
		
		return service.removeReply(rno)==1? new ResponseEntity<>("success", HttpStatus.OK) 
                                   : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}   ,
					value= "/{rno}",
					consumes="application/json"
					)
	public ResponseEntity<String> modify(@RequestBody Reply1VO vo, @PathVariable("rno")int rno) {
		
		logger.debug("레스트컨트롤러 : 댓글 수정하기. rno는 :"+rno+"수정후 vo는"+vo);
		
		return service.updateReply(vo)==1? new ResponseEntity<>("success", HttpStatus.OK) 
                : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/{rno}", produces= {MediaType.APPLICATION_ATOM_XML_VALUE,
										 MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Reply1VO> get(@PathVariable("rno") int rno){
		logger.debug("레스트컨트롤러 : 댓글 튜플 하나 가져오기. rno는 : "+rno);
		
		return new ResponseEntity<>(service.getReplyTuple(rno),HttpStatus.OK);
	}
	
	
	
	
	
	
	
	
	
}
