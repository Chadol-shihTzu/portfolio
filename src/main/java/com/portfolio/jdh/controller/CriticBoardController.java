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
import com.portfolio.jdh.domain.criticBoardVO;
import com.portfolio.jdh.domain.criticReplyVO;
import com.portfolio.jdh.service.criticBoardService;
import com.portfolio.jdh.service.criticReplyService;

@Controller
@RequestMapping("/board/literature/criticism")
public class CriticBoardController {
	
	@Inject
	criticBoardService criticservice;
	
	@Inject
	criticReplyService criticreplyservice;
	
	private static final Logger logger = LoggerFactory.getLogger(CriticBoardController.class);
	
	@GetMapping(value = "/novel/novelList")
	public void novelListGet() {
		logger.info("get novelList");
	}
	
	@GetMapping(value = "/essay/essayList")
	public void essayListGet() {
		logger.info("get essayList");
	}
	
	@GetMapping(value = "/drama/dramaList")
	public void dramaListGet() {
		logger.info("get dramaList");
	}
	
	
	@GetMapping(value = "/criticWrite")
	public void criticWriteGet(HttpSession session, Model model) {
		logger.info("get criticWite");
		
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg", "login_error");
		}
	}
	
	@PostMapping(value = "/criticWrite")
	public String criticWritePost(criticBoardVO vo, RedirectAttributes rttr)throws Exception {
		logger.info("post criticWrite");
		criticservice.write(vo);
		rttr.addFlashAttribute("criticWriteSuccess", true);
		return "redirect:/board/literature/criticism/criticlistPageSearch?num=1";
	}
	
	//글 상세조회 + 댓글 리스트 조회
	@GetMapping(value = "/criticView")
	public void criticViewGet(@RequestParam("criticNo") int criticNo,HttpSession session, Model model)throws Exception {
		logger.info("get criticView");
		criticBoardVO vo = criticservice.view(criticNo, session);
		//댓글목록조회
		List<criticReplyVO> reply = null;
		reply = criticreplyservice.list(criticNo);
		model.addAttribute("reply", reply);
		model.addAttribute("view", vo);
	}
	
	@GetMapping(value = "/criticUpdate")
	public void criticUpdateGet(@RequestParam("criticNo") int criticNo, Model model, HttpSession session) throws Exception {
	    logger.info("get criticUpdate");
	    try {
	        criticBoardVO vo = criticservice.view(criticNo, session);
	        if (vo != null) {
	            model.addAttribute("view", vo);
	        } else {
	            // 조회된 게시물이 없을 경우 예외 처리 또는 다른 적절한 조치를 취할 수 있습니다.
	            // 여기에서는 간단하게 로그를 출력합니다.
	            logger.warn("조회된 게시물이 없습니다. criticNo: " + criticNo);
	        }
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 출력하고 다시 예외를 던질 수 있습니다.
	        logger.error("게시물 조회 중 오류가 발생했습니다.", e);
	        throw e;
	    }
	}

	@PostMapping(value = "/criticUpdate")
	public String criticUpdatePost(criticBoardVO vo, RedirectAttributes rttr) throws Exception {
	    logger.info("post criticUpate");
	    try {
	        criticservice.modify(vo);
	        rttr.addFlashAttribute("criticUpdateSuccess", true);
	        return "redirect:/board/literature/criticism/criticView?criticNo=" + vo.getCriticNo();
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 출력하고 다시 예외를 던질 수 있습니다.
	        logger.error("게시물 수정 중 오류가 발생했습니다.", e);      
	        throw e;
	        
	    }
	}
	
	@GetMapping(value="/criticDelete")
	public void criticDeleteGet(@RequestParam("criticNo") int criticNo, Model model)throws Exception{
		logger.info("get criticDelete");
		
		model.addAttribute("delete", criticNo);
	}
	
	@PostMapping(value="/criticDelete")
	public String criticDeletePost(@RequestParam("criticNo") int criticNo, RedirectAttributes rttr)throws Exception{
		logger.info("post criticDelete");
		criticservice.delete(criticNo);
		rttr.addFlashAttribute("criticDeleteSuccess", true);
		return "redirect:/board/literature/criticism/criticlistPageSearch?num=1";
	}
	
	//공지사항 게시물 페이징
		@GetMapping(value="/criticlistPageSearch")
		public void criticlistPageSearchGet(Model model, @RequestParam("num") int num, 
				@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType, 
				@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception{
			logger.info("get criticlistPageSearch");
			Page page = new Page();
			
			page.setNum(num);
			//page.setCount(annoservice.count());  
			page.setCount(criticservice.searchCount(searchType, keyword));
			
			// 검색 타입과 검색어
			//page.setSearchTypeKeyword(searchType, keyword);
			page.setSearchType(searchType);
			page.setKeyword(keyword);
			
			List<criticBoardVO> list = null; 
			//list = annoservice.listPage(page.getDisplayPost(), page.getPostNum());
			list = criticservice.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

			model.addAttribute("list", list);   
			model.addAttribute("page",page);
			model.addAttribute("select", num);
			
		}
	

	
}
