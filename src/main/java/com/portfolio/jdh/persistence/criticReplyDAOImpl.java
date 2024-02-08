package com.portfolio.jdh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.jdh.domain.criticReplyVO;

@Repository 
public class criticReplyDAOImpl implements criticReplyDAO{
	
	@Inject
	private SqlSession sql;

	private static String namespace = "criticboard_reply";

	// 댓글 조회
	@Override
	public List<criticReplyVO> list(int criticNo) throws Exception {
	    return sql.selectList(namespace + ".replyList", criticNo);
	}

	// 댓글 작성
	@Override
	public void write(criticReplyVO vo) throws Exception {
	    sql.insert(namespace + ".replyWrite", vo);
	}

	// 댓글 수정
	@Override
	public void modify(criticReplyVO vo) throws Exception {
	    sql.update(namespace + ".replyModify", vo);
	}

	// 댓글 삭제
	@Override
	public void delete(criticReplyVO vo) throws Exception {
	    sql.delete(namespace + ".replyDelete", vo);
	}
	
	//댓글 상세조회
	@Override
	public criticReplyVO replySelect(criticReplyVO vo) throws Exception {
		return sql.selectOne(namespace+ ".replySelect", vo);
	}
	
	
	
	
	
	
	
	
	
	
}
