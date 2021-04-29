package com.mySpring.springEx.notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.mySpring.springEx.notice.vo.NoticeVO;


public interface NoticeDAO {
	public List selectAllNoticeList() throws DataAccessException;
	public List selectFixNoticeList() throws DataAccessException;
	public void insertNotice(NoticeVO noticeVO) throws DataAccessException ;
	public NoticeVO readNotice(int notice_no)throws DataAccessException ;
	public void updateNotice(NoticeVO noticeVO)throws DataAccessException ;
	public void deleteNotice(int notice_no)throws DataAccessException;
	public int noticeHit(int notice_no)throws DataAccessException;
	public void insertFile(Map<String, Object> map) throws Exception;
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	public List<Map<String, String>> selectFileList(int notice_no) throws Exception;
	public void updateFile(Map<String, Object> map) throws Exception;
}
