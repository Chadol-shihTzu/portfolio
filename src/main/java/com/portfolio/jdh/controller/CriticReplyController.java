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

import com.portfolio.jdh.domain.criticReplyVO;
import com.portfolio.jdh.service.criticReplyService;

@Controller
@RequestMapping("/board/literature/criticism")//어떤 url로 접속헤야지 이 콘트롤러로 접근할수 있는지
public class CriticReplyController {
	
	@Inject
	private criticReplyService replyService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//댓글조회는 literatureController
	//댓글작성
	@PostMapping(value="/write") //=> /reply/write
	public String criticReplyWriteGet(criticReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("get write");
		replyService.write(vo);
		rttr.addFlashAttribute("replyWriteSuccess", true);
		return "redirect:/board/literature/criticism/criticView?criticNo="+vo.getCriticNo();
	}
	
	
	//댓글 수정 (조회)
	@GetMapping(value="/replyModify")
	public void criticReplyModifyGet(@RequestParam("criticNo") int criticNo, @RequestParam("criticRno") int criticRno, Model model)throws Exception{
		logger.info("get criticReplyModify");
		criticReplyVO vo = new criticReplyVO();
		vo.setCriticNo(criticNo);
		vo.setCriticRno(criticRno);
		
		criticReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 수정
	@PostMapping(value="/replyModify")
	public String criticReplyModifyPost(criticReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post criticReplyModify");
		replyService.modify(vo);
		rttr.addFlashAttribute("replyModifySuccess", true);
		return "redirect:/board/literature/criticism/criticView?criticNo="+vo.getCriticNo();	
	}
	
	
	//댓글 삭제 (조회)
	@GetMapping(value="/replyDelete")
	public void criticReplyDeleteGet(@RequestParam("criticNo") int criticNo, @RequestParam("criticRno") int criticRno, Model model)throws Exception{
		logger.info("get criticReplyDelete");
		criticReplyVO vo = new criticReplyVO();
		vo.setCriticNo(criticNo);
		vo.setCriticRno(criticRno);
		
		criticReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 삭제
	@PostMapping(value="/replyDelete")
	public String criticReplyDeletePost(criticReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post criticReplyDelete");
		replyService.delete(vo);
		rttr.addFlashAttribute("replyDeleteSuccess", true);
		return "redirect:/board/literature/criticism/criticView?criticNo="+vo.getCriticNo();	
	}
	


}
