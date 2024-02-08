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

import com.portfolio.jdh.domain.novelReplyVO;
import com.portfolio.jdh.service.novelReplyService;

@Controller
@RequestMapping("/board/literature/novel")//어떤 url로 접속헤야지 이 콘트롤러로 접근할수 있는지
public class NovelReplyController {
	
	@Inject
	private novelReplyService replyService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//댓글조회는 literatureController
	//댓글작성
	@PostMapping(value="/write") //=> /reply/write
	public String novelReplyWriteGet(novelReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("get write");
		replyService.write(vo);
		rttr.addFlashAttribute("replyWriteSuccess", true);
		return "redirect:/board/literature/novel/novelView?novelNo="+vo.getnovelNo();
	}
	
	
	//댓글 수정 (조회)
	@GetMapping(value="/replyModify")
	public void novelReplyModifyGet(@RequestParam("novelNo") int novelNo, @RequestParam("novelRno") int novelRno, Model model)throws Exception{
		logger.info("get novelReplyModify");
		novelReplyVO vo = new novelReplyVO();
		vo.setnovelNo(novelNo);
		vo.setnovelRno(novelRno);
		
		novelReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 수정
	@PostMapping(value="/replyModify")
	public String novelReplyModifyPost(novelReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post novelReplyModify");
		replyService.modify(vo);
		rttr.addFlashAttribute("replyModifySuccess", true);
		return "redirect:/board/literature/novel/novelView?novelNo="+vo.getnovelNo();	
	}
	
	
	//댓글 삭제 (조회)
	@GetMapping(value="/replyDelete")
	public void novelReplyDeleteGet(@RequestParam("novelNo") int novelNo, @RequestParam("novelRno") int novelRno, Model model)throws Exception{
		logger.info("get novelReplyDelete");
		novelReplyVO vo = new novelReplyVO();
		vo.setnovelNo(novelNo);
		vo.setnovelRno(novelRno);
		
		novelReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 삭제
	@PostMapping(value="/replyDelete")
	public String novelReplyDeletePost(novelReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post novelReplyDelete");
		replyService.delete(vo);
		rttr.addFlashAttribute("replyDeleteSuccess", true);
		return "redirect:/board/literature/novel/novelView?novelNo="+vo.getnovelNo();	
	}
	


}
