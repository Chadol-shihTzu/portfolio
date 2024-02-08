package com.portfolio.jdh.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.jdh.domain.MemberVO;
import com.portfolio.jdh.domain.annoBoardVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Inject
	private SqlSession sql;
	
	//Mapper
	private static String namespace = "member";
	
	//회원가입
	@Override
	public void join(MemberVO vo) throws Exception {
		sql.insert(namespace + ".join", vo);	
	}
	
	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return sql.selectOne(namespace + ".login", vo);
	}
	
	//회원정보 수정
	@Override
	public void modify(MemberVO vo) throws Exception {
		sql.insert(namespace + ".modify", vo);
		
	}
	
	//회원 탈퇴
	@Override
	public void withdrawal(MemberVO vo) throws Exception {
		sql.delete(namespace + ".withdrawal", vo);
		
	}
	
	//아이디 확인
	@Override
	public MemberVO idCheck(String userId) throws Exception {
		return sql.selectOne(namespace + ".idCheck", userId);	
	}
	
	//회원 삭제 admin
	@Override
	public void delete(MemberVO vo) throws Exception {
		sql.delete(namespace + ".delete", vo);
		
	}
	
	//회원목록 admin
	@Override
	public List<MemberVO> list() throws Exception {
		return sql.selectList(namespace + ".select_list");
	}
	
	//회원 조회 admin
	@Override
	public MemberVO view(String userId) throws Exception {
		return sql.selectOne(namespace+".view",userId);
	}
	//회원 수정 admin
	@Override
	public void adminmodify(MemberVO vo) throws Exception {
		sql.insert(namespace + ".adminmodify",vo);
	}	

	//★게시물 페이징
		//1. 게시물 총 갯수
		@Override
		public int count() throws Exception {
			return sql.selectOne(namespace + ".count");
		}
		
		//2. 게시물 목록 + 페이징
		@Override
		public List<MemberVO> listPage(int displayPost, int postNum) throws Exception {
			HashMap<String, Integer> data = new HashMap<String, Integer>();
			data.put("displayPost", displayPost);
			data.put("postNum", postNum);
			
			return sql.selectList(namespace + ".listPage", data);
		}

		@Override
		public List<MemberVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)throws Exception {
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

		

		

	

	

	

	

	
}
