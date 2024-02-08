package com.portfolio.jdh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.jdh.domain.dramaReplyVO;

@Repository 
public class dramaReplyDAOImpl implements dramaReplyDAO{
	
	@Inject
	private SqlSession sql;

	private static String namespace = "dramaboard_reply";

	// 댓글 조회
	@Override
	public List<dramaReplyVO> list(int dramaNo) throws Exception {
	    return sql.selectList(namespace + ".replyList", dramaNo);
	}

	// 댓글 작성
	@Override
	public void write(dramaReplyVO vo) throws Exception {
	    sql.insert(namespace + ".replyWrite", vo);
	}

	// 댓글 수정
	@Override
	public void modify(dramaReplyVO vo) throws Exception {
	    sql.update(namespace + ".replyModify", vo);
	}

	// 댓글 삭제
	@Override
	public void delete(dramaReplyVO vo) throws Exception {
	    sql.delete(namespace + ".replyDelete", vo);
	}
	
	//댓글 상세조회
	@Override
	public dramaReplyVO replySelect(dramaReplyVO vo) throws Exception {
		return sql.selectOne(namespace+ ".replySelect", vo);
	}
	
	
	
	
	
	
	
	
	
	
}
