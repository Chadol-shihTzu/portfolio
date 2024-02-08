package com.portfolio.jdh.service;

import java.util.List;

import com.portfolio.jdh.domain.qnaReplyVO;

public interface qnaReplyService {
	// 댓글 조회
	public List<qnaReplyVO> list(int qnaNo) throws Exception;

	// 댓글 작성
	public void write(qnaReplyVO vo) throws Exception;

	// 댓글 수정
	public void modify(qnaReplyVO vo) throws Exception;

	// 댓글 삭제
	public qnaReplyVO delete(qnaReplyVO vo) throws Exception;
	
	//댓글 상세조회
	public qnaReplyVO replySelect(qnaReplyVO vo) throws Exception;
}
