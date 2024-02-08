package com.portfolio.jdh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.portfolio.jdh.domain.qnaReplyVO;
import com.portfolio.jdh.persistence.qnaReplyDAO;

@Service
public class qnaReplyServiceImpl implements qnaReplyService{
	
	@Inject
	private qnaReplyDAO dao;

	// ��� ��ȸ
	@Override
	public List<qnaReplyVO> list(int qnaNo) throws Exception {
	    return dao.list(qnaNo);
	}

	@Override
	public void write(qnaReplyVO vo) throws Exception {
	    dao.write(vo);
	}

	@Override
	public void modify(qnaReplyVO vo) throws Exception {
	    dao.modify(vo);
	}
	@Override
	public qnaReplyVO delete(qnaReplyVO vo) throws Exception {
		dao.delete(vo);
		return vo;
	}


	@Override
	public qnaReplyVO replySelect(qnaReplyVO vo) throws Exception {
		return dao.replySelect(vo);
	}
	
	
	
	

}
