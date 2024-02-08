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

import com.portfolio.jdh.domain.photoReplyVO;
import com.portfolio.jdh.service.photoReplyService;

@Controller
@RequestMapping("/board/photo")//어떤 url로 접속헤야지 이 콘트롤러로 접근할수 있는지
public class PhotoReplyController {
	
	@Inject
	private photoReplyService replyService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//댓글조회는 photoController
	//댓글작성
	@PostMapping(value="/write") //=> /reply/write
	public String photoReplyWriteGet(photoReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("get write");
		replyService.write(vo);
		rttr.addFlashAttribute("replyWriteSuccess", true);
		return "redirect:/board/photo/photoView?photoNo="+vo.getphotoNo();
	}
	
	
	//댓글 수정 (조회)
	@GetMapping(value="/replyModify")
	public void photoReplyModifyGet(@RequestParam("photoNo") int photoNo, @RequestParam("photoRno") int photoRno, Model model)throws Exception{
		logger.info("get photoReplyModify");
		photoReplyVO vo = new photoReplyVO();
		vo.setphotoNo(photoNo);
		vo.setphotoRno(photoRno);
		
		photoReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 수정
	@PostMapping(value="/replyModify")
	public String photoReplyModifyPost(photoReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post photoReplyModify");
		replyService.modify(vo);
		rttr.addFlashAttribute("replyModifySuccess", true);
		return "redirect:/board/photo/photoView?photoNo="+vo.getphotoNo();	
	}
	
	
	//댓글 삭제 (조회)
	@GetMapping(value="/replyDelete")
	public void photoReplyDeleteGet(@RequestParam("photoNo") int photoNo, @RequestParam("photoRno") int photoRno, Model model)throws Exception{
		logger.info("get photoReplyDelete");
		photoReplyVO vo = new photoReplyVO();
		vo.setphotoNo(photoNo);
		vo.setphotoRno(photoRno);
		
		photoReplyVO reply = replyService.replySelect(vo);
		
		model.addAttribute("reply",reply);
	}
	//댓글 삭제
	@PostMapping(value="/replyDelete")
	public String photoReplyDeletePost(photoReplyVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("post photoReplyDelete");
		replyService.delete(vo);
		rttr.addFlashAttribute("replyDeleteSuccess", true);
		return "redirect:/board/photo/photoView?photoNo="+vo.getphotoNo();

	}
}
