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
import com.portfolio.jdh.domain.dramaBoardVO;
import com.portfolio.jdh.domain.dramaReplyVO;
import com.portfolio.jdh.service.dramaBoardService;
import com.portfolio.jdh.service.dramaReplyService;

@Controller
@RequestMapping("/board/literature/drama")
public class DramaBoardController {
	
	@Inject
	dramaBoardService dramaservice;
	
	@Inject
	dramaReplyService dramareplyservice;
	
	private static final Logger logger = LoggerFactory.getLogger(DramaBoardController.class);

	@GetMapping(value = "/dramaWrite")
	public void dramaWriteGet(HttpSession session, Model model) {
		logger.info("get dramaWite");
		
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg", "login_error");
		}
	}
	
	@PostMapping(value = "/dramaWrite")
	public String dramaWritePost(dramaBoardVO vo, RedirectAttributes rttr)throws Exception {
		logger.info("post dramaWrite");
		dramaservice.write(vo);
		rttr.addFlashAttribute("dramaWriteSuccess", true);
		return "redirect:/board/literature/drama/dramalistPageSearch?num=1";
	}
	
	@GetMapping(value = "/dramaView")
	public void dramaViewGet(@RequestParam("dramaNo") int dramaNo,HttpSession session, Model model)throws Exception {
		logger.info("get dramaView");
		dramaBoardVO vo = dramaservice.view(dramaNo, session);
		//댓글목록조회
		List<dramaReplyVO> reply = null;
		reply = dramareplyservice.list(dramaNo);
		model.addAttribute("reply", reply);
		model.addAttribute("view", vo);
	}
	
	@GetMapping(value = "/dramaUpdate")
	public void dramaUpdateGet(@RequestParam("dramaNo") int dramaNo, Model model, HttpSession session) throws Exception {
	    logger.info("get dramaUpdate");
	    try {
	        dramaBoardVO vo = dramaservice.view(dramaNo, session);
	        if (vo != null) {
	            model.addAttribute("view", vo);
	        } else {
	            // 조회된 게시물이 없을 경우 예외 처리 또는 다른 적절한 조치를 취할 수 있습니다.
	            // 여기에서는 간단하게 로그를 출력합니다.
	            logger.warn("조회된 게시물이 없습니다. dramaNo: " + dramaNo);
	        }
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 출력하고 다시 예외를 던질 수 있습니다.
	        logger.error("게시물 조회 중 오류가 발생했습니다.", e);
	        throw e;
	    }
	}

	@PostMapping(value = "/dramaUpdate")
	public String dramaUpdatePost(dramaBoardVO vo, RedirectAttributes rttr) throws Exception {
	    logger.info("post dramaUpate");
	    try {
	        dramaservice.modify(vo);
	        rttr.addFlashAttribute("dramaUpdateSuccess", true);
	        return "redirect:/board/literature/drama/dramaView?dramaNo=" + vo.getdramaNo();
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 출력하고 다시 예외를 던질 수 있습니다.
	        logger.error("게시물 수정 중 오류가 발생했습니다.", e);      
	        throw e;
	        
	    }
	}
	
	@GetMapping(value="/dramaDelete")
	public void dramaDeleteGet(@RequestParam("dramaNo") int dramaNo, Model model)throws Exception{
		logger.info("get dramaDelete");
		
		model.addAttribute("delete", dramaNo);
	}
	
	@PostMapping(value="/dramaDelete")
	public String dramaDeletePost(@RequestParam("dramaNo") int dramaNo, RedirectAttributes rttr)throws Exception{
		logger.info("post dramaDelete");
		dramaservice.delete(dramaNo);
		rttr.addFlashAttribute("dramaDeleteSuccess", true);
		return "redirect:/board/literature/drama/dramalistPageSearch?num=1";
	}
	
	//공지사항 게시물 페이징
		@GetMapping(value="/dramalistPageSearch")
		public void dramalistPageSearchGet(Model model, @RequestParam("num") int num, 
				@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType, 
				@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception{
			logger.info("get dramalistPageSearch");
			Page page = new Page();
			
			page.setNum(num);
			//page.setCount(annoservice.count());  
			page.setCount(dramaservice.searchCount(searchType, keyword));
			
			// 검색 타입과 검색어
			//page.setSearchTypeKeyword(searchType, keyword);
			page.setSearchType(searchType);
			page.setKeyword(keyword);
			
			List<dramaBoardVO> list = null; 
			//list = annoservice.listPage(page.getDisplayPost(), page.getPostNum());
			list = dramaservice.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

			model.addAttribute("list", list);   
			model.addAttribute("page",page);
			model.addAttribute("select", num);
			
		}
	

	
}
