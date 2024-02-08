package com.portfolio.jdh.persistence;

import java.util.List;

import com.portfolio.jdh.domain.recommendReplyVO;

public interface recommendReplyDAO {
	// 댓글 조회
	public List<recommendReplyVO> list(int recommendNo) throws Exception;

	// 댓글 작성
	public void write(recommendReplyVO vo) throws Exception;

	// 댓글 수정
	public void modify(recommendReplyVO vo) throws Exception;

	// 댓글 삭제
	public void delete(recommendReplyVO vo) throws Exception;
	
	// 댓글 상세조회
	public recommendReplyVO replySelect(recommendReplyVO vo) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	

}
