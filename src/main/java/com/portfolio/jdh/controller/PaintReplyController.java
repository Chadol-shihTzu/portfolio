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

import com.portfolio.jdh.domain.paintReplyVO;
import com.portfolio.jdh.service.paintReplyService;

@Controller
@RequestMapping("/board/paint")//어떤 url로 접속헤야지 이 콘트롤러로 접근할수 있는지
public class PaintReplyController {
	
	@Inject
	private paintReplyService replyService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//댓글조회는 paintController
	//댓글작성
	@PostMapping(value="/write") //=> /reply/write
	public String paintReplyWriteGet(paintReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("get write");
		replyService.write(vo);
		rttr.addFlashAttribute("replyWriteSuccess", true);
		return "redirect:/board/paint/paintView?paintNo="+vo.getpaintNo();
	}
	
	
	//댓글 수정 (조회)
	@GetMapping(value="/replyModify")
	public void paintReplyModifyGet(@RequestParam("paintNo") int paintNo, @RequestParam("paintRno") int paintRno, Model model)throws Exception{
		logger.info("get paintReplyModify");
		paintReplyVO vo = new paintReplyVO();
		vo.setpaintNo(paintNo);
		vo.setpaintRno(paintRno);
		
		paintReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 수정
	@PostMapping(value="/replyModify")
	public String paintReplyModifyPost(paintReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post paintReplyModify");
		replyService.modify(vo);
		rttr.addFlashAttribute("replyModifySuccess", true);
		return "redirect:/board/paint/paintView?paintNo="+vo.getpaintNo();	
	}
	
	
	//댓글 삭제 (조회)
	@GetMapping(value="/replyDelete")
	public void paintReplyDeleteGet(@RequestParam("paintNo") int paintNo, @RequestParam("paintRno") int paintRno, Model model)throws Exception{
		logger.info("get paintReplyDelete");
		paintReplyVO vo = new paintReplyVO();
		vo.setpaintNo(paintNo);
		vo.setpaintRno(paintRno);
		
		paintReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 삭제
	@PostMapping(value="/replyDelete")
	public String paintReplyDeletePost(paintReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post paintReplyDelete");
		replyService.delete(vo);
		rttr.addFlashAttribute("replyDeleteSuccess", true);
		return "redirect:/board/paint/paintView?paintNo="+vo.getpaintNo();

	}
}
