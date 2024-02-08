package com.portfolio.jdh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.portfolio.jdh.domain.photoReplyVO;

@Repository 
public class photoReplyDAOImpl implements photoReplyDAO{
	
	@Inject
	private SqlSession sql;

	private static String namespace = "photoboard_reply";

	// 댓글 조회
	@Override
	public List<photoReplyVO> list(int photoNo) throws Exception {
	    return sql.selectList(namespace + ".replyList", photoNo);
	}

	// 댓글 작성
	@Override
	public void write(photoReplyVO vo) throws Exception {
	    sql.insert(namespace + ".replyWrite", vo);
	}

	// 댓글 수정
	@Override
	public void modify(photoReplyVO vo) throws Exception {
	    sql.update(namespace + ".replyModify", vo);
	}

	// 댓글 삭제
	@Override
	public void delete(photoReplyVO vo) throws Exception {
	    sql.delete(namespace + ".replyDelete", vo);
	}
	
	//댓글 상세조회
	@Override
	public photoReplyVO replySelect(photoReplyVO vo) throws Exception {
		return sql.selectOne(namespace+ ".replySelect", vo);
	}
	
	
	
	
	
	
	
	
	
	
}
