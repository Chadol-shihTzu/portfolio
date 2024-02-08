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
import com.portfolio.jdh.domain.qnaBoardVO;
import com.portfolio.jdh.domain.qnaReplyVO;
import com.portfolio.jdh.service.qnaBoardService;
import com.portfolio.jdh.service.qnaReplyService;

@Controller
@RequestMapping("/board/qna")
public class QnaController {
	
	@Inject
	qnaBoardService qnaservice;
	
	@Inject
	qnaReplyService qnareplyservice;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@GetMapping(value = "/qnaList")
	public void qnaListGet(Model model) throws Exception {
		logger.info("get qnaList");
		
		List<qnaBoardVO> list = null;
		list = qnaservice.list();
		
		model.addAttribute("list",list);
	}
	
	@GetMapping(value = "/qnaWrite")
	public void qnaWriteGet(HttpSession session, Model model) {
		logger.info("get qnaWrite");
		
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg", "login_error");
		}
	}
	
	@PostMapping(value = "/qnaWrite")
	public String qnaWritePost(qnaBoardVO vo, RedirectAttributes rttr)throws Exception {
		logger.info("post qnaWrite");
		qnaservice.write(vo);
		rttr.addFlashAttribute("qnaWriteSuccess", true);
		return "redirect:/board/qna/qnalistPageSearch?num=1";
	}
	
	//글 상세 조회 + 댓글 목록 조회
	@GetMapping(value = "/qnaView")
	public void qnaViewGet(@RequestParam("qnaNo") int qnaNo, HttpSession session, Model model) throws Exception {
	    logger.info("get qnaView");

	    qnaBoardVO vo = qnaservice.view(qnaNo, session);
	  //댓글목록조회
  		List<qnaReplyVO> reply = null;
  		reply = qnareplyservice.list(qnaNo);
  		model.addAttribute("reply", reply);
	    model.addAttribute("view", vo);
	}

	
	@GetMapping(value = "/qnaUpdate")
	public void qnaUpdateGet(@RequestParam("qnaNo") int qnaNo, Model model, HttpSession session) throws Exception {
	    logger.info("get qnaUpdate");

	    try {
	        qnaBoardVO vo = qnaservice.view(qnaNo, session);
	        if (vo != null) {
	            model.addAttribute("view", vo);
	        } else {
	            // 조회된 게시물이 없을 경우 예외 처리 또는 다른 적절한 조치를 취할 수 있습니다.
	            // 여기에서는 간단하게 로그를 출력합니다.
	            logger.warn("조회된 게시물이 없습니다. qnaNo: " + qnaNo);
	        }
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 출력하고 다시 예외를 던질 수 있습니다.
	        logger.error("게시물 조회 중 오류가 발생했습니다.", e);
	        throw e;
	    }
	}

	@PostMapping(value = "/qnaUpdate")
	public String qnaUpdatePost(qnaBoardVO vo, RedirectAttributes rttr) throws Exception {
	    logger.info("post qnaUpdate");
	    
	    try {
	        qnaservice.modify(vo);
	        rttr.addFlashAttribute("qnaUpdateSuccess", true);
	        return "redirect:/board/qna/qnaView?qnaNo=" + vo.getqnaNo();
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 출력하고 다시 예외를 던질 수 있습니다.
	        logger.error("게시물 수정 중 오류가 발생했습니다.", e);
	        throw e;
	    }
	    
	}

	
	@GetMapping(value="/qnaDelete")
	public void qnaDeleteGet(@RequestParam("qnaNo") int qnaNo, Model model)throws Exception{
		logger.info("get qnaDelete");
		
		model.addAttribute("delete", qnaNo);
	}
	
	@PostMapping(value="/qnaDelete")
	public String qnaDeletePost(@RequestParam("qnaNo") int qnaNo, RedirectAttributes rttr)throws Exception{
		logger.info("post qnaDelete");
		qnaservice.delete(qnaNo);
		rttr.addFlashAttribute("qnaDeleteSuccess", true);
		return "redirect:/board/qna/qnalistPageSearch?num=1";
	}
	
	//공지사항 게시물 페이징
		@GetMapping(value="/qnalistPageSearch")
		public void listPageSearchGet(Model model, @RequestParam("num") int num, 
				@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType, 
				@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception{
			logger.info("get qnalistPageSearch");
			Page page = new Page();
			
			page.setNum(num);
			//page.setCount(qnaservice.count());  
			page.setCount(qnaservice.searchCount(searchType, keyword));
			
			// 검색 타입과 검색어
			//page.setSearchTypeKeyword(searchType, keyword);
			page.setSearchType(searchType);
			page.setKeyword(keyword);
			
			List<qnaBoardVO> list = null; 
			//list = qnaservice.listPage(page.getDisplayPost(), page.getPostNum());
			list = qnaservice.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

			model.addAttribute("list", list);   
			model.addAttribute("page",page);
			model.addAttribute("select", num);
			
			//model.addAttribute("searchType", searchType);
			//model.addAttribute("keyword", keyword);
		}
	
	
}
