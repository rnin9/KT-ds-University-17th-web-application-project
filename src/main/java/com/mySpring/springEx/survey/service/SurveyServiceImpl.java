package com.mySpring.springEx.survey.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mySpring.springEx.common.pagination.Pagination;
import com.mySpring.springEx.common.pagination.mapper.PageMapper;
import com.mySpring.springEx.course.vo.CourseVO;
import com.mySpring.springEx.courseTake.vo.CourseTakeVO;
import com.mySpring.springEx.notice.vo.NoticeVO;
import com.mySpring.springEx.survey.dao.SurveyDAO;
import com.mySpring.springEx.survey.vo.DetailVO;
import com.mySpring.springEx.survey.vo.SurveyVO;

@Service("surveyService")
@Transactional(propagation = Propagation.REQUIRED)
public class SurveyServiceImpl implements SurveyService {
	@Autowired
	private SurveyDAO surveyDAO;

	@Autowired
	public PageMapper pageMapper;

	/*
	 * @Override public List listSurvey() throws DataAccessException { List
	 * surveyList = null; surveyList = surveyDAO.selectAllSurveyList(); return
	 * surveyList; }
	 */

	@Override
	public List<Map<String, Object>> SelectAllList() throws Exception {
		// TODO Auto-generated method stub
		return pageMapper.SelectAllList();
	}

	@Override
	public List<Map<String, Object>> SelectAllList(Pagination pagination) throws Exception {
		// TODO Auto-generated method stub
		return pageMapper.SelectAllList(pagination);
	}

	@Override
	public int testTableCount() throws Exception {
		// TODO Auto-generated method stub
		return pageMapper.testTableCount();
	}

	@Override
	public int addSurvey(SurveyVO survey) throws DataAccessException {
		return surveyDAO.insertSurvey(survey);
	}

	// 설문조사삭제
	@Override
	public int removeSurvey(String survey_Id) throws DataAccessException {
		return surveyDAO.deleteSurvey(survey_Id);
	}

	@Override
	public List<Map<String, Object>> SelectInsertList() throws Exception {
		return pageMapper.SelectAllList2();
	}

	@Override
	public CourseTakeVO selectAllSurveylist(String userID, String courseID) {
		CourseTakeVO courseTakeVO = surveyDAO.selectAllSurveylist(userID, courseID);
		return courseTakeVO;
	}

	@Override
	public void insertSurvey(DetailVO detailVO) throws DataAccessException {

		surveyDAO.insertSurvey(detailVO);
	}

	@Override
	public CourseVO writeSurvey(String syllabusID) throws Exception {
		CourseVO courseVO = surveyDAO.writeSurvey(syllabusID);
		return courseVO;
	}

	@Override
	public void surveyInsert(SurveyVO surveyVO) {
		surveyDAO.surveyInsert(surveyVO);
	}

	@Override
	public SurveyVO getQuestion(String courseID) throws Exception {
		SurveyVO surveyVO = surveyDAO.getQuestion(courseID);
		return surveyVO;
	}

}
