package com.portfolio.jdh.persistence;

import java.util.List;

import com.portfolio.jdh.domain.poemReplyVO;

public interface poemReplyDAO {
	// 댓글 조회
	public List<poemReplyVO> list(int poemNo) throws Exception;

	// 댓글 작성
	public void write(poemReplyVO vo) throws Exception;

	// 댓글 수정
	public void modify(poemReplyVO vo) throws Exception;

	// 댓글 삭제
	public void delete(poemReplyVO vo) throws Exception;
	
	// 댓글 상세조회
	public poemReplyVO replySelect(poemReplyVO vo) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	

}
