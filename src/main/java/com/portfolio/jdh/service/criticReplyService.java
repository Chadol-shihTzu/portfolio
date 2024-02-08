package com.portfolio.jdh.service;

import java.util.List;

import com.portfolio.jdh.domain.criticReplyVO;

public interface criticReplyService {
	// 댓글 조회
	public List<criticReplyVO> list(int criticNo) throws Exception;

	// 댓글 작성
	public void write(criticReplyVO vo) throws Exception;

	// 댓글 수정
	public void modify(criticReplyVO vo) throws Exception;

	// 댓글 삭제
	public criticReplyVO delete(criticReplyVO vo) throws Exception;
	
	//댓글 상세조회
	public criticReplyVO replySelect(criticReplyVO vo) throws Exception;
}
