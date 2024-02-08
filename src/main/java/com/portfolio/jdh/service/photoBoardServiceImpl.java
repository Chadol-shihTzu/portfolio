package com.portfolio.jdh.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.portfolio.jdh.domain.photoBoardVO;
import com.portfolio.jdh.persistence.photoBoardDAO;

@Service
public class photoBoardServiceImpl implements photoBoardService{
	
	@Inject
	private photoBoardDAO dao;
	
	//게시물 작성
	@Override
	public void write(photoBoardVO vo) throws Exception {
		dao.write(vo);
	}
	//게시물 리스트
	@Override
	public List<photoBoardVO> list() throws Exception {
		return dao.list();
	}
	
	//게시물 조회 + 조회수 증가
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public photoBoardVO view(int photoNo, HttpSession session) throws Exception {
		// 세션에서 조회한 게시물 번호 목록을 가져옵니다.
	    Set<Integer> viewedPostNumbers = (Set<Integer>) session.getAttribute("viewedPostNumbers");

	    // 만약 세션에 해당 속성이 없다면 초기화합니다.
	    if (viewedPostNumbers == null) {
	        viewedPostNumbers = new HashSet<>();
	    }

	    // 현재 조회하려는 게시물 번호가 이미 조회한 목록에 없으면 조회수 증가 및 세션에 추가합니다.
	    if (!viewedPostNumbers.contains(photoNo)) {
	        dao.boardHit(photoNo); // 조회수 증가
	        viewedPostNumbers.add(photoNo); // 세션에 추가
	    }

	    // 세션을 갱신합니다.
	    session.setAttribute("viewedPostNumbers", viewedPostNumbers);
		return dao.view(photoNo);
	}
	
	//게시물 수정
	@Override
	public void modify(photoBoardVO vo) throws Exception {
		dao.modify(vo);
		
	}
	
	//게시물 삭제
	@Override
	public void delete(int photoNo) throws Exception {
		dao.delete(photoNo);
		
	}
	
	//★ 게시물 페이징
	// 1. 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return dao.count();
	}
	
	// 2. 게시물 목록 + 페이징
	@Override
	public List<photoBoardVO> listPage(int displayPost, int postNum) throws Exception {
		return dao.listPage(displayPost, postNum);
	}

	@Override
	public List<photoBoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)throws Exception {
		return  dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}

	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		return dao.searchCount(searchType, keyword);
	}
}
