package com.portfolio.jdh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.portfolio.jdh.domain.photoReplyVO;
import com.portfolio.jdh.persistence.photoReplyDAO;

@Service
public class photoReplyServiceImpl implements photoReplyService{
	
	@Inject
	private photoReplyDAO dao;

	// ��� ��ȸ
	@Override
	public List<photoReplyVO> list(int photoNo) throws Exception {
	    return dao.list(photoNo);
	}

	@Override
	public void write(photoReplyVO vo) throws Exception {
	    dao.write(vo);
	}

	@Override
	public void modify(photoReplyVO vo) throws Exception {
	    dao.modify(vo);
	}
	@Override
	public photoReplyVO delete(photoReplyVO vo) throws Exception {
		dao.delete(vo);
		return vo;
	}


	@Override
	public photoReplyVO replySelect(photoReplyVO vo) throws Exception {
		return dao.replySelect(vo);
	}
	
	
	
	

}
