package com.mySpring.springEx.notice.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.mySpring.springEx.notice.vo.NoticeVO;

@Repository("noticeDAO")
public class NoticeDAOImpl implements NoticeDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllNoticeList() throws DataAccessException {
		List<NoticeVO> noticeList = null;
		noticeList = sqlSession.selectList("mapper.notice.selectAllNoticeList");
		return noticeList;
	}
	
	@Override
	public List selectFixNoticeList() throws DataAccessException {
		List<NoticeVO> noticeList = null;
		noticeList = sqlSession.selectList("mapper.notice.selectFixNoticeList");
		return noticeList;
	}

	@Override
	public void insertNotice(NoticeVO noticeVO) throws DataAccessException {
		sqlSession.insert("mapper.notice.insertNotice", noticeVO);

	}

	@Override
	public NoticeVO readNotice(int notice_no) throws DataAccessException {
		return sqlSession.selectOne("mapper.notice.readNotice", notice_no);
	}

	@Override
	public void updateNotice(NoticeVO noticeVO) throws DataAccessException {
		sqlSession.update("mapper.notice.updateNotice", noticeVO);
	}

	@Override
	public void deleteNotice(int notice_no) throws DataAccessException {
		sqlSession.delete("mapper.notice.deleteNotice", notice_no);
	}

	@Override
	public int noticeHit(int notice_no) throws DataAccessException {
		return sqlSession.update("mapper.notice.noticeHit", notice_no);
	}

	@Override
	public void insertFile(Map<String, Object> map) throws Exception {

		sqlSession.insert("mapper.notice.insertFile", map);
	}
	
	@Override
	public List<Map<String, String>> selectFileList(int notice_no) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mapper.notice.selectFileList", notice_no);
	}
	
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {

		return sqlSession.selectOne("mapper.notice.selectFileInfo", map);
	}
	
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
		sqlSession.update("mapper.notice.updateFile", map);
	}

}
