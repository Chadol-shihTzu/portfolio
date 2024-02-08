package com.portfolio.jdh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.jdh.domain.poemReplyVO;

@Repository 
public class poemReplyDAOImpl implements poemReplyDAO{
	
	@Inject
	private SqlSession sql;

	private static String namespace = "poemboard_reply";

	// 댓글 조회
	@Override
	public List<poemReplyVO> list(int poemNo) throws Exception {
	    return sql.selectList(namespace + ".replyList", poemNo);
	}

	// 댓글 작성
	@Override
	public void write(poemReplyVO vo) throws Exception {
	    sql.insert(namespace + ".replyWrite", vo);
	}

	// 댓글 수정
	@Override
	public void modify(poemReplyVO vo) throws Exception {
	    sql.update(namespace + ".replyModify", vo);
	}

	// 댓글 삭제
	@Override
	public void delete(poemReplyVO vo) throws Exception {
	    sql.delete(namespace + ".replyDelete", vo);
	}
	
	//댓글 상세조회
	@Override
	public poemReplyVO replySelect(poemReplyVO vo) throws Exception {
		return sql.selectOne(namespace+ ".replySelect", vo);
	}
	
	
	
	
	
	
	
	
	
	
}
