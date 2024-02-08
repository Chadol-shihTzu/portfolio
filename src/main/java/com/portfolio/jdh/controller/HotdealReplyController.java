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

import com.portfolio.jdh.domain.hotdealReplyVO;
import com.portfolio.jdh.service.hotdealReplyService;

@Controller
@RequestMapping("/board/hotdeal")//어떤 url로 접속헤야지 이 콘트롤러로 접근할수 있는지
public class HotdealReplyController {
	
	@Inject
	private hotdealReplyService replyService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//댓글조회는 hotdealController
	//댓글작성
	@PostMapping(value="/write") //=> /reply/write
	public String hotdealReplyWriteGet(hotdealReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("get write");
		replyService.write(vo);
		rttr.addFlashAttribute("replyWriteSuccess", true);
		return "redirect:/board/hotdeal/hotdealView?hotNo="+vo.gethotNo();
	}
	
	
	//댓글 수정 (조회)
	@GetMapping(value="/replyModify")
	public void hotdealReplyModifyGet(@RequestParam("hotNo") int hotNo, @RequestParam("hotRno") int hotRno, Model model)throws Exception{
		logger.info("get hotdealReplyModify");
		hotdealReplyVO vo = new hotdealReplyVO();
		vo.sethotNo(hotNo);
		vo.sethotRno(hotRno);
		
		hotdealReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 수정
	@PostMapping(value="/replyModify")
	public String hotdealReplyModifyPost(hotdealReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post hotdealReplyModify");
		replyService.modify(vo);
		rttr.addFlashAttribute("replyModifySuccess", true);
		return "redirect:/board/hotdeal/hotdealView?hotNo="+vo.gethotNo();	
	}
	
	
	//댓글 삭제 (조회)
	@GetMapping(value="/replyDelete")
	public void hotdealReplyDeleteGet(@RequestParam("hotNo") int hotNo, @RequestParam("hotRno") int hotRno, Model model)throws Exception{
		logger.info("get hotdealReplyDelete");
		hotdealReplyVO vo = new hotdealReplyVO();
		vo.sethotNo(hotNo);
		vo.sethotRno(hotRno);
		
		hotdealReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 삭제
	@PostMapping(value="/replyDelete")
	public String hotdealReplyDeletePost(hotdealReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post hotdealReplyDelete");
		replyService.delete(vo);
		rttr.addFlashAttribute("replyDeleteSuccess", true);
		return "redirect:/board/hotdeal/hotdealView?hotNo="+vo.gethotNo();

	}
}
