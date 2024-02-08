package com.portfolio.jdh.persistence;

import java.util.List;

import com.portfolio.jdh.domain.photoBoardVO;

public interface photoBoardDAO {
	
	//게시물 작성
	public void write(photoBoardVO vo)throws Exception;
	//게시물 리스트
	public List<photoBoardVO> list() throws Exception;
	
	//게시물 조회
	public photoBoardVO view(int photoNo) throws Exception;
	
	//게시물 수정
	public void modify(photoBoardVO vo)throws Exception;
	
	//게시물 삭제
	public void delete(int photoNo)throws Exception;
	
	//★게시물 페이징
	//1. 게시물 총 갯수
	public int count() throws Exception;
	
	//2. 게시물 목록 + 페이징
	public List<photoBoardVO> listPage(int displayPost, int postNum) throws Exception;
	
	//3. 게시물 목록 + 페이징 + 검색
	 public List<photoBoardVO> listPageSearch(
	   int displayPost, int postNum, String searchType, String keyword) throws Exception;
	 
	 // 게시물 총 갯수 + 검색 적용
	 public int searchCount(String searchType, String keyword) throws Exception;
	 
	 // 게시판 조회수
	 public void boardHit(int photoNo)throws Exception;
}
