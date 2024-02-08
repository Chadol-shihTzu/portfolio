package com.portfolio.jdh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.portfolio.jdh.domain.novelReplyVO;
import com.portfolio.jdh.persistence.novelReplyDAO;

@Service
public class novelReplyServiceImpl implements novelReplyService{
	
	@Inject
	private novelReplyDAO dao;

	// ��� ��ȸ
	@Override
	public List<novelReplyVO> list(int novelNo) throws Exception {
	    return dao.list(novelNo);
	}

	@Override
	public void write(novelReplyVO vo) throws Exception {
	    dao.write(vo);
	}

	@Override
	public void modify(novelReplyVO vo) throws Exception {
	    dao.modify(vo);
	}
	@Override
	public novelReplyVO delete(novelReplyVO vo) throws Exception {
		dao.delete(vo);
		return vo;
	}


	@Override
	public novelReplyVO replySelect(novelReplyVO vo) throws Exception {
		return dao.replySelect(vo);
	}
	
	
	
	

}
