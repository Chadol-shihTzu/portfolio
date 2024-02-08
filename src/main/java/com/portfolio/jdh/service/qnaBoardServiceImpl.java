package com.portfolio.jdh.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.portfolio.jdh.domain.qnaBoardVO;
import com.portfolio.jdh.persistence.qnaBoardDAO;

@Service
public class qnaBoardServiceImpl implements qnaBoardService{
	
	@Inject
	private qnaBoardDAO dao;
	
	//게시물 리스트
	@Override
	public List<qnaBoardVO> list() throws Exception {
		return dao.list();
	}

	//게시물 작성
	@Override
	public void write(qnaBoardVO vo) throws Exception {
		dao.write(vo);
	}
	//게시물 조회 + 조회수 증가
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public qnaBoardVO view(int qnaNo, HttpSession session) throws Exception {
	    try {
	        // dao 객체가 null이면 Null 오류를 방지하기 위해 예외 처리
	        if (dao != null) {
	            // 세션에서 조회한 게시물 번호 목록을 가져옵니다.
	            Set<Integer> viewedPostNumbers = (Set<Integer>) session.getAttribute("viewedPostNumbers");

	            // 만약 세션에 해당 속성이 없다면 초기화합니다.
	            if (viewedPostNumbers == null) {
	                viewedPostNumbers = new HashSet<>();
	            }

	            // 현재 조회하려는 게시물 번호가 이미 조회한 목록에 없으면 조회수 증가 및 세션에 추가합니다.
	            if (!viewedPostNumbers.contains(qnaNo)) {
	                dao.boardHit(qnaNo); // 조회수 증가
	                viewedPostNumbers.add(qnaNo); // 세션에 추가
	            }

	            // 세션을 갱신합니다.
	            session.setAttribute("viewedPostNumbers", viewedPostNumbers);

	            // dao.view 메서드 호출 결과가 null인 경우에 대한 처리를 추가합니다.
	            qnaBoardVO result = dao.view(qnaNo);

	            if (result == null) {
	                // 조회된 결과가 null이면 예외를 던지거나 다른 적절한 처리를 수행할 수 있습니다.
	                // 여기에서는 예외를 던지도록 수정했습니다.
	                throw new Exception("게시물 조회 결과가 null입니다.");
	            }

	            return result;
	        } else {
	            // dao 객체가 null인 경우에 대한 처리 (예: 로그 출력 등)
	            // 여기에 필요한 예외 처리나 기본적인 동작을 추가하세요.
	            return null; // 또는 예외를 던지거나 다른 적절한 처리를 수행할 수 있습니다.
	        }
	    } catch (Exception e) {
	        // 예외가 발생한 경우에 대한 처리
	        e.printStackTrace(); // 또는 로그 출력 등으로 예외 정보를 확인할 수 있습니다.
	        throw new Exception("게시물 조회 중 오류가 발생했습니다.", e);
	    }
	}




	//게시물 수정
	@Override
	public void modify(qnaBoardVO vo) throws Exception {
		dao.modify(vo);
		
	}
	
	//게시물 삭제
	@Override
	public void delete(int qnaNo) throws Exception {
		dao.delete(qnaNo);
		
	}
	
	//★ 게시물 페이징
	// 1. 게시물 총 갯수
	@Override
	public int count() throws Exception {
		return dao.count();
	}
	
	// 2. 게시물 목록 + 페이징
	@Override
	public List<qnaBoardVO> listPage(int displayPost, int postNum) throws Exception {
		return dao.listPage(displayPost, postNum);
	}

	@Override
	public List<qnaBoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)throws Exception {
		return  dao.listPageSearch(displayPost, postNum, searchType, keyword);
	}

	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		return dao.searchCount(searchType, keyword);
	}
	
	
}
