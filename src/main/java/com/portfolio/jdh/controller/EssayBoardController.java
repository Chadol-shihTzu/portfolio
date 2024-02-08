package com.portfolio.jdh.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.portfolio.jdh.domain.Page;
import com.portfolio.jdh.domain.essayBoardVO;
import com.portfolio.jdh.domain.essayReplyVO;
import com.portfolio.jdh.service.essayBoardService;
import com.portfolio.jdh.service.essayReplyService;

@Controller
@RequestMapping("/board/literature/essay")
public class EssayBoardController {
	
	@Inject
	essayBoardService essayservice;
	
	@Inject
	essayReplyService essayreplyservice;
	
	private static final Logger logger = LoggerFactory.getLogger(EssayBoardController.class);

	@GetMapping(value = "/essayWrite")
	public void essayWriteGet(HttpSession session, Model model) {
		logger.info("get essayWite");
		
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg", "login_error");
		}
	}
	
	@PostMapping(value = "/essayWrite")
	public String essayWritePost(essayBoardVO vo, RedirectAttributes rttr)throws Exception {
		logger.info("post essayWrite");
		essayservice.write(vo);
		rttr.addFlashAttribute("essayWriteSuccess", true);
		return "redirect:/board/literature/essay/essaylistPageSearch?num=1";
	}
	
	@GetMapping(value = "/essayView")
	public void essayViewGet(@RequestParam("essayNo") int essayNo,HttpSession session, Model model)throws Exception {
		logger.info("get essayView");
		essayBoardVO vo = essayservice.view(essayNo, session);
		//댓글목록조회
		List<essayReplyVO> reply = null;
		reply = essayreplyservice.list(essayNo);
		model.addAttribute("reply", reply);
		model.addAttribute("view", vo);
	}
	
	@GetMapping(value = "/essayUpdate")
	public void essayUpdateGet(@RequestParam("essayNo") int essayNo, Model model, HttpSession session) throws Exception {
	    logger.info("get essayUpdate");
	    try {
	        essayBoardVO vo = essayservice.view(essayNo, session);
	        if (vo != null) {
	            model.addAttribute("view", vo);
	        } else {
	            // 조회된 게시물이 없을 경우 예외 처리 또는 다른 적절한 조치를 취할 수 있습니다.
	            // 여기에서는 간단하게 로그를 출력합니다.
	            logger.warn("조회된 게시물이 없습니다. essayNo: " + essayNo);
	        }
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 출력하고 다시 예외를 던질 수 있습니다.
	        logger.error("게시물 조회 중 오류가 발생했습니다.", e);
	        throw e;
	    }
	}

	@PostMapping(value = "/essayUpdate")
	public String essayUpdatePost(essayBoardVO vo, RedirectAttributes rttr) throws Exception {
	    logger.info("post essayUpate");
	    try {
	        essayservice.modify(vo);
	        rttr.addFlashAttribute("essayUpdateSuccess", true);
	        return "redirect:/board/literature/essay/essayView?essayNo=" + vo.getessayNo();
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 출력하고 다시 예외를 던질 수 있습니다.
	        logger.error("게시물 수정 중 오류가 발생했습니다.", e);      
	        throw e;
	        
	    }
	}
	
	@GetMapping(value="/essayDelete")
	public void essayDeleteGet(@RequestParam("essayNo") int essayNo, Model model)throws Exception{
		logger.info("get essayDelete");
		
		model.addAttribute("delete", essayNo);
	}
	
	@PostMapping(value="/essayDelete")
	public String essayDeletePost(@RequestParam("essayNo") int essayNo, RedirectAttributes rttr)throws Exception{
		logger.info("post essayDelete");
		essayservice.delete(essayNo);
		rttr.addFlashAttribute("essayDeleteSuccess", true);
		return "redirect:/board/literature/essay/essaylistPageSearch?num=1";
	}
	
	//공지사항 게시물 페이징
		@GetMapping(value="/essaylistPageSearch")
		public void essaylistPageSearchGet(Model model, @RequestParam("num") int num, 
				@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType, 
				@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception{
			logger.info("get essaylistPageSearch");
			Page page = new Page();
			
			page.setNum(num);
			//page.setCount(annoservice.count());  
			page.setCount(essayservice.searchCount(searchType, keyword));
			
			// 검색 타입과 검색어
			//page.setSearchTypeKeyword(searchType, keyword);
			page.setSearchType(searchType);
			page.setKeyword(keyword);
			
			List<essayBoardVO> list = null; 
			//list = annoservice.listPage(page.getDisplayPost(), page.getPostNum());
			list = essayservice.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

			model.addAttribute("list", list);   
			model.addAttribute("page",page);
			model.addAttribute("select", num);
			
		}
	

	
}
