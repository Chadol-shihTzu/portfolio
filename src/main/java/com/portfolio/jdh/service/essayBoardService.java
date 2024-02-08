package com.portfolio.jdh.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.portfolio.jdh.domain.essayBoardVO;

public interface essayBoardService {
	
	//게시물 리스트
	public List<essayBoardVO> list() throws Exception;
	
	//게시물 작성
	public void write(essayBoardVO vo) throws Exception;
	
	//게시물 조회 + 조회수 증가
	public essayBoardVO view(int essayNo, HttpSession session)throws Exception;
	
	//게시물 수정
	public void modify(essayBoardVO vo)throws Exception;
	
	//게시물 삭제
	public void delete(int essayNo)throws Exception;
	
	//★게시물 페이징
	//1. 게시물 총 갯수
	public int count() throws Exception;
	
	//2. 게시물 목록 + 페이징
	public List<essayBoardVO> listPage(int displayPost, int postNum)throws Exception;
	
	// 게시물 목록 + 페이징 + 검색
	public List<essayBoardVO> listPageSearch(
	  int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	// 게시물 총 갯수 + 검색 적용
	public int searchCount(String searchType, String keyword) throws Exception;
	
}
