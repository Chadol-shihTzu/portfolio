package com.portfolio.jdh.persistence;

import java.util.List;

import com.portfolio.jdh.domain.hotdealReplyVO;

public interface hotdealReplyDAO {
	// 댓글 조회
	public List<hotdealReplyVO> list(int hotNo) throws Exception;

	// 댓글 작성
	public void write(hotdealReplyVO vo) throws Exception;

	// 댓글 수정
	public void modify(hotdealReplyVO vo) throws Exception;

	// 댓글 삭제
	public void delete(hotdealReplyVO vo) throws Exception;
	
	// 댓글 상세조회
	public hotdealReplyVO replySelect(hotdealReplyVO vo) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	

}
