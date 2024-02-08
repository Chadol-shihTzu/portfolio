package com.portfolio.jdh.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.portfolio.jdh.domain.MemberVO;
import com.portfolio.jdh.domain.annoBoardVO;
import com.portfolio.jdh.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO dao;
	
	//회원가입
	@Override
	public void join(MemberVO vo) throws Exception {
		dao.join(vo);
	}

	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}
	
	//로그아웃
	@Override
	public void logout(HttpSession session) throws Exception {
		session.invalidate();
		
	}
	
	//회원정보 수정
	@Override
	public void modify(MemberVO vo) throws Exception {
		dao.modify(vo);
	}
	
	//회원 탈퇴
	@Override
	public void withdrawal(MemberVO vo) throws Exception {
		dao.withdrawal(vo);
		
	}
	
	//아이디 확인
	@Override
	public MemberVO idCheck(String userId) throws Exception {
		return dao.idCheck(userId);
	}
	
	//회원 삭제 admin
	@Override
	public void delete(MemberVO vo) throws Exception {
		dao.delete(vo);
	}
	
	//회원 목록 조회 admin
	@Override
	public List<MemberVO> list() throws Exception {
		return dao.list();
	}
	
	//회원 조회 admin
	@Override
	public MemberVO view(String userId) throws Exception {
		return dao.view(userId);
	}
	//회원 수정 admin
	@Override
	public void adminmodify(MemberVO vo) throws Exception {
		dao.adminmodify(vo);
		
	}
	//★ 게시물 페이징
	// 1. 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return dao.count();
	}
	
	// 2. 게시물 목록 + 페이징
	@Override
	public List<MemberVO> listPage(int displayPost, int postNum) throws Exception {
		return dao.listPage(displayPost, postNum);
	}

	@Override
	public List<MemberVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)throws Exception {
		return  dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}

	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		return dao.searchCount(searchType, keyword);
	}

	
	

	

	
	
}
