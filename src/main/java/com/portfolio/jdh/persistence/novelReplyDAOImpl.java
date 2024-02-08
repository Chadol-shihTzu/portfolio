package com.portfolio.jdh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.jdh.domain.novelReplyVO;

@Repository 
public class novelReplyDAOImpl implements novelReplyDAO{
	
	@Inject
	private SqlSession sql;

	private static String namespace = "novelboard_reply";

	// 댓글 조회
	@Override
	public List<novelReplyVO> list(int novelNo) throws Exception {
	    return sql.selectList(namespace + ".replyList", novelNo);
	}

	// 댓글 작성
	@Override
	public void write(novelReplyVO vo) throws Exception {
	    sql.insert(namespace + ".replyWrite", vo);
	}

	// 댓글 수정
	@Override
	public void modify(novelReplyVO vo) throws Exception {
	    sql.update(namespace + ".replyModify", vo);
	}

	// 댓글 삭제
	@Override
	public void delete(novelReplyVO vo) throws Exception {
	    sql.delete(namespace + ".replyDelete", vo);
	}
	
	//댓글 상세조회
	@Override
	public novelReplyVO replySelect(novelReplyVO vo) throws Exception {
		return sql.selectOne(namespace+ ".replySelect", vo);
	}
	
	
	
	
	
	
	
	
	
	
}
