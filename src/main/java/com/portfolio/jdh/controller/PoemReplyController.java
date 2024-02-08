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

import com.portfolio.jdh.domain.poemReplyVO;
import com.portfolio.jdh.service.poemReplyService;

@Controller
@RequestMapping("/board/literature/poem")//어떤 url로 접속헤야지 이 콘트롤러로 접근할수 있는지
public class PoemReplyController {
	
	@Inject
	private poemReplyService replyService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//댓글조회는 literatureController
	//댓글작성
	@PostMapping(value="/write") //=> /reply/write
	public String poemReplyWriteGet(poemReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("get write");
		replyService.write(vo);
		rttr.addFlashAttribute("replyWriteSuccess", true);
		return "redirect:/board/literature/poem/poemView?poemNo="+vo.getpoemNo();
	}
	
	
	//댓글 수정 (조회)
	@GetMapping(value="/replyModify")
	public void poemReplyModifyGet(@RequestParam("poemNo") int poemNo, @RequestParam("poemRno") int poemRno, Model model)throws Exception{
		logger.info("get poemReplyModify");
		poemReplyVO vo = new poemReplyVO();
		vo.setpoemNo(poemNo);
		vo.setpoemRno(poemRno);
		
		poemReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 수정
	@PostMapping(value="/replyModify")
	public String poemReplyModifyPost(poemReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post poemReplyModify");
		replyService.modify(vo);
		rttr.addFlashAttribute("replyModifySuccess", true);
		return "redirect:/board/literature/poem/poemView?poemNo="+vo.getpoemNo();	
	}
	
	
	//댓글 삭제 (조회)
	@GetMapping(value="/replyDelete")
	public void poemReplyDeleteGet(@RequestParam("poemNo") int poemNo, @RequestParam("poemRno") int poemRno, Model model)throws Exception{
		logger.info("get poemReplyDelete");
		poemReplyVO vo = new poemReplyVO();
		vo.setpoemNo(poemNo);
		vo.setpoemRno(poemRno);
		
		poemReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 삭제
	@PostMapping(value="/replyDelete")
	public String poemReplyDeletePost(poemReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post poemReplyDelete");
		replyService.delete(vo);
		rttr.addFlashAttribute("replyDeleteSuccess", true);
		return "redirect:/board/literature/poem/poemView?poemNo="+vo.getpoemNo();	
	}
	


}
