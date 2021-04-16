package com.mySpring.springEx.notice.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.notice.vo.NoticeVO;


public interface NoticeDAO {
	public List selectAllNoticeList() throws DataAccessException;
	public void insertNotice(NoticeVO noticeVO) throws DataAccessException ;
	public NoticeVO readNotice(int notice_no)throws DataAccessException ;
	public void updateNotice(NoticeVO noticeVO)throws DataAccessException ;
	public void deleteNotice(int notice_no)throws DataAccessException;
	

}
