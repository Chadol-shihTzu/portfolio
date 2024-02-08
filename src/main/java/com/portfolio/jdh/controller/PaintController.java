package com.portfolio.jdh.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.portfolio.jdh.domain.Page;
import com.portfolio.jdh.domain.paintBoardVO;
import com.portfolio.jdh.domain.paintReplyVO;
import com.portfolio.jdh.service.paintReplyService;
import com.portfolio.jdh.service.paintBoardService;
import com.portfolio.jdh.utils.UploadFileUtils;

@Controller
@RequestMapping("/board/paint")
public class PaintController {
	
	@Inject
	paintBoardService paintservice;
	
	@Inject
	paintReplyService paintreplyservice;
	
	@Resource(name = "uploadPath")	//업로드 패스 설정
	private String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(PaintController.class);
	
	//사진 게시판 글 작성
	@GetMapping(value = "/paintWrite")
	public void paintWriteGet(HttpSession session, Model model) {
		logger.info("get paintWrite");
		
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg", "login_error");
		}
	}

	@PostMapping(value = "/paintWrite")
	public String paintWritePost(paintBoardVO vo, RedirectAttributes rttr, MultipartFile file, HttpServletRequest req, HttpServletResponse res) throws Exception {
	    logger.info("post paintWrite");
	    String imgUploadPath = uploadPath + File.separator + "imgUpload";  // 경로, 이미지를 업로드할 폴더 설정
	    String ymdPath = UploadFileUtils.calcPath(imgUploadPath);  // 크기, 위의 폴더를 기준으로 연월일 폴더생성
	    String fileName = null;  // 파일명이 존재한다면 올릴 필요가 없다. (파일이 있다는 뜻, 즉 파일명이 없어야 파일을 올릴 수 있다)
	    
	    if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") { //첨부를 하지 않을 경우 오류가 남.그래서 originalfilename 코드를 넣어준다. 
			/*if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {*/
			//파일 input에 첨부된 파일이 없다면 && 첨부된 파일에 이름이 없다면
		   fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);   
		   vo.setpaintImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);	//gdmImg 원본파일경로 + 파일명 저장
		   vo.setpaintThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);	//gdsThumbImg 썸네일 파일 경로 + 썸네일 파일명저장
		} else {	//첨부된 파일이 없으면
		   fileName = uploadPath + File.separator + "images" + File.separator + "none.png";	//미리 준비된 none.png파일 대신 출력.
		   vo.setpaintImg(fileName);
		   vo.setpaintThumbImg(fileName);
		   /* 상품 등록중에 파일이 등록할 때와 등록되지 않을 대의 법칙을 구현 */
		   /*vo.setGdsImg(fileName);
		   vo.setGdsThumbImg(fileName);*/
		}
	    
		//gdsThumbImg에 썸네일파일경로 + 파일명 저장
		paintservice.write(vo);
		rttr.addFlashAttribute("paintWriteSuccess", true);
		return "redirect:/board/paint/paintlistPageSearch?num=1";
	}

		@PostMapping(value="/ckUpload")
		public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload) throws Exception {
		// 랜덤 문자 생성
		 UUID uid = UUID.randomUUID();
		 
		 OutputStream out = null;
		 PrintWriter printWriter = null;
		   
		 // 인코딩
		 res.setCharacterEncoding("utf-8");
		 res.setContentType("text/html;charset=utf-8");
		 
		 try {
		  
		  String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
		  byte[] bytes = upload.getBytes();
		  
		  // 업로드 경로
		  String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
		  
		  out = new FileOutputStream(new File(ckUploadPath));
		  out.write(bytes);
		  out.flush();  // out에 저장된 데이터를 전송하고 초기화
		  
		  String callback = req.getParameter("CKEditorFuncNum");
		  printWriter = res.getWriter();
		  String fileUrl = "/resources/ckUpload/" + uid + "_" + fileName;  // 작성화면
		  
		  printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
		  
		  printWriter.flush();
		  

		 } catch (IOException e) { 
			 e.printStackTrace();
		 } finally {
		  try {
		   if(out != null) { out.close(); }
		   if(printWriter != null) { printWriter.close(); }
		  } catch(IOException e) { e.printStackTrace(); }
		 }
		 
		 return ; 
		}
	
	//글 상세조회 + 댓글 리스트 조회
	@GetMapping(value = "/paintView")
	public void paintViewGet(@RequestParam("paintNo") int paintNo,HttpSession session, Model model)throws Exception {
		logger.info("get paintView");
		paintBoardVO vo = paintservice.view(paintNo, session);
		//댓글목록조회
		List<paintReplyVO> reply = null;
		reply = paintreplyservice.list(paintNo);
		model.addAttribute("reply", reply);
		model.addAttribute("view", vo);
	}
	
	@GetMapping(value = "/paintUpdate")
	public void paintUpdateGet(@RequestParam("paintNo") int paintNo, Model model, HttpSession session) throws Exception {
	    logger.info("get paintUpdate");
	    try {
	        paintBoardVO vo = paintservice.view(paintNo, session);
	        if (vo != null) {
	            model.addAttribute("view", vo);
	        } else {
	            // 조회된 게시물이 없을 경우 예외 처리 또는 다른 적절한 조치를 취할 수 있습니다.
	            // 여기에서는 간단하게 로그를 출력합니다.
	            logger.warn("조회된 게시물이 없습니다. paintNo: " + paintNo);
	        }
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 출력하고 다시 예외를 던질 수 있습니다.
	        logger.error("게시물 조회 중 오류가 발생했습니다.", e);
	        throw e;
	    }
	}

	@PostMapping(value = "/paintUpdate")
	public String paintUpdatePost(paintBoardVO vo, MultipartFile file, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
	    logger.info("post paintUpate");
	    try {
	    	// 새로운 파일이 등록되었는지 확인
	    	 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
	    	  // 기존 파일을 삭제
	    	  new File(uploadPath + req.getParameter("paintImg")).delete();
	    	  new File(uploadPath + req.getParameter("paintThumbImg")).delete();
	    	  
	    	  // 새로 첨부한 파일을 등록
	    	  String imgUploadPath = uploadPath + File.separator + "imgUpload";
	    	  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
	    	  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
	    	  
	    	  vo.setpaintImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
	    	  vo.setpaintThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	    	  
	    	 } else {  // 새로운 파일이 등록되지 않았다면
	    	  // 기존 이미지를 그대로 사용
	    	  vo.setpaintImg(req.getParameter("paintImg"));
	    	  vo.setpaintThumbImg(req.getParameter("paintThumbImg"));
	    	  
	    	 }
	        paintservice.modify(vo);
	        rttr.addFlashAttribute("paintUpdateSuccess", true);
	        return "redirect:/board/paint/paintView?paintNo=" + vo.getpaintNo();
	    } catch (Exception e) {
	        // 예외가 발생한 경우 로그를 출력하고 다시 예외를 던질 수 있습니다.
	        logger.error("게시물 수정 중 오류가 발생했습니다.", e);      
	        throw e;
	        
	    }
	}
	
	@GetMapping(value="/paintDelete")
	public void paintDeleteGet(@RequestParam("paintNo") int paintNo, Model model)throws Exception{
		logger.info("get paintDelete");
		
		model.addAttribute("delete", paintNo);
	}
	
	@PostMapping(value="/paintDelete")
	public String paintDeletePost(@RequestParam("paintNo") int paintNo, RedirectAttributes rttr)throws Exception{
		logger.info("post paintDelete");
		paintservice.delete(paintNo);
		rttr.addFlashAttribute("paintDeleteSuccess", true);
		return "redirect:/board/paint/paintlistPageSearch?num=1";
	}
	
	//공지사항 게시물 페이징
	@GetMapping(value="/paintlistPageSearch")
	public void paintlistPageSearchGet(Model model, @RequestParam("num") int num, 
			@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType, 
			@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) throws Exception{
		logger.info("get paintlistPageSearch");
		Page page = new Page();
		page.setNum(num);
		//page.setCount(annoservice.count());  
		page.setCount2(paintservice.searchCount(searchType, keyword));
		
		// 검색 타입과 검색어
		//page.setSearchTypeKeyword(searchType, keyword);
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		List<paintBoardVO> list = paintservice.list();
		//list = annoservice.listPage(page.getDisplayPost(), page.getPostNum());
		list = paintservice.listPageSearch(page.getDisplayPost(), page.getPostNum2(), searchType, keyword);

		model.addAttribute("list", list);   
		model.addAttribute("page",page);
		model.addAttribute("select", num);
		
	}
}
