package com.portfolio.jdh.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.portfolio.jdh.domain.MemberVO;
import com.portfolio.jdh.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private final BCryptPasswordEncoder passEncoder;

    @Autowired
    public MemberController(BCryptPasswordEncoder passEncoder) {
        this.passEncoder = passEncoder;
    }
	
	@Inject//Autowired와 마찬가지로 일치하는 객체를 자동으로 주입
	MemberService service;
	
	

    
    @GetMapping(value = "/join")
	public void join() {
		logger.info("회원가입페이지 진입");
	}
	
	@PostMapping(value = "/join")
	public String joinPost(MemberVO vo, RedirectAttributes rttr)throws Exception{
		logger.info("회원가입 진행");
	
		
      String inputPass = vo.getUserPassword();//원번
      String pass = passEncoder.encode(inputPass);
      vo.setUserPassword(pass);
      
      String inputPass2 = vo.getUserRePassword();//다시쓰기
      String pass2 = passEncoder.encode(inputPass2);
      vo.setUserRePassword(pass2);
    
      service.join(vo);
      rttr.addFlashAttribute("joinSuccess", true);
      return "redirect:/";
	}
    
	
	@GetMapping(value = "/login")
	public void login() {
		logger.info("로그인페이지 진입");
	}
	
	// 로그인
	@PostMapping("/login")
	public String login(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		logger.info("로그인 완료");
	    // 로그인 시에도 암호화하지 않은 비밀번호로 비교
	    MemberVO login = service.login(vo);
	    
	    if (login != null && passEncoder.matches(vo.getUserPassword(), login.getUserPassword())) {
	        // 로그인 성공
	        session.setAttribute("member", login);
	        
	        rttr.addFlashAttribute("loginSuccess", true);
	        return "redirect:/";
	    } else {
	        // 로그인 실패
	        session.setAttribute("member", null);
	        rttr.addFlashAttribute("msg", false);
	        return "redirect:/member/login";
	    }
	}
	   
	
		/*
		if(login == null) {
			session.setAttribute("member",null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("member", login);
		}
		return "redirect:/";
	} */
	
	@GetMapping(value="/logout")
	public String logout(HttpSession session, RedirectAttributes rttr)throws Exception{
		logger.info("로그아웃");
		service.logout(session);
		rttr.addFlashAttribute("logoutSuccess", true);
		
		
		return "redirect:/";
	}
	
	//회원정보 수정
	@GetMapping(value="/modify")
	public void modify() throws Exception {
	    logger.info("get modify");
	    
	}

	@PostMapping(value="/modify")
	public String postModify(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {
	    logger.info("post modify");
	    
	    // 세션에서 userId를 가져오기
	    String userId = ((MemberVO) session.getAttribute("member")).getUserId();
	    
	    // vo에 userId를 설정
	    vo.setUserId(userId);
	    session.invalidate();
	    
	    String inputPass = vo.getUserPassword();//원번
	    String pass = passEncoder.encode(inputPass);
	    vo.setUserPassword(pass);
	      
	    String inputPass2 = vo.getUserRePassword();//다시쓰기
	    String pass2 = passEncoder.encode(inputPass2);
	    vo.setUserRePassword(pass2);
	    // 회원 정보 수정
	    service.modify(vo);
	   
	    
	    return "redirect:/";
	}
	
	@GetMapping(value="/withdrawal")
	public void withdrawal() throws Exception{
		logger.info("get withdrawal");
	}
	
	// 회원 탈퇴 post
	@PostMapping(value = "/withdrawal")
	public String postWithdrawal(HttpSession session, MemberVO vo, RedirectAttributes rttr) throws Exception {
	    logger.info("post withdrawal");

	    MemberVO member = (MemberVO) session.getAttribute("member");

	    // 입력한 비밀번호와 세션에 저장된 회원의 암호화된 비밀번호를 비교
	    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	    if (!passwordEncoder.matches(vo.getUserPassword(), member.getUserPassword())) {
	        rttr.addFlashAttribute("msg", false);
	        return "redirect:/member/withdrawal";
	    }

	    service.withdrawal(vo);
	    session.invalidate();
	    rttr.addFlashAttribute("withdrawalSuccess", true);
	    return "redirect:/";
	}
	
	// 회원 확인
	@ResponseBody
	@PostMapping(value = "/idCheck")
	public int postIdCheck(@RequestParam String userId) throws Exception {
	    logger.info("post idCheck");
	    
	    MemberVO idCheck = service.idCheck(userId);
	    
	    int result = 0;
	    
	    if (idCheck != null) {
	        result = 1;
	    }   
	    
	    return result;
	}

	
	
	@GetMapping(value = "/joinAgree")
	public void joinAgree() {
		logger.info("개인정보동의페이지 진입");
	}
	
	@GetMapping(value = "/findId")
	public void findId() {
		logger.info("아이디찾기페이지 진입");
	}
	
	@GetMapping(value = "/findPassword")
	public void findPassword() {
		logger.info("비밀번호찾기페이지 진입");
	}
	
	//mypage get + 등급 이모티콘 가져오기
	@GetMapping(value = "/mypage")
	public void mypage(Model model) {
		//이모티콘가져오기
		model.addAttribute("emoticons", List.of("🌱", "🌟", "🚀", "📝","🏆","🎖️","📜","🎨","🏛️","🌟","🌐","🌌" ));
	}

	
}
