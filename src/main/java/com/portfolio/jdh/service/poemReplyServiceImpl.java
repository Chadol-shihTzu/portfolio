package com.portfolio.jdh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.portfolio.jdh.domain.poemReplyVO;
import com.portfolio.jdh.persistence.poemReplyDAO;

@Service
public class poemReplyServiceImpl implements poemReplyService{
	
	@Inject
	private poemReplyDAO dao;

	// ��� ��ȸ
	@Override
	public List<poemReplyVO> list(int poemNo) throws Exception {
	    return dao.list(poemNo);
	}

	@Override
	public void write(poemReplyVO vo) throws Exception {
	    dao.write(vo);
	}

	@Override
	public void modify(poemReplyVO vo) throws Exception {
	    dao.modify(vo);
	}
	@Override
	public poemReplyVO delete(poemReplyVO vo) throws Exception {
		dao.delete(vo);
		return vo;
	}


	@Override
	public poemReplyVO replySelect(poemReplyVO vo) throws Exception {
		return dao.replySelect(vo);
	}
	
	
	
	

}
