package com.portfolio.jdh.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.portfolio.jdh.domain.MemberVO;
import com.portfolio.jdh.domain.Page;
import com.portfolio.jdh.service.MemberService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	
	private final BCryptPasswordEncoder passEncoder;

    @Autowired
    public AdminController(BCryptPasswordEncoder passEncoder) {
        this.passEncoder = passEncoder;
    }
    
    
	@Inject//Autowired와 마찬가지로 일치하는 객체를 자동으로 주입
	MemberService service;
	
	//회원 목록 admin
	@GetMapping(value="/adminmenu")
	public void adminMenuGet(Model model, 
			@RequestParam(value = "num") int num, 
			@RequestParam(value = "searchType",required = false, defaultValue = "id") String searchType, 
			@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception{
		logger.info("get adminMenu");
		Page page = new Page();
		
		page.setNum(num);
		//page.setCount(annoservice.count());  
		page.setCount(service.searchCount(searchType, keyword));
		
		// 검색 타입과 검색어
		//page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		List<MemberVO> list = null;
		list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("select", num);
	}
	
	//회원 정보 수정 admin
	@GetMapping(value="/adminmodify")
	public void adminModifyGet(@RequestParam("userId") String userId, Model model)throws Exception{
		logger.info("get adminModify");
		MemberVO vo = service.view(userId);
	    model.addAttribute("view", vo);
	}
	@PostMapping(value = "/adminmodify")
	public String adminmodifyPost(MemberVO vo, RedirectAttributes rttr, Model model) throws Exception {
	    logger.info("post adminmodify");
	    try {
	    	String inputPass = vo.getUserPassword();//원번
		    String pass = passEncoder.encode(inputPass);
		    vo.setUserPassword(pass);
		      
		    String inputPass2 = vo.getUserRePassword();//다시쓰기
		    String pass2 = passEncoder.encode(inputPass2);
		    vo.setUserRePassword(pass2);
		    
	        service.adminmodify(vo);
	        rttr.addFlashAttribute("adminmodifySuccess", true);
	        return "redirect:/admin/adminmenu?num=1";
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 출력하고 다시 예외를 던질 수 있습니다.
	        logger.error("회원 수정 중 오류가 발생했습니다.", e);
	        throw e;
	    }
	    
	}
	
	//회원 삭제 admin
	@GetMapping(value="/admindelete")
	public void adminDeleteGet(@RequestParam("userId") String userId, Model model)throws Exception{
		logger.info("get adminDelete");
		MemberVO vo = service.view(userId);
	    model.addAttribute("view", vo);
	}
	
	@PostMapping(value = "/admindelete")
	public String adminDeletePost(MemberVO vo, RedirectAttributes rttr) throws Exception {
	 logger.info("post adminDelete");
	 
	 service.delete(vo);

	 rttr.addFlashAttribute("admindeleteSuccess", true);
	 return "redirect:/admin/adminmenu?num=1";
	}
}
