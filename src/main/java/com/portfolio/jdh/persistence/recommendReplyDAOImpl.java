package com.portfolio.jdh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.jdh.domain.recommendReplyVO;

@Repository 
public class recommendReplyDAOImpl implements recommendReplyDAO{
	
	@Inject
	private SqlSession sql;

	private static String namespace = "recommendboard_reply";

	// 댓글 조회
	@Override
	public List<recommendReplyVO> list(int recommendNo) throws Exception {
	    return sql.selectList(namespace + ".replyList", recommendNo);
	}

	// 댓글 작성
	@Override
	public void write(recommendReplyVO vo) throws Exception {
	    sql.insert(namespace + ".replyWrite", vo);
	}

	// 댓글 수정
	@Override
	public void modify(recommendReplyVO vo) throws Exception {
	    sql.update(namespace + ".replyModify", vo);
	}

	// 댓글 삭제
	@Override
	public void delete(recommendReplyVO vo) throws Exception {
	    sql.delete(namespace + ".replyDelete", vo);
	}
	
	//댓글 상세조회
	@Override
	public recommendReplyVO replySelect(recommendReplyVO vo) throws Exception {
		return sql.selectOne(namespace+ ".replySelect", vo);
	}
	
	
	
	
	
	
	
	
	
	
}
