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
import com.portfolio.jdh.domain.novelBoardVO;
import com.portfolio.jdh.domain.novelReplyVO;
import com.portfolio.jdh.service.novelBoardService;
import com.portfolio.jdh.service.novelReplyService;

@Controller
@RequestMapping("/board/literature/novel")
public class NovelBoardController {
	
	@Inject
	novelBoardService novelservice;
	
	@Inject
	novelReplyService novelreplyservice;
	
	private static final Logger logger = LoggerFactory.getLogger(NovelBoardController.class);

	@GetMapping(value = "/novelWrite")
	public void novelWriteGet(HttpSession session, Model model) {
		logger.info("get novelWite");
		
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg", "login_error");
		}
	}
	
	@PostMapping(value = "/novelWrite")
	public String novelWritePost(novelBoardVO vo, RedirectAttributes rttr)throws Exception {
		logger.info("post novelWrite");
		novelservice.write(vo);
		rttr.addFlashAttribute("novelWriteSuccess", true);
		return "redirect:/board/literature/novel/novellistPageSearch?num=1";
	}
	
	@GetMapping(value = "/novelView")
	public void novelViewGet(@RequestParam("novelNo") int novelNo,HttpSession session, Model model)throws Exception {
		logger.info("get novelView");
		novelBoardVO vo = novelservice.view(novelNo, session);
		//댓글목록조회
		List<novelReplyVO> reply = null;
		reply = novelreplyservice.list(novelNo);
		model.addAttribute("reply", reply);
		model.addAttribute("view", vo);
	}
	
	@GetMapping(value = "/novelUpdate")
	public void novelUpdateGet(@RequestParam("novelNo") int novelNo, Model model, HttpSession session) throws Exception {
	    logger.info("get novelUpdate");
	    try {
	        novelBoardVO vo = novelservice.view(novelNo, session);
	        if (vo != null) {
	            model.addAttribute("view", vo);
	        } else {
	            // 조회된 게시물이 없을 경우 예외 처리 또는 다른 적절한 조치를 취할 수 있습니다.
	            // 여기에서는 간단하게 로그를 출력합니다.
	            logger.warn("조회된 게시물이 없습니다. novelNo: " + novelNo);
	        }
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 출력하고 다시 예외를 던질 수 있습니다.
	        logger.error("게시물 조회 중 오류가 발생했습니다.", e);
	        throw e;
	    }
	}

	@PostMapping(value = "/novelUpdate")
	public String novelUpdatePost(novelBoardVO vo, RedirectAttributes rttr) throws Exception {
	    logger.info("post novelUpate");
	    try {
	        novelservice.modify(vo);
	        rttr.addFlashAttribute("novelUpdateSuccess", true);
	        return "redirect:/board/literature/novel/novelView?novelNo=" + vo.getnovelNo();
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 출력하고 다시 예외를 던질 수 있습니다.
	        logger.error("게시물 수정 중 오류가 발생했습니다.", e);      
	        throw e;
	        
	    }
	}
	
	@GetMapping(value="/novelDelete")
	public void novelDeleteGet(@RequestParam("novelNo") int novelNo, Model model)throws Exception{
		logger.info("get novelDelete");
		
		model.addAttribute("delete", novelNo);
	}
	
	@PostMapping(value="/novelDelete")
	public String novelDeletePost(@RequestParam("novelNo") int novelNo, RedirectAttributes rttr)throws Exception{
		logger.info("post novelDelete");
		novelservice.delete(novelNo);
		rttr.addFlashAttribute("novelDeleteSuccess", true);
		return "redirect:/board/literature/novel/novellistPageSearch?num=1";
	}
	
	//공지사항 게시물 페이징
		@GetMapping(value="/novellistPageSearch")
		public void novellistPageSearchGet(Model model, @RequestParam("num") int num, 
				@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType, 
				@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception{
			logger.info("get novellistPageSearch");
			Page page = new Page();
			
			page.setNum(num);
			//page.setCount(annoservice.count());  
			page.setCount(novelservice.searchCount(searchType, keyword));
			
			// 검색 타입과 검색어
			//page.setSearchTypeKeyword(searchType, keyword);
			page.setSearchType(searchType);
			page.setKeyword(keyword);
			
			List<novelBoardVO> list = null; 
			//list = annoservice.listPage(page.getDisplayPost(), page.getPostNum());
			list = novelservice.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

			model.addAttribute("list", list);   
			model.addAttribute("page",page);
			model.addAttribute("select", num);
			
		}
	

	
}
