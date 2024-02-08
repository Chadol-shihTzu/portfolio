package com.portfolio.jdh.service;

import java.util.List;

import com.portfolio.jdh.domain.paintReplyVO;

public interface paintReplyService {
	// 댓글 조회
	public List<paintReplyVO> list(int paintNo) throws Exception;

	// 댓글 작성
	public void write(paintReplyVO vo) throws Exception;

	// 댓글 수정
	public void modify(paintReplyVO vo) throws Exception;

	// 댓글 삭제
	public paintReplyVO delete(paintReplyVO vo) throws Exception;
	
	//댓글 상세조회
	public paintReplyVO replySelect(paintReplyVO vo) throws Exception;
}
