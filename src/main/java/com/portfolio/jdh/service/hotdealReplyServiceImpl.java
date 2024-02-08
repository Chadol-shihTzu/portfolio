package com.portfolio.jdh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.portfolio.jdh.domain.hotdealReplyVO;
import com.portfolio.jdh.persistence.hotdealReplyDAO;

@Service
public class hotdealReplyServiceImpl implements hotdealReplyService{
	
	@Inject
	private hotdealReplyDAO dao;

	// ��� ��ȸ
	@Override
	public List<hotdealReplyVO> list(int hotNo) throws Exception {
	    return dao.list(hotNo);
	}

	@Override
	public void write(hotdealReplyVO vo) throws Exception {
	    dao.write(vo);
	}

	@Override
	public void modify(hotdealReplyVO vo) throws Exception {
	    dao.modify(vo);
	}
	@Override
	public hotdealReplyVO delete(hotdealReplyVO vo) throws Exception {
		dao.delete(vo);
		return vo;
	}


	@Override
	public hotdealReplyVO replySelect(hotdealReplyVO vo) throws Exception {
		return dao.replySelect(vo);
	}
	
	
	
	

}
