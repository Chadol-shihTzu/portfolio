package com.portfolio.jdh.persistence;

import java.util.List;

import com.portfolio.jdh.domain.hotdealBoardVO;

public interface hotdealBoardDAO {
	
	//게시물 작성
	public void write(hotdealBoardVO vo)throws Exception;
	//게시물 리스트
	public List<hotdealBoardVO> list() throws Exception;
	
	//게시물 조회
	public hotdealBoardVO view(int hotNo) throws Exception;
	
	//게시물 수정
	public void modify(hotdealBoardVO vo)throws Exception;
	
	//게시물 삭제
	public void delete(int hotNo)throws Exception;
	
	//★게시물 페이징
	//1. 게시물 총 갯수
	public int count() throws Exception;
	
	//2. 게시물 목록 + 페이징
	public List<hotdealBoardVO> listPage(int displayPost, int postNum) throws Exception;
	
	//3. 게시물 목록 + 페이징 + 검색
	 public List<hotdealBoardVO> listPageSearch(
	   int displayPost, int postNum, String searchType, String keyword) throws Exception;
	 
	 // 게시물 총 갯수 + 검색 적용
	 public int searchCount(String searchType, String keyword) throws Exception;
	 
	 // 게시판 조회수
	 public void boardHit(int hotNo)throws Exception;

}
