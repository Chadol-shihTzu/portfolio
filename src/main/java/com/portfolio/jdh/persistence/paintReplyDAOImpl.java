package com.portfolio.jdh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.jdh.domain.paintReplyVO;

@Repository 
public class paintReplyDAOImpl implements paintReplyDAO{
	
	@Inject
	private SqlSession sql;

	private static String namespace = "paintboard_reply";

	// 댓글 조회
	@Override
	public List<paintReplyVO> list(int paintNo) throws Exception {
	    return sql.selectList(namespace + ".replyList", paintNo);
	}

	// 댓글 작성
	@Override
	public void write(paintReplyVO vo) throws Exception {
	    sql.insert(namespace + ".replyWrite", vo);
	}

	// 댓글 수정
	@Override
	public void modify(paintReplyVO vo) throws Exception {
	    sql.update(namespace + ".replyModify", vo);
	}

	// 댓글 삭제
	@Override
	public void delete(paintReplyVO vo) throws Exception {
	    sql.delete(namespace + ".replyDelete", vo);
	}
	
	//댓글 상세조회
	@Override
	public paintReplyVO replySelect(paintReplyVO vo) throws Exception {
		return sql.selectOne(namespace+ ".replySelect", vo);
	}
	
	
	
	
	
	
	
	
	
	
}
