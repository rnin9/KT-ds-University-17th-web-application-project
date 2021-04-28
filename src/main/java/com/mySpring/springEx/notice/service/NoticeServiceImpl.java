package com.mySpring.springEx.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.common.pagination.mapper.PageMapper;
import com.mySpring.springEx.common.util.FileUtils;
import com.mySpring.springEx.notice.dao.NoticeDAO;
import com.mySpring.springEx.notice.vo.NoticeVO;

@Service("noticeService")
@Transactional(propagation = Propagation.REQUIRED)
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO noticeDAO;

	@Autowired
	public PageMapper pageMapper;

	@Autowired
	private FileUtils fileUtils;


	@Override
	public List listNotice() throws Exception {
		List noticeList = null;
		noticeList = noticeDAO.selectAllNoticeList();
		return noticeList;
	}
	
	public List listFixNotice() throws Exception {
		List noticeList = null;
		noticeList = noticeDAO.selectFixNoticeList();
		return noticeList;
	}
	

	@Override
	public void insertNotice(NoticeVO noticeVO, MultipartHttpServletRequest mpRequest) throws Exception {
		noticeDAO.insertNotice(noticeVO);
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(noticeVO, mpRequest);
		int size = list.size();
		for (int i = 0; i < size; i++) {
			noticeDAO.insertFile(list.get(i));
		}
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public NoticeVO readNotice(int notice_no) throws DataAccessException {
		return noticeDAO.readNotice(notice_no);

	}

//	@Override
//	public void updateNotice(NoticeVO noticeVO) throws DataAccessException {
//		noticeDAO.updateNotice(noticeVO);
//	}

	@Override
	public void deleteNotice(int notice_no) throws DataAccessException {
		noticeDAO.deleteNotice(notice_no);
	}

	@Override
	public List<Map<String, String>> selectFileList(int notice_no) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.selectFileList(notice_no);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {

		return noticeDAO.selectFileInfo(map);
	}

	@Override
	public void updateNotice(NoticeVO noticeVO, String[] files, String[] fileNames,
			MultipartHttpServletRequest mpRequest) throws Exception {

		noticeDAO.updateNotice(noticeVO);

		List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(noticeVO, files, fileNames, mpRequest);

		Map<String, Object> tempMap = null;
		int size = list.size();
		for (int i = 0; i < size; i++) {
			tempMap = list.get(i);
			System.out.println(tempMap);
			if (tempMap.get("IS_NEW").equals("Y")) {
				noticeDAO.insertFile(tempMap);
				System.out.println("정복");
			} else {
				noticeDAO.updateFile(tempMap);

			}
		}
	}
}