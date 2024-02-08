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

import com.portfolio.jdh.domain.recommendReplyVO;
import com.portfolio.jdh.service.recommendReplyService;

@Controller
@RequestMapping("/board/recommend")//어떤 url로 접속헤야지 이 콘트롤러로 접근할수 있는지
public class RecommendReplyController {
	
	@Inject
	private recommendReplyService replyService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//댓글조회는 recommendController
	//댓글작성
	@PostMapping(value="/write") //=> /reply/write
	public String recommendReplyWriteGet(recommendReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("get write");
		replyService.write(vo);
		rttr.addFlashAttribute("replyWriteSuccess", true);
		return "redirect:/board/recommend/recommendView?recommendNo="+vo.getrecommendNo();
	}
	
	
	//댓글 수정 (조회)
	@GetMapping(value="/replyModify")
	public void recommendReplyModifyGet(@RequestParam("recommendNo") int recommendNo, @RequestParam("recommendRno") int recommendRno, Model model)throws Exception{
		logger.info("get recommendReplyModify");
		recommendReplyVO vo = new recommendReplyVO();
		vo.setrecommendNo(recommendNo);
		vo.setrecommendRno(recommendRno);
		
		recommendReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 수정
	@PostMapping(value="/replyModify")
	public String recommendReplyModifyPost(recommendReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post recommendReplyModify");
		replyService.modify(vo);
		rttr.addFlashAttribute("replyModifySuccess", true);
		return "redirect:/board/recommend/recommendView?recommendNo="+vo.getrecommendNo();	
	}
	
	
	//댓글 삭제 (조회)
	@GetMapping(value="/replyDelete")
	public void recommendReplyDeleteGet(@RequestParam("recommendNo") int recommendNo, @RequestParam("recommendRno") int recommendRno, Model model)throws Exception{
		logger.info("get recommendReplyDelete");
		recommendReplyVO vo = new recommendReplyVO();
		vo.setrecommendNo(recommendNo);
		vo.setrecommendRno(recommendRno);
		
		recommendReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 삭제
	@PostMapping(value="/replyDelete")
	public String recommendReplyDeletePost(recommendReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post recommendReplyDelete");
		replyService.delete(vo);
		rttr.addFlashAttribute("replyDeleteSuccess", true);
		return "redirect:/board/recommend/recommendView?recommendNo="+vo.getrecommendNo();

	}
}
