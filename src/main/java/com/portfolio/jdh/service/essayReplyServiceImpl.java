package com.portfolio.jdh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.portfolio.jdh.domain.essayReplyVO;
import com.portfolio.jdh.persistence.essayReplyDAO;

@Service
public class essayReplyServiceImpl implements essayReplyService{
	
	@Inject
	private essayReplyDAO dao;

	// ��� ��ȸ
	@Override
	public List<essayReplyVO> list(int essayNo) throws Exception {
	    return dao.list(essayNo);
	}

	@Override
	public void write(essayReplyVO vo) throws Exception {
	    dao.write(vo);
	}

	@Override
	public void modify(essayReplyVO vo) throws Exception {
	    dao.modify(vo);
	}
	@Override
	public essayReplyVO delete(essayReplyVO vo) throws Exception {
		dao.delete(vo);
		return vo;
	}


	@Override
	public essayReplyVO replySelect(essayReplyVO vo) throws Exception {
		return dao.replySelect(vo);
	}
	
	
	
	

}
