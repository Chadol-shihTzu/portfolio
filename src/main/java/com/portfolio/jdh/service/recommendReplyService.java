package com.portfolio.jdh.service;

import java.util.List;

import com.portfolio.jdh.domain.recommendReplyVO;

public interface recommendReplyService {
	// 댓글 조회
	public List<recommendReplyVO> list(int recommendNo) throws Exception;

	// 댓글 작성
	public void write(recommendReplyVO vo) throws Exception;

	// 댓글 수정
	public void modify(recommendReplyVO vo) throws Exception;

	// 댓글 삭제
	public recommendReplyVO delete(recommendReplyVO vo) throws Exception;
	
	//댓글 상세조회
	public recommendReplyVO replySelect(recommendReplyVO vo) throws Exception;
}
