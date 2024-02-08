package com.portfolio.jdh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.portfolio.jdh.domain.dramaReplyVO;
import com.portfolio.jdh.persistence.dramaReplyDAO;

@Service
public class dramaReplyServiceImpl implements dramaReplyService{
	
	@Inject
	private dramaReplyDAO dao;

	// ��� ��ȸ
	@Override
	public List<dramaReplyVO> list(int dramaNo) throws Exception {
	    return dao.list(dramaNo);
	}

	@Override
	public void write(dramaReplyVO vo) throws Exception {
	    dao.write(vo);
	}

	@Override
	public void modify(dramaReplyVO vo) throws Exception {
	    dao.modify(vo);
	}
	@Override
	public dramaReplyVO delete(dramaReplyVO vo) throws Exception {
		dao.delete(vo);
		return vo;
	}


	@Override
	public dramaReplyVO replySelect(dramaReplyVO vo) throws Exception {
		return dao.replySelect(vo);
	}
	
	
	
	

}
