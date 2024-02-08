package com.portfolio.jdh.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.jdh.domain.recommendBoardVO;

@Repository
public class recommendBoardDAOImpl implements recommendBoardDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "recommendboard";
	
	//게시물 작성
	@Override
	public void write(recommendBoardVO vo) throws Exception {
		sql.insert("recommendboard.write", vo);
	}
	//게시물 리스트
	@Override
	public List<recommendBoardVO> list() throws Exception {
		return sql.selectList(namespace + ".list");
	}
	
	
	//게시물 조회
	@Override
	public recommendBoardVO view(int recommendNo) throws Exception {
		return sql.selectOne(namespace+".view", recommendNo);
	}
	
	//게시물 수정
	@Override
	public void modify(recommendBoardVO vo) throws Exception {
		sql.update(namespace + ".modify", vo);
		
	}
	
	//게시물 삭제
	@Override
	public void delete(int recommendNo) throws Exception {
		sql.delete(namespace + ".delete", recommendNo);
		
	}
	
	//★게시물 페이징
	//1. 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return sql.selectOne(namespace + ".count");
	}
	
	//2. 게시물 목록 + 페이징
	@Override
	public List<recommendBoardVO> listPage(int displayPost, int postNum) throws Exception {
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".listPage", data);
	}

	@Override
	public List<recommendBoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();
		  
		  data.put("displayPost", displayPost);
		  data.put("postNum", postNum);
		  
		  data.put("searchType", searchType);
		  data.put("keyword", keyword);
		  
		  return sql.selectList(namespace + ".listPageSearch", data);
		 }

	// 게시물 총 갯수 + 검색 적용
	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
	 
	 HashMap<String, Object> data = new HashMap<String, Object>();
	 
	 data.put("searchType", searchType);
	 data.put("keyword", keyword);
	 
	 return sql.selectOne(namespace + ".searchCount", data); 
	}
	
	//게시판 조회수
	@Override
	public void boardHit(int recommendNo) throws Exception {
		sql.update(namespace + ".boardHit", recommendNo);
		
	}
}