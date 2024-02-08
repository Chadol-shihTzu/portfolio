package com.portfolio.jdh.persistence;

import java.util.List;

import com.portfolio.jdh.domain.photoReplyVO;

public interface photoReplyDAO {
	// 댓글 조회
	public List<photoReplyVO> list(int photoNo) throws Exception;

	// 댓글 작성
	public void write(photoReplyVO vo) throws Exception;

	// 댓글 수정
	public void modify(photoReplyVO vo) throws Exception;

	// 댓글 삭제
	public void delete(photoReplyVO vo) throws Exception;
	
	// 댓글 상세조회
	public photoReplyVO replySelect(photoReplyVO vo) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	

}
