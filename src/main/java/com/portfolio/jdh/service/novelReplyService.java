package com.portfolio.jdh.service;

import java.util.List;

import com.portfolio.jdh.domain.novelReplyVO;

public interface novelReplyService {
	// 댓글 조회
	public List<novelReplyVO> list(int novelNo) throws Exception;

	// 댓글 작성
	public void write(novelReplyVO vo) throws Exception;

	// 댓글 수정
	public void modify(novelReplyVO vo) throws Exception;

	// 댓글 삭제
	public novelReplyVO delete(novelReplyVO vo) throws Exception;
	
	//댓글 상세조회
	public novelReplyVO replySelect(novelReplyVO vo) throws Exception;
}
