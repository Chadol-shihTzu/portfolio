package com.portfolio.jdh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.jdh.domain.essayReplyVO;

@Repository 
public class essayReplyDAOImpl implements essayReplyDAO{
	
	@Inject
	private SqlSession sql;

	private static String namespace = "essayboard_reply";

	// 댓글 조회
	@Override
	public List<essayReplyVO> list(int essayNo) throws Exception {
	    return sql.selectList(namespace + ".replyList", essayNo);
	}

	// 댓글 작성
	@Override
	public void write(essayReplyVO vo) throws Exception {
	    sql.insert(namespace + ".replyWrite", vo);
	}

	// 댓글 수정
	@Override
	public void modify(essayReplyVO vo) throws Exception {
	    sql.update(namespace + ".replyModify", vo);
	}

	// 댓글 삭제
	@Override
	public void delete(essayReplyVO vo) throws Exception {
	    sql.delete(namespace + ".replyDelete", vo);
	}
	
	//댓글 상세조회
	@Override
	public essayReplyVO replySelect(essayReplyVO vo) throws Exception {
		return sql.selectOne(namespace+ ".replySelect", vo);
	}
	
	
	
	
	
	
	
	
	
	
}
