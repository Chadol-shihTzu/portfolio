package com.portfolio.jdh.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.portfolio.jdh.service.annoBoardService;

@Controller
@RequestMapping("/board/club")
public class ClubController {
	
	@Inject
	annoBoardService annoservice;
	
	private static final Logger logger = LoggerFactory.getLogger(ClubController.class);
	
	@GetMapping(value = "/clubCreate")
	public void clubCreateGet() {
		logger.info("get clubCreate");
	}
	
	@GetMapping(value = "/myClub")
	public void myClubGet() {
		logger.info("get myClub");
	}
	
	@GetMapping(value = "/popularClub")
	public void popularClubGet() {
		logger.info("get popularClub");
	}
	
	@GetMapping(value = "/categoryClub")
	public void categoryClubGet() {
		logger.info("get categoryClub");
	}
	
	
}
