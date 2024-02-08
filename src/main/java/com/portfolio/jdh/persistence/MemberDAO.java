package com.portfolio.jdh.persistence;

import java.util.List;

import com.portfolio.jdh.domain.MemberVO;
import com.portfolio.jdh.domain.annoBoardVO;

public interface MemberDAO {
	
	//회원가입
	public void join(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO login(MemberVO vo)throws Exception;
	
	//회원정보 수정
	public void modify(MemberVO vo) throws Exception;

	//회원 탈퇴
	public void withdrawal(MemberVO vo)throws Exception;
	
	//아이디 확인
	public MemberVO idCheck(String userId)throws Exception;
	
	//회원 삭제 admin
	public void delete(MemberVO vo)throws Exception;
	
	//회원리스트 admin
	public List<MemberVO> list() throws Exception;
	
	//회원 조회 admin
	public MemberVO view(String userId) throws Exception;
	
	//회원정보 수정 admin
	public void adminmodify(MemberVO vo) throws Exception;
	
	//★게시물 페이징
	//1. 게시물 총 갯수
	public int count() throws Exception;
	
	//2. 게시물 목록 + 페이징
	public List<MemberVO> listPage(int displayPost, int postNum) throws Exception;
	
	//3. 게시물 목록 + 페이징 + 검색
	public List<MemberVO> listPageSearch(
	int displayPost, int postNum, String searchType, String keyword) throws Exception;
	 
	// 게시물 총 갯수 + 검색 적용
	public int searchCount(String searchType, String keyword) throws Exception;
}
