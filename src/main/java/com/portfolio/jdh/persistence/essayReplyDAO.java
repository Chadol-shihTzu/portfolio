package com.portfolio.jdh.persistence;

import java.util.List;

import com.portfolio.jdh.domain.essayReplyVO;

public interface essayReplyDAO {
	// 댓글 조회
	public List<essayReplyVO> list(int essayNo) throws Exception;

	// 댓글 작성
	public void write(essayReplyVO vo) throws Exception;

	// 댓글 수정
	public void modify(essayReplyVO vo) throws Exception;

	// 댓글 삭제
	public void delete(essayReplyVO vo) throws Exception;
	
	// 댓글 상세조회
	public essayReplyVO replySelect(essayReplyVO vo) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	

}
