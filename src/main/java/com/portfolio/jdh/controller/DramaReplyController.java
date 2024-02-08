package com.portfolio.jdh.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.portfolio.jdh.domain.dramaReplyVO;
import com.portfolio.jdh.service.dramaReplyService;

@Controller
@RequestMapping("/board/literature/drama")//어떤 url로 접속헤야지 이 콘트롤러로 접근할수 있는지
public class DramaReplyController {
	
	@Inject
	private dramaReplyService replyService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//댓글조회는 literatureController
	//댓글작성
	@PostMapping(value="/write") //=> /reply/write
	public String dramaReplyWriteGet(dramaReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("get write");
		replyService.write(vo);
		rttr.addFlashAttribute("replyWriteSuccess", true);
		return "redirect:/board/literature/drama/dramaView?dramaNo="+vo.getdramaNo();
	}
	
	
	//댓글 수정 (조회)
	@GetMapping(value="/replyModify")
	public void dramaReplyModifyGet(@RequestParam("dramaNo") int dramaNo, @RequestParam("dramaRno") int dramaRno, Model model)throws Exception{
		logger.info("get dramaReplyModify");
		dramaReplyVO vo = new dramaReplyVO();
		vo.setdramaNo(dramaNo);
		vo.setdramaRno(dramaRno);
		
		dramaReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 수정
	@PostMapping(value="/replyModify")
	public String dramaReplyModifyPost(dramaReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post dramaReplyModify");
		replyService.modify(vo);
		rttr.addFlashAttribute("replyModifySuccess", true);
		return "redirect:/board/literature/drama/dramaView?dramaNo="+vo.getdramaNo();	
	}
	
	
	//댓글 삭제 (조회)
	@GetMapping(value="/replyDelete")
	public void dramaReplyDeleteGet(@RequestParam("dramaNo") int dramaNo, @RequestParam("dramaRno") int dramaRno, Model model)throws Exception{
		logger.info("get dramaReplyDelete");
		dramaReplyVO vo = new dramaReplyVO();
		vo.setdramaNo(dramaNo);
		vo.setdramaRno(dramaRno);
		
		dramaReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 삭제
	@PostMapping(value="/replyDelete")
	public String dramaReplyDeletePost(dramaReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post dramaReplyDelete");
		replyService.delete(vo);
		rttr.addFlashAttribute("replyDeleteSuccess", true);
		return "redirect:/board/literature/drama/dramaView?dramaNo="+vo.getdramaNo();	
	}
	


}
