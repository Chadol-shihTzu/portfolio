package com.portfolio.jdh.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.portfolio.jdh.domain.annoBoardVO;
import com.portfolio.jdh.service.annoBoardService;

@Controller
public class HomeController {
	@Inject
	annoBoardService annoservice;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@GetMapping(value = "/")
	public String home(Model model) throws Exception{
		logger.info("get home");
		List<annoBoardVO> list = null;
		list = annoservice.list();
		
		model.addAttribute("list",list);
		return "home";
	}
	
	@GetMapping(value = "/board/about")
	public void aboutGet() {
		logger.info("get about");
	}
	
	
}
