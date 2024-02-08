package com.portfolio.jdh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.portfolio.jdh.domain.paintReplyVO;
import com.portfolio.jdh.persistence.paintReplyDAO;

@Service
public class paintReplyServiceImpl implements paintReplyService{
	
	@Inject
	private paintReplyDAO dao;

	// ��� ��ȸ
	@Override
	public List<paintReplyVO> list(int paintNo) throws Exception {
	    return dao.list(paintNo);
	}

	@Override
	public void write(paintReplyVO vo) throws Exception {
	    dao.write(vo);
	}

	@Override
	public void modify(paintReplyVO vo) throws Exception {
	    dao.modify(vo);
	}
	@Override
	public paintReplyVO delete(paintReplyVO vo) throws Exception {
		dao.delete(vo);
		return vo;
	}


	@Override
	public paintReplyVO replySelect(paintReplyVO vo) throws Exception {
		return dao.replySelect(vo);
	}
	
	
	
	

}
