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
	public List SelectAllList() throws Exception {
		// TODO Auto-generated method stub
		List surveyList = null;
		surveyList = surveyDAO.SelectAllList();
		return surveyList;
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
	public CourseVO writeSurvey(String courseID) throws Exception {
		CourseVO courseVO = surveyDAO.writeSurvey(courseID);
		return courseVO;
	}

	@Override
	public List check_suerveyQuestion() throws DataAccessException {
		List questionList = null;
		questionList = surveyDAO.check_suerveyQuestion();
		return questionList;
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

	@Override
	public SurveyVO listSurveyInfo(String courseID) {
		SurveyVO surveyVO = surveyDAO.listSurveyInfo(courseID);
		return surveyVO;
	}

	@Override
	public int modifySurvey(SurveyVO surveyVO) {
		return surveyDAO.modifySurvey(surveyVO);
	}

	@Override
	public List detailList(String courseID) throws Exception {
		List detailList = null;
		detailList = surveyDAO.detailList(courseID);
		return detailList;
	}

	@Override
	public SurveyVO surveyVO(String courseID) {
		SurveyVO surveyVO = surveyDAO.surveyVO(courseID);
		return surveyVO;
	}

	@Override
	public DetailVO countParticipate(String courseID) {
		DetailVO detailVO = surveyDAO.countParticipate(courseID);
		return detailVO;
	}

	// graph information ajax
	@Override
	public List<Map<String, Object>> infoGraph(String courseID) throws Exception {
		return surveyDAO.getInfoGraph(courseID);
	}

	@Override
	public List<Map<String, Object>> infoGraph2(String courseID) throws Exception {
		return surveyDAO.getInfoGraph2(courseID);
	}

	@Override
	public List<Map<String, Object>> infoGraph3(String courseID) throws Exception {
		return surveyDAO.getInfoGraph3(courseID);
	}

	@Override
	public List<Map<String, Object>> infoGraph4(String courseID) throws Exception {
		return surveyDAO.getInfoGraph4(courseID);
	}

	@Override
	public List<Map<String, Object>> infoGraph5(String courseID) throws Exception {
		return surveyDAO.getInfoGraph5(courseID);
	}

	@Override
	public List<Map<String, Object>> infoGraph6(String courseID) throws Exception {
		return surveyDAO.getInfoGraph6(courseID);
	}

	@Override
	public List<Map<String, Object>> infoGraph7(String courseID) throws Exception {
		return surveyDAO.getInfoGraph7(courseID);
	}

	@Override
	public List<Map<String, Object>> infoGraph8(String courseID) throws Exception {
		return surveyDAO.getInfoGraph8(courseID);
	}

	@Override
	public List<Map<String, Object>> infoGraph9(String courseID) throws Exception {
		return surveyDAO.getInfoGraph9(courseID);
	}

	@Override
	public List<Map<String, Object>> infoGraph10(String courseID) throws Exception {
		return surveyDAO.getInfoGraph10(courseID);
	}

	@Override
	public List<Map<String, Object>> infoGraph11(String courseID) throws Exception {
		return surveyDAO.getInfoGraph11(courseID);
	}

	@Override
	public List<Map<String, Object>> infoGraph12(String courseID) throws Exception {
		return surveyDAO.getInfoGraph12(courseID);
	}

	@Override
	public List<Map<String, Object>> infoGraph13(String courseID) throws Exception {
		return surveyDAO.getInfoGraph13(courseID);
	}

	@Override
	public List<Map<String, Object>> infoGraph14(String courseID) throws Exception {
		return surveyDAO.getInfoGraph14(courseID);
	}

	@Override
	public List<Map<String, Object>> infoGraph15(String courseID) throws Exception {
		return surveyDAO.getInfoGraph15(courseID);
	}
	
	@Override
	public List<Map<String, Object>> infoGraph16(String courseID) throws Exception {
		return surveyDAO.getInfoGraph16(courseID);
	}
	
	@Override
	public List<Map<String, Object>> infoGraph17(String courseID) throws Exception {
		return surveyDAO.getInfoGraph17(courseID);
	}


	@Override
	public CourseTakeVO Allperson(String courseID) {
		CourseTakeVO AllPerson = surveyDAO.Allperson(courseID);
		return AllPerson;
	}


	@Override
	public List AllPersonId(String courseID) {
		List AllPersonId = null;
		AllPersonId = surveyDAO.AllPersonId(courseID);
		return AllPersonId;
	}


	@Override
	public CourseTakeVO dontParticipateAllPerson(String courseID) {
		CourseTakeVO dontParticipateAllPerson = surveyDAO.dontParticipateAllPerson(courseID);
		return dontParticipateAllPerson;
	}


	@Override
	public List dontParticipateAllPersonId(String courseID) {
		List dontParticipateAllPersonId = null;
		dontParticipateAllPersonId = surveyDAO.dontParticipateAllPersonId(courseID);
		return dontParticipateAllPersonId;
	}

}
