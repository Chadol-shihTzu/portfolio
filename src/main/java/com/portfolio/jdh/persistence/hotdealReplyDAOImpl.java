package com.portfolio.jdh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.jdh.domain.hotdealReplyVO;

@Repository 
public class hotdealReplyDAOImpl implements hotdealReplyDAO{
	
	@Inject
	private SqlSession sql;

	private static String namespace = "hotdealboard_reply";

	// 댓글 조회
	@Override
	public List<hotdealReplyVO> list(int hotNo) throws Exception {
	    return sql.selectList(namespace + ".replyList", hotNo);
	}

	// 댓글 작성
	@Override
	public void write(hotdealReplyVO vo) throws Exception {
	    sql.insert(namespace + ".replyWrite", vo);
	}

	// 댓글 수정
	@Override
	public void modify(hotdealReplyVO vo) throws Exception {
	    sql.update(namespace + ".replyModify", vo);
	}

	// 댓글 삭제
	@Override
	public void delete(hotdealReplyVO vo) throws Exception {
	    sql.delete(namespace + ".replyDelete", vo);
	}
	
	//댓글 상세조회
	@Override
	public hotdealReplyVO replySelect(hotdealReplyVO vo) throws Exception {
		return sql.selectOne(namespace+ ".replySelect", vo);
	}
	
	
	
	
	
	
	
	
	
	
}
