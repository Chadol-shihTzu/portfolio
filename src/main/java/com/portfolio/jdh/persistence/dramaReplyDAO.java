package com.portfolio.jdh.persistence;

import java.util.List;

import com.portfolio.jdh.domain.dramaReplyVO;

public interface dramaReplyDAO {
	// 댓글 조회
	public List<dramaReplyVO> list(int dramaNo) throws Exception;

	// 댓글 작성
	public void write(dramaReplyVO vo) throws Exception;

	// 댓글 수정
	public void modify(dramaReplyVO vo) throws Exception;

	// 댓글 삭제
	public void delete(dramaReplyVO vo) throws Exception;
	
	// 댓글 상세조회
	public dramaReplyVO replySelect(dramaReplyVO vo) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	

}
