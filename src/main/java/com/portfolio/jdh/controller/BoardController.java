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
import com.portfolio.jdh.domain.annoBoardVO;
import com.portfolio.jdh.service.annoBoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Inject
	annoBoardService annoservice;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@GetMapping(value = "/announce/announceList")
	public void announceListGet(Model model) throws Exception {
		logger.info("get announceList");
		
		List<annoBoardVO> list = null;
		list = annoservice.list();
		
		model.addAttribute("list",list);
	}
	
	@GetMapping(value = "/announce/announceWrite")
	public void announceWriteGet(HttpSession session, Model model) {
		logger.info("get announceWrite");
		
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg", "login_error");
		}
	}
	
	@PostMapping(value = "/announce/announceWrite")
	public String announceWritePost(annoBoardVO vo, RedirectAttributes rttr)throws Exception {
		logger.info("post announceWrite");
		annoservice.write(vo);
		rttr.addFlashAttribute("annoWriteSuccess", true);
		return "redirect:/board/announce/annolistPageSearch?num=1";
	}
	
	@GetMapping(value = "/announce/announceView")
	public void announceViewGet(@RequestParam("annoNo") int annoNo, HttpSession session, Model model) throws Exception {
	    logger.info("get announceView");

	    annoBoardVO vo = annoservice.view(annoNo, session);
	    model.addAttribute("view", vo);
	}

	
	@GetMapping(value = "/announce/announceUpdate")
	public void announceUpdateGet(@RequestParam("annoNo") int annoNo, Model model, HttpSession session) throws Exception {
	    logger.info("get announceUpdate");

	    try {
	        annoBoardVO vo = annoservice.view(annoNo, session);
	        if (vo != null) {
	            model.addAttribute("view", vo);
	        } else {
	            // 조회된 게시물이 없을 경우 예외 처리 또는 다른 적절한 조치를 취할 수 있습니다.
	            // 여기에서는 간단하게 로그를 출력합니다.
	            logger.warn("조회된 게시물이 없습니다. annoNo: " + annoNo);
	        }
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 출력하고 다시 예외를 던질 수 있습니다.
	        logger.error("게시물 조회 중 오류가 발생했습니다.", e);
	        throw e;
	    }
	}

	@PostMapping(value = "/announce/announceUpdate")
	public String announceUpdatePost(annoBoardVO vo, RedirectAttributes rttr) throws Exception {
	    logger.info("post announceUpdate");
	    
	    try {
	        annoservice.modify(vo);
	        rttr.addFlashAttribute("annoUpdateSuccess", true);
	        return "redirect:/board/announce/announceView?annoNo=" + vo.getAnnoNo();
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 출력하고 다시 예외를 던질 수 있습니다.
	        logger.error("게시물 수정 중 오류가 발생했습니다.", e);
	        throw e;
	    }
	    
	}

	
	@GetMapping(value="/announce/announceDelete")
	public void announceDeleteGet(@RequestParam("annoNo") int annoNo, Model model)throws Exception{
		logger.info("get announceDelete");
		
		model.addAttribute("delete", annoNo);
	}
	
	@PostMapping(value="/announce/announceDelete")
	public String announceDeletePost(@RequestParam("annoNo") int annoNo, RedirectAttributes rttr)throws Exception{
		logger.info("post announceDelete");
		annoservice.delete(annoNo);
		rttr.addFlashAttribute("annoDeleteSuccess", true);
		return "redirect:/board/announce/annolistPageSearch?num=1";
	}
	
	//공지사항 게시물 페이징
		@GetMapping(value="/announce/annolistPageSearch")
		public void listPageSearchGet(Model model, @RequestParam("num") int num, 
				@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType, 
				@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception{
			logger.info("get annolistPageSearch");
			Page page = new Page();
			
			page.setNum(num);
			//page.setCount(annoservice.count());  
			page.setCount(annoservice.searchCount(searchType, keyword));
			
			// 검색 타입과 검색어
			//page.setSearchTypeKeyword(searchType, keyword);
			page.setSearchType(searchType);
			page.setKeyword(keyword);
			
			List<annoBoardVO> list = null; 
			//list = annoservice.listPage(page.getDisplayPost(), page.getPostNum());
			list = annoservice.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

			model.addAttribute("list", list);   
			model.addAttribute("page",page);
			model.addAttribute("select", num);
			
			//model.addAttribute("searchType", searchType);
			//model.addAttribute("keyword", keyword);
		}
	
	@GetMapping(value = "/event/mainEvent")
	public void mainEventGet() {
		logger.info("get mainEvent");
	}
	
}
