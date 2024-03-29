package com.portfolio.jdh.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.jdh.domain.criticBoardVO;

@Repository
public class criticBoardDAOImpl implements criticBoardDAO{
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "criticboard";
	
	//게시물 리스트
	@Override
	public List<criticBoardVO> list() throws Exception {
		return sql.selectList(namespace + ".list");
	}
	
	//게시물 작성
	@Override
	public void write(criticBoardVO vo) throws Exception {
		sql.insert(namespace + ".write", vo);
	}
	
	//게시물 조회
	@Override
	public criticBoardVO view(int criticNo) throws Exception {
		return sql.selectOne(namespace+".view", criticNo);
	}
	
	//게시물 수정
	@Override
	public void modify(criticBoardVO vo) throws Exception {
		sql.update(namespace + ".modify", vo);
		
	}
	
	//게시물 삭제
	@Override
	public void delete(int criticNo) throws Exception {
		sql.delete(namespace + ".delete", criticNo);
		
	}
	
	//★게시물 페이징
	//1. 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return sql.selectOne(namespace + ".count");
	}
	
	//2. 게시물 목록 + 페이징
	@Override
	public List<criticBoardVO> listPage(int displayPost, int postNum) throws Exception {
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".listPage", data);
	}

	@Override
	public List<criticBoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)throws Exception {
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
	public void boardHit(int criticNo) throws Exception {
		sql.update(namespace + ".boardHit", criticNo);
		
	}

	
}
