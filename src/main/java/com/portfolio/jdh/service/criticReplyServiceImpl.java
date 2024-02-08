package com.portfolio.jdh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.portfolio.jdh.domain.criticReplyVO;
import com.portfolio.jdh.persistence.criticReplyDAO;

@Service
public class criticReplyServiceImpl implements criticReplyService{
	
	@Inject
	private criticReplyDAO dao;

	// ��� ��ȸ
	@Override
	public List<criticReplyVO> list(int criticNo) throws Exception {
	    return dao.list(criticNo);
	}

	@Override
	public void write(criticReplyVO vo) throws Exception {
	    dao.write(vo);
	}

	@Override
	public void modify(criticReplyVO vo) throws Exception {
	    dao.modify(vo);
	}
	@Override
	public criticReplyVO delete(criticReplyVO vo) throws Exception {
		dao.delete(vo);
		return vo;
	}


	@Override
	public criticReplyVO replySelect(criticReplyVO vo) throws Exception {
		return dao.replySelect(vo);
	}
	
	
	
	

}
