package com.portfolio.jdh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.portfolio.jdh.domain.recommendReplyVO;
import com.portfolio.jdh.persistence.recommendReplyDAO;

@Service
public class recommendReplyServiceImpl implements recommendReplyService{
	
	@Inject
	private recommendReplyDAO dao;

	// ��� ��ȸ
	@Override
	public List<recommendReplyVO> list(int recommendNo) throws Exception {
	    return dao.list(recommendNo);
	}

	@Override
	public void write(recommendReplyVO vo) throws Exception {
	    dao.write(vo);
	}

	@Override
	public void modify(recommendReplyVO vo) throws Exception {
	    dao.modify(vo);
	}
	@Override
	public recommendReplyVO delete(recommendReplyVO vo) throws Exception {
		dao.delete(vo);
		return vo;
	}


	@Override
	public recommendReplyVO replySelect(recommendReplyVO vo) throws Exception {
		return dao.replySelect(vo);
	}
	
	
	
	

}
