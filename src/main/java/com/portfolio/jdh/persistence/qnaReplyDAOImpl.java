package com.portfolio.jdh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.jdh.domain.qnaReplyVO;

@Repository 
public class qnaReplyDAOImpl implements qnaReplyDAO{
	
	@Inject
	private SqlSession sql;

	private static String namespace = "qnaboard_reply";

	// 댓글 조회
	@Override
	public List<qnaReplyVO> list(int qnaNo) throws Exception {
	    return sql.selectList(namespace + ".replyList", qnaNo);
	}

	// 댓글 작성
	@Override
	public void write(qnaReplyVO vo) throws Exception {
	    sql.insert(namespace + ".replyWrite", vo);
	}

	// 댓글 수정
	@Override
	public void modify(qnaReplyVO vo) throws Exception {
	    sql.update(namespace + ".replyModify", vo);
	}

	// 댓글 삭제
	@Override
	public void delete(qnaReplyVO vo) throws Exception {
	    sql.delete(namespace + ".replyDelete", vo);
	}
	
	//댓글 상세조회
	@Override
	public qnaReplyVO replySelect(qnaReplyVO vo) throws Exception {
		return sql.selectOne(namespace+ ".replySelect", vo);
	}
	
	
	
	
	
	
	
	
	
	
}
