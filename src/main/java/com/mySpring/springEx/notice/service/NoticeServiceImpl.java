package com.mySpring.springEx.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.common.pagination.mapper.PageMapper;
import com.mySpring.springEx.notice.dao.NoticeDAO;
import com.mySpring.springEx.notice.vo.NoticeVO;

@Service("noticeService")
@Transactional(propagation = Propagation.REQUIRED)
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Override
	public void insertNotice(NoticeVO noticeVO) throws DataAccessException {

		noticeDAO.insertNotice(noticeVO);
	}

	@Override
	public NoticeVO readNotice(int notice_no) throws DataAccessException {

		return noticeDAO.readNotice(notice_no);

	}

	@Override
	public void updateNotice(NoticeVO noticeVO) throws DataAccessException {
		noticeDAO.updateNotice(noticeVO);
	}

	@Override
	public void deleteNotice(int notice_no) throws DataAccessException {
		noticeDAO.deleteNotice(notice_no);
	}
	
	
	
	
}
