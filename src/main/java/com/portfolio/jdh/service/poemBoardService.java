package com.portfolio.jdh.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.portfolio.jdh.domain.poemBoardVO;

public interface poemBoardService {
	
	//게시물 리스트
	public List<poemBoardVO> list() throws Exception;
	
	//게시물 작성
	public void write(poemBoardVO vo) throws Exception;
	
	//게시물 조회 + 조회수 증가
	public poemBoardVO view(int poemNo, HttpSession session)throws Exception;
	
	//게시물 수정
	public void modify(poemBoardVO vo)throws Exception;
	
	//게시물 삭제
	public void delete(int poemNo)throws Exception;
	
	//★게시물 페이징
	//1. 게시물 총 갯수
	public int count() throws Exception;
	
	//2. 게시물 목록 + 페이징
	public List<poemBoardVO> listPage(int displayPost, int postNum)throws Exception;
	
	// 게시물 목록 + 페이징 + 검색
	public List<poemBoardVO> listPageSearch(
	  int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	// 게시물 총 갯수 + 검색 적용
	public int searchCount(String searchType, String keyword) throws Exception;
	
}