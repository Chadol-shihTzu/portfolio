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
import com.portfolio.jdh.domain.poemBoardVO;
import com.portfolio.jdh.domain.poemReplyVO;
import com.portfolio.jdh.service.poemBoardService;
import com.portfolio.jdh.service.poemReplyService;

@Controller
@RequestMapping("/board/literature/poem")
public class PoemBoardController {
	
	@Inject
	poemBoardService poemservice;
	
	@Inject
	poemReplyService poemreplyservice;
	
	private static final Logger logger = LoggerFactory.getLogger(PoemBoardController.class);

	@GetMapping(value = "/poemWrite")
	public void poemWriteGet(HttpSession session, Model model) {
		logger.info("get poemWite");
		
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg", "login_error");
		}
	}
	
	@PostMapping(value = "/poemWrite")
	public String poemWritePost(poemBoardVO vo, RedirectAttributes rttr)throws Exception {
		logger.info("post poemWrite");
		poemservice.write(vo);
		rttr.addFlashAttribute("poemWriteSuccess", true);
		return "redirect:/board/literature/poem/poemlistPageSearch?num=1";
	}
	
	@GetMapping(value = "/poemView")
	public void poemViewGet(@RequestParam("poemNo") int poemNo,HttpSession session, Model model)throws Exception {
		logger.info("get poemView");
		poemBoardVO vo = poemservice.view(poemNo, session);
		//댓글목록조회
		List<poemReplyVO> reply = null;
		reply = poemreplyservice.list(poemNo);
		model.addAttribute("reply", reply);
		model.addAttribute("view", vo);
	}
	
	@GetMapping(value = "/poemUpdate")
	public void poemUpdateGet(@RequestParam("poemNo") int poemNo, Model model, HttpSession session) throws Exception {
	    logger.info("get poemUpdate");
	    try {
	        poemBoardVO vo = poemservice.view(poemNo, session);
	        if (vo != null) {
	            model.addAttribute("view", vo);
	        } else {
	            // 조회된 게시물이 없을 경우 예외 처리 또는 다른 적절한 조치를 취할 수 있습니다.
	            // 여기에서는 간단하게 로그를 출력합니다.
	            logger.warn("조회된 게시물이 없습니다. poemNo: " + poemNo);
	        }
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 출력하고 다시 예외를 던질 수 있습니다.
	        logger.error("게시물 조회 중 오류가 발생했습니다.", e);
	        throw e;
	    }
	}

	@PostMapping(value = "/poemUpdate")
	public String poemUpdatePost(poemBoardVO vo, RedirectAttributes rttr) throws Exception {
	    logger.info("post poemUpate");
	    try {
	        poemservice.modify(vo);
	        rttr.addFlashAttribute("poemUpdateSuccess", true);
	        return "redirect:/board/literature/poem/poemView?poemNo=" + vo.getpoemNo();
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 출력하고 다시 예외를 던질 수 있습니다.
	        logger.error("게시물 수정 중 오류가 발생했습니다.", e);      
	        throw e;
	        
	    }
	}
	
	@GetMapping(value="/poemDelete")
	public void poemDeleteGet(@RequestParam("poemNo") int poemNo, Model model)throws Exception{
		logger.info("get poemDelete");
		
		model.addAttribute("delete", poemNo);
	}
	
	@PostMapping(value="/poemDelete")
	public String poemDeletePost(@RequestParam("poemNo") int poemNo, RedirectAttributes rttr)throws Exception{
		logger.info("post poemDelete");
		poemservice.delete(poemNo);
		rttr.addFlashAttribute("poemDeleteSuccess", true);
		return "redirect:/board/literature/poem/poemlistPageSearch?num=1";
	}
	
	//공지사항 게시물 페이징
		@GetMapping(value="/poemlistPageSearch")
		public void poemlistPageSearchGet(Model model, @RequestParam("num") int num, 
				@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType, 
				@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception{
			logger.info("get poemlistPageSearch");
			Page page = new Page();
			
			page.setNum(num);
			//page.setCount(annoservice.count());  
			page.setCount(poemservice.searchCount(searchType, keyword));
			
			// 검색 타입과 검색어
			//page.setSearchTypeKeyword(searchType, keyword);
			page.setSearchType(searchType);
			page.setKeyword(keyword);
			
			List<poemBoardVO> list = null; 
			//list = annoservice.listPage(page.getDisplayPost(), page.getPostNum());
			list = poemservice.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

			model.addAttribute("list", list);   
			model.addAttribute("page",page);
			model.addAttribute("select", num);
			
		}
	

	
}
