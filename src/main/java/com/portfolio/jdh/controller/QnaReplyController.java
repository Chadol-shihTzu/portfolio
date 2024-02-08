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

import com.portfolio.jdh.domain.qnaReplyVO;
import com.portfolio.jdh.service.qnaReplyService;

@Controller
@RequestMapping("/board/qna")//어떤 url로 접속헤야지 이 콘트롤러로 접근할수 있는지
public class QnaReplyController {
	
	@Inject
	private qnaReplyService replyService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//댓글조회는 qnaController
	//댓글작성
	@PostMapping(value="/write") //=> /reply/write
	public String qnaReplyWriteGet(qnaReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("get write");
		replyService.write(vo);
		rttr.addFlashAttribute("replyWriteSuccess", true);
		return "redirect:/board/qna/qnaView?qnaNo="+vo.getqnaNo();
	}
	
	
	//댓글 수정 (조회)
	@GetMapping(value="/replyModify")
	public void qnaReplyModifyGet(@RequestParam("qnaNo") int qnaNo, @RequestParam("qnaRno") int qnaRno, Model model)throws Exception{
		logger.info("get qnaReplyModify");
		qnaReplyVO vo = new qnaReplyVO();
		vo.setqnaNo(qnaNo);
		vo.setqnaRno(qnaRno);
		
		qnaReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 수정
	@PostMapping(value="/replyModify")
	public String qnaReplyModifyPost(qnaReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post qnaReplyModify");
		replyService.modify(vo);
		rttr.addFlashAttribute("replyModifySuccess", true);
		return "redirect:/board/qna/qnaView?qnaNo="+vo.getqnaNo();	
	}
	
	
	//댓글 삭제 (조회)
	@GetMapping(value="/replyDelete")
	public void qnaReplyDeleteGet(@RequestParam("qnaNo") int qnaNo, @RequestParam("qnaRno") int qnaRno, Model model)throws Exception{
		logger.info("get qnaReplyDelete");
		qnaReplyVO vo = new qnaReplyVO();
		vo.setqnaNo(qnaNo);
		vo.setqnaRno(qnaRno);
		
		qnaReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 삭제
	@PostMapping(value="/replyDelete")
	public String qnaReplyDeletePost(qnaReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post qnaReplyDelete");
		replyService.delete(vo);
		rttr.addFlashAttribute("replyDeleteSuccess", true);
		return "redirect:/board/qna/qnaView?qnaNo="+vo.getqnaNo();	
	}
	


}
